const std = @import("std");
const k8s = @import("k8s");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the client.
    var client = try k8s.Client.init(allocator, .{}, .{ .base_url = "http://127.0.0.1:8001" });
    defer client.deinit();

    const configmap_name = "test-configmap";
    const namespace = "default";

    std.debug.print("Creating ConfigMap {s}...\n", .{configmap_name});

    // Create Data Map
    var data_map = std.json.ObjectMap.init(allocator);
    defer data_map.deinit();
    try data_map.put("key1", .{ .string = "value1" });
    try data_map.put("key2", .{ .string = "value2" });

    // Create ConfigMap Object
    const configmap = k8s.io.k8s.api.core.v1.ConfigMap{
        .apiVersion = "v1",
        .kind = "ConfigMap",
        .metadata = .{
            .name = configmap_name,
            .namespace = namespace,
        },
        .data = .{ .object = data_map },
    };

    // Call createCoreV1NamespacedConfigMap
    // Call createCoreV1NamespacedConfigMap
    // createCoreV1NamespacedConfigMap(namespace, body, options)
    const create_result = try client.createCoreV1NamespacedConfigMap(namespace, configmap, .{});

    switch (create_result) {
        .created => |response| {
            defer response.arena.deinit();
            std.debug.print("ConfigMap created successfully!\n", .{});
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized\n", .{});
            return;
        },
        else => {
            std.debug.print("Error: Unexpected status during create\n", .{});
            return;
        },
    }

    // Call readCoreV1NamespacedConfigMap
    std.debug.print("Reading ConfigMap {s}...\n", .{configmap_name});
    // Call readCoreV1NamespacedConfigMap
    // readCoreV1NamespacedConfigMap(name, namespace, options)
    const read_result = try client.readCoreV1NamespacedConfigMap(configmap_name, namespace, .{});
    switch (read_result) {
        .ok => |response| {
            defer response.arena.deinit();
            std.debug.print("ConfigMap found: {s}\n", .{response.body.metadata.?.name.?});
            if (response.body.data) |data| {
                std.debug.print("Data: {any}\n", .{data});
            }
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized\n", .{});
        },
        else => {
            std.debug.print("Error: Unexpected status during read\n", .{});
        },
    }

    // Update ConfigMap (Replace)
    std.debug.print("Updating ConfigMap {s}...\n", .{configmap_name});
    try data_map.put("key3", .{ .string = "value3" });

    // Create Updated ConfigMap Object
    const updated_configmap = k8s.io.k8s.api.core.v1.ConfigMap{
        .apiVersion = "v1",
        .kind = "ConfigMap",
        .metadata = .{
            .name = configmap_name,
            .namespace = namespace,
        },
        .data = .{ .object = data_map },
    };

    // Call replaceCoreV1NamespacedConfigMap
    // replaceCoreV1NamespacedConfigMap(name, namespace, body, options)
    const replace_result = try client.replaceCoreV1NamespacedConfigMap(configmap_name, namespace, updated_configmap, .{});
    switch (replace_result) {
        .ok => |response| {
            defer response.arena.deinit();
            std.debug.print("ConfigMap updated successfully!\n", .{});
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized\n", .{});
        },
        else => {
            std.debug.print("Error: Unexpected status during replace\n", .{});
        },
    }

    std.debug.print("Deleting ConfigMap {s}...\n", .{configmap_name});

    // Delete options
    const delete_options = k8s.io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions{ .gracePeriodSeconds = 0 };

    // Call deleteCoreV1NamespacedConfigMap
    // Call deleteCoreV1NamespacedConfigMap
    // deleteCoreV1NamespacedConfigMap(name, namespace, body, options)
    const delete_result = try client.deleteCoreV1NamespacedConfigMap(configmap_name, namespace, delete_options, .{});

    switch (delete_result) {
        .ok => |response| {
            defer response.arena.deinit();
            std.debug.print("ConfigMap deleted successfully!\n", .{});
        },
        .unauthorized => {
            std.debug.print("Error: Unauthorized\n", .{});
        },
        else => {
            std.debug.print("Error: Unexpected status during delete\n", .{});
        },
    }
}
