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

    std.debug.print("Watching pods in all namespaces...\n", .{});

    // Call watchlistCoreV1PodForAllNamespaces
    // Parameters: allowWatchBookmarks, continue, fieldSelector, labelSelector, limit, pretty, resourceVersion, resourceVersionMatch, sendInitialEvents, timeoutSeconds
    // We pass null for optional parameters we don't use.
    var stream = try client.watchlistCoreV1PodForAllNamespaces(.{});
    defer stream.deinit();

    while (try stream.next()) |event| {
        std.debug.print("Event: {s} - Pod: ", .{event.type});
        if (event.object.metadata) |m| {
            const name = m.name orelse "unknown";
            const namespace = m.namespace orelse "unknown";
            std.debug.print("{s}/{s}\n", .{ namespace, name });
        } else {
            std.debug.print("<no metadata>\n", .{});
        }
    }
}
