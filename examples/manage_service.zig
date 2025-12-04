const std = @import("std");
const k8s = @import("k8s");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the client.
    var client = try k8s.Client.init(allocator, .{}, .{ .base_url = "http://127.0.0.1:8001" });
    defer client.deinit();

    const service_name = "nginx-service";
    const namespace = "default";

    std.debug.print("Creating service {s}...\n", .{service_name});

    // Create Label Selector for the service
    var selector_map = std.json.ObjectMap.init(allocator);
    defer selector_map.deinit();
    try selector_map.put("app", .{ .string = "nginx" });

    // Create Service Port
    const service_port = k8s.io.k8s.api.core.v1.ServicePort{
        .name = "http",
        .port = 80,
        .targetPort = .{ .string = "http" },
        .protocol = "TCP",
    };
    var ports = std.ArrayListUnmanaged(k8s.io.k8s.api.core.v1.ServicePort){};
    defer ports.deinit(allocator);
    try ports.append(allocator, service_port);

    // Create Service Spec
    const service_spec = k8s.io.k8s.api.core.v1.ServiceSpec{
        .selector = .{ .object = selector_map },
        .ports = ports.items,
        .type = "ClusterIP",
    };

    // Create Service Object
    const service = k8s.io.k8s.api.core.v1.Service{
        .apiVersion = "v1",
        .kind = "Service",
        .metadata = .{
            .name = service_name,
            .namespace = namespace,
        },
        .spec = service_spec,
    };

    // Call createCoreV1NamespacedService
    // createCoreV1NamespacedService(namespace, body, options)
    const create_result = try client.createCoreV1NamespacedService(namespace, service, .{});

    switch (create_result) {
        .created => |response| {
            defer response.arena.deinit();
            std.debug.print("Service created successfully!\n", .{});
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized\n", .{});
            return;
        },
        .default_response => |response| {
            defer response.arena.deinit();
            if (response.body.object.get("message")) |msg| {
                std.debug.print("Error (Default): {s}\n", .{msg.string});
            } else {
                std.debug.print("Error (Default): Unknown error structure\n", .{});
            }
        },
        else => {
            std.debug.print("Error: Unexpected status\n", .{});
            return;
        },
    }

    std.debug.print("Deleting service {s}...\n", .{service_name});

    // Delete options
    const delete_options = k8s.io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions{ .gracePeriodSeconds = 0 };

    // Call deleteCoreV1NamespacedService
    // deleteCoreV1NamespacedService(name, namespace, body, options)
    const delete_result = try client.deleteCoreV1NamespacedService(service_name, namespace, delete_options, .{});

    switch (delete_result) {
        .ok => |response| {
            defer response.arena.deinit();
            std.debug.print("Service deleted successfully!\n", .{});
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized\n", .{});
        },
        .default_response => |response| {
            defer response.arena.deinit();
            if (response.body.object.get("message")) |msg| {
                std.debug.print("Error (Default): {s}\n", .{msg.string});
            } else {
                std.debug.print("Error (Default): Unknown error structure\n", .{});
            }
        },
        else => {
            std.debug.print("Error: Unexpected status during delete\n", .{});
        },
    }
}
