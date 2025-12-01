// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const Overhead = struct {
    podFixed: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const RuntimeClass = struct {
    apiVersion: ?[]const u8 = null,
    handler: []const u8,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    overhead: ?root.io.k8s.api.node.v1.Overhead = null,
    scheduling: ?root.io.k8s.api.node.v1.Scheduling = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.overhead) |v| try v.validate();
        if (self.scheduling) |v| try v.validate();
    }
};

pub const RuntimeClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.node.v1.RuntimeClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const Scheduling = struct {
    nodeSelector: ?std.json.Value = null,
    tolerations: ?[]const root.io.k8s.api.core.v1.Toleration = null,

    pub fn validate(self: @This()) !void {
        if (self.tolerations) |arr| for (arr) |item| try item.validate();
    }
};
