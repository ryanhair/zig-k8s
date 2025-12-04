const std = @import("std");
const k8s = @import("k8s");
// Shorten imports for readability
const meta_v1 = k8s.io.k8s.apimachinery.pkg.apis.meta.v1;
const apps_v1 = k8s.io.k8s.api.apps.v1;
const core_v1 = k8s.io.k8s.api.core.v1;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the client.
    // We assume 'kubectl proxy' is running on localhost:8001
    var client = try k8s.Client.init(allocator, .{}, .{ .base_url = "http://127.0.0.1:8001" });
    defer client.deinit();

    // Create labels map
    var labels_map = std.json.ObjectMap.init(allocator);
    defer labels_map.deinit();
    try labels_map.put("app", .{ .string = "nginx" });

    const labels_value = std.json.Value{ .object = labels_map };

    // Create container
    // const container_port = core_v1.ContainerPort{
    //     .containerPort = 80,
    //     .protocol = "TCP",
    //     .name = "http",
    // };
    const container = core_v1.Container{
        .name = "nginx", // Keep name for consistency with other examples
        .image = "alpine:latest",
        .command = &[_][]const u8{ "/bin/sh", "-c", "while true; do echo 'Hello from Zig K8s!'; sleep 5; done" },
    };

    // Create deployment
    const deployment = apps_v1.Deployment{
        .apiVersion = "apps/v1",
        .kind = "Deployment",
        .metadata = meta_v1.ObjectMeta{
            .name = "nginx-deployment",
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

    std.debug.print("Deleting deployment nginx-deployment if it exists...\n", .{});
    const namespace = "default";
    const delete_options = meta_v1.DeleteOptions{ .gracePeriodSeconds = 0 };
    // deleteAppsV1NamespacedDeployment(name, namespace, body, options)
    const delete_result = try client.deleteAppsV1NamespacedDeployment("nginx-deployment", namespace, delete_options, .{});
    switch (delete_result) {
        .ok => |response| {
            defer response.arena.deinit();
            std.debug.print("Deployment deleted.\n", .{});
        },
        .accepted => |response| {
            defer response.arena.deinit();
            std.debug.print("Deployment deletion accepted.\n", .{});
        },
        .unauthorized => |response| {
            defer response.arena.deinit();
            std.debug.print("Warning: Unauthorized to delete deployment\n", .{});
        },
        .default_response => |response| {
            defer response.arena.deinit();
            // Likely 404 Not Found, which is fine
            std.debug.print("Deployment not found or other error (ignoring): {any}\n", .{response.body});
        },
    }

    std.debug.print("Creating deployment nginx-deployment...\n", .{});
    // Call createAppsV1NamespacedDeployment
    // createAppsV1NamespacedDeployment(namespace, body, options)
    const result = try client.createAppsV1NamespacedDeployment(namespace, deployment, .{});

    switch (result) {
        .created => |response| {
            defer response.arena.deinit();
            std.debug.print("Deployment created successfully!\n", .{});
            if (response.body.metadata) |meta| {
                if (meta.name) |name| {
                    std.debug.print("Name: {s}\n", .{name});
                }
            }
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
            std.debug.print("Error: Unauthorized\n", .{});
        },
        .default_response => |response| {
            defer response.arena.deinit();
            std.debug.print("Error: Unexpected status\n", .{});
        },
    }
}
