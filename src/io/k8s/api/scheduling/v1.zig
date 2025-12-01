// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const PriorityClass = struct {
    apiVersion: ?[]const u8 = null,
    description: ?[]const u8 = null,
    globalDefault: ?bool = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    preemptionPolicy: ?[]const u8 = null,
    value: i64,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

pub const PriorityClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.scheduling.v1.PriorityClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};
