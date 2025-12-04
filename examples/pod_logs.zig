const std = @import("std");
const k8s = @import("k8s");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the client.
    var client = try k8s.Client.init(allocator, .{}, .{ .base_url = "http://127.0.0.1:8001" });
    defer client.deinit();

    const namespace = "kube-system";

    // 1. List Pods to find a target
    std.debug.print("Listing pods in namespace '{s}' to find a target...\n", .{namespace});
    // listCoreV1NamespacedPod(namespace, options)
    const list_result = try client.listCoreV1NamespacedPod(namespace, .{});

    var pod_name: []const u8 = "";
    var pod_arena: std.heap.ArenaAllocator = undefined;

    switch (list_result) {
        .ok => |response| {
            pod_arena = response.arena;
            if (response.body.items.len > 0) {
                const pod = response.body.items[0];
                if (pod.metadata) |metadata| {
                    if (metadata.name) |name| {
                        pod_name = name;
                        std.debug.print("Found pod: {s}\n", .{pod_name});
                    }
                }
            } else {
                std.debug.print("No pods found in namespace '{s}'. Please create a deployment first.\n", .{namespace});
                response.arena.deinit();
                return;
            }
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized to list pods\n", .{});
            return;
        },
        else => {
            std.debug.print("Error: Unexpected status when listing pods\n", .{});
            return;
        },
    }
    defer pod_arena.deinit();

    if (pod_name.len == 0) {
        std.debug.print("Could not determine pod name.\n", .{});
        return;
    }

    // 2. Fetch Logs (Workaround for JSON parsing issue)
    std.debug.print("Fetching logs for pod {s}...\n", .{pod_name});

    var url_buf: [1024]u8 = undefined;
    var url_fbs = std.io.fixedBufferStream(&url_buf);
    const url_w = url_fbs.writer();
    try url_w.print("{s}/api/v1/namespaces/{s}/pods/{s}/log", .{ client.base_url, namespace, pod_name });
    const url = url_fbs.getWritten();

    const uri = try std.Uri.parse(url);

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

    var response_body = std.ArrayListUnmanaged(u8){};
    defer response_body.deinit(allocator);

    var write_buf: [4096]u8 = undefined;
    const vtable = std.io.Writer.VTable{ .drain = ResponseContext.drain };
    var ctx = ResponseContext{
        .writer = std.io.Writer{ .vtable = &vtable, .buffer = &write_buf, .end = 0 },
        .list = &response_body,
        .allocator = allocator,
    };

    const res = try client.client.fetch(.{
        .location = .{ .uri = uri },
        .method = .GET,
        .response_writer = &ctx.writer,
    });

    // Flush the response writer
    if (ctx.writer.end > 0) {
        const buffered = ctx.writer.buffer[0..ctx.writer.end];
        try response_body.appendSlice(allocator, buffered);
        ctx.writer.end = 0;
    }

    if (res.status == .ok) {
        std.debug.print("--- Log Output ---\n", .{});
        std.debug.print("{s}\n", .{response_body.items});
        std.debug.print("------------------\n", .{});
    } else {
        std.debug.print("Error: Failed to read logs. Status: {any}\n", .{res.status});
    }
}
