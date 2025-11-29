// Namespace: v1beta1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const VolumeAttributesClass = struct {
    apiVersion: ?[]const u8 = null,
    driverName: []const u8,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    parameters: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

pub const VolumeAttributesClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1beta1.VolumeAttributesClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

