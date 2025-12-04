const std = @import("std");
const k8s = @import("k8s");
const meta_v1 = k8s.io.k8s.apimachinery.pkg.apis.meta.v1;
const apps_v1 = k8s.io.k8s.api.apps.v1;
const core_v1 = k8s.io.k8s.api.core.v1;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the client.
    var client = try k8s.Client.init(allocator, .{}, .{ .base_url = "http://127.0.0.1:8001" });
    defer client.deinit();

    const namespace = "default";
    const deployment_name = "patch-demo-deployment";

    // 1. Create a Deployment
    std.debug.print("Creating deployment {s}...\n", .{deployment_name});

    var labels_map = std.json.ObjectMap.init(allocator);
    defer labels_map.deinit();
    try labels_map.put("app", .{ .string = "patch-demo" });
    const labels_value = std.json.Value{ .object = labels_map };

    const container = core_v1.Container{
        .name = "nginx",
        .image = "nginx:1.14.2",
    };

    const deployment = apps_v1.Deployment{
        .apiVersion = "apps/v1",
        .kind = "Deployment",
        .metadata = meta_v1.ObjectMeta{
            .name = deployment_name,
            .labels = labels_value,
        },
        .spec = apps_v1.DeploymentSpec{
            .replicas = 1,
            .selector = meta_v1.LabelSelector{
                .matchLabels = labels_value,
            },
            .template = core_v1.PodTemplateSpec{
                .metadata = meta_v1.ObjectMeta{
                    .labels = labels_value,
                },
                .spec = core_v1.PodSpec{
                    .containers = &[_]core_v1.Container{container},
                },
            },
        },
    };

    // Call createAppsV1NamespacedDeployment
    // createAppsV1NamespacedDeployment(namespace, body, options)
    const create_result = try client.createAppsV1NamespacedDeployment(namespace, deployment, .{});
    switch (create_result) {
        .created => |response| {
            defer response.arena.deinit();
            std.debug.print("Deployment created.\n", .{});
        },
        .ok => |response| {
            defer response.arena.deinit();
            std.debug.print("Deployment created (ok).\n", .{});
        },
        .accepted => |response| {
            defer response.arena.deinit();
            std.debug.print("Deployment created (accepted).\n", .{});
        },
        .unauthorized => |response| {
            defer response.arena.deinit();
            std.debug.print("Error: Unauthorized to create deployment\n", .{});
            return;
        },
        .default_response => |response| {
            defer response.arena.deinit();
            std.debug.print("Error creating deployment: {any}\n", .{response});
        },
    }

    // 2. Patch the Deployment (Scale to 3 replicas)
    std.debug.print("Patching deployment to scale to 3 replicas...\n", .{});

    // Construct the patch: {"spec": {"replicas": 3}}
    var spec_map = std.json.ObjectMap.init(allocator);
    defer spec_map.deinit();
    try spec_map.put("replicas", .{ .integer = 3 });

    var patch_map = std.json.ObjectMap.init(allocator);
    defer patch_map.deinit();
    try patch_map.put("spec", .{ .object = spec_map });

    const patch_value = std.json.Value{ .object = patch_map };

    // patchAppsV1NamespacedDeployment(name, namespace, pretty, dryRun, fieldManager, fieldValidation, force, body)
    // Workaround: Use raw fetch because generated method doesn't set Content-Type
    const patch_url = try std.fmt.allocPrint(allocator, "{s}/apis/apps/v1/namespaces/{s}/deployments/{s}", .{ client.base_url, namespace, deployment_name });
    defer allocator.free(patch_url);

    const patch_uri = try std.Uri.parse(patch_url);

    const ResponseContext = struct {
        writer: std.io.Writer,
        list: *std.ArrayListUnmanaged(u8),
        allocator: std.mem.Allocator,

        pub fn drain(ctx: *std.io.Writer, chunks: []const []const u8, limit: usize) error{WriteFailed}!usize {
            _ = limit;
            const self: *@This() = @fieldParentPtr("writer", ctx);
            var total_written: usize = 0;
            for (chunks) |chunk| {
                if (chunk.len > 0) {
                    self.list.appendSlice(self.allocator, chunk) catch return error.WriteFailed;
                    total_written += chunk.len;
                }
            }
            return total_written;
        }
    };

    var json_string = std.ArrayListUnmanaged(u8){};
    defer json_string.deinit(allocator);

    var json_write_buf: [4096]u8 = undefined;
    const json_vtable = std.io.Writer.VTable{ .drain = ResponseContext.drain };
    var json_ctx = ResponseContext{
        .writer = std.io.Writer{ .vtable = &json_vtable, .buffer = &json_write_buf, .end = 0 },
        .list = &json_string,
        .allocator = allocator,
    };

    try std.json.Stringify.value(patch_value, .{}, &json_ctx.writer);
    // Flush the writer
    if (json_ctx.writer.end > 0) {
        const buffered = json_ctx.writer.buffer[0..json_ctx.writer.end];
        try json_string.appendSlice(allocator, buffered);
        json_ctx.writer.end = 0;
    }

    var headers = std.ArrayListUnmanaged(std.http.Header){};
    defer headers.deinit(allocator);
    try headers.append(allocator, .{ .name = "Content-Type", .value = "application/merge-patch+json" });

    var response_body = std.ArrayListUnmanaged(u8){};
    defer response_body.deinit(allocator);

    var write_buf: [4096]u8 = undefined;
    const vtable = std.io.Writer.VTable{ .drain = ResponseContext.drain };
    var ctx = ResponseContext{
        .writer = std.io.Writer{ .vtable = &vtable, .buffer = &write_buf, .end = 0 },
        .list = &response_body,
        .allocator = allocator,
    };

    const patch_res = try client.client.fetch(.{
        .location = .{ .uri = patch_uri },
        .method = .PATCH,
        .extra_headers = headers.items,
        .payload = json_string.items,
        .response_writer = &ctx.writer,
    });

    // Flush the response writer
    if (ctx.writer.end > 0) {
        const buffered = ctx.writer.buffer[0..ctx.writer.end];
        try response_body.appendSlice(allocator, buffered);
        ctx.writer.end = 0;
    }

    if (patch_res.status == .ok) {
        std.debug.print("Deployment patched successfully!\n", .{});
        // Parse response to verify replicas
        const parsed = try std.json.parseFromSlice(apps_v1.Deployment, allocator, response_body.items, .{ .ignore_unknown_fields = true });
        defer parsed.deinit();

        if (parsed.value.spec) |spec| {
            if (spec.replicas) |replicas| {
                std.debug.print("New replica count: {d}\n", .{replicas});
            }
        }
    } else {
        std.debug.print("Error: Patch failed. Status: {any}\nBody: {s}\n", .{ patch_res.status, response_body.items });
    }

    // 3. Clean up
    std.debug.print("Deleting deployment...\n", .{});
    const delete_options = meta_v1.DeleteOptions{};
    // deleteAppsV1NamespacedDeployment(name, namespace, body, options)
    // deleteAppsV1NamespacedDeployment(name, namespace, body, options)
    const delete_result = try client.deleteAppsV1NamespacedDeployment(deployment_name, namespace, delete_options, .{});
    switch (delete_result) {
        .ok => |response| response.arena.deinit(),
        .accepted => |response| response.arena.deinit(),
        .unauthorized => |response| response.arena.deinit(),
        .default_response => |response| response.arena.deinit(),
    }
    std.debug.print("Deployment deleted.\n", .{});
}
