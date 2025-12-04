const std = @import("std");
const k8s = @import("k8s");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the client.
    // We assume 'kubectl proxy' is running on localhost:8001
    var client = try k8s.Client.init(allocator, .{}, .{ .base_url = "http://127.0.0.1:8001" });
    defer client.deinit();

    std.debug.print("Listing pods in all namespaces...\n", .{});

    // List all pods in all namespaces
    // listCoreV1NamespacedPod(namespace, options)
    const list_result = try client.listCoreV1NamespacedPod("", .{});

    switch (list_result) {
        .ok => |response| {
            defer response.arena.deinit();

            const pod_list = response.body;
            std.debug.print("Found {d} pods:\n", .{pod_list.items.len});

            for (pod_list.items) |pod| {
                if (pod.metadata) |m| {
                    const name = m.name orelse "unknown";
                    const namespace = m.namespace orelse "unknown";
                    std.debug.print("Pod: {s}/{s}\n", .{ namespace, name });
                } else {
                    std.debug.print("- <no metadata>\n", .{});
                }
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
}
