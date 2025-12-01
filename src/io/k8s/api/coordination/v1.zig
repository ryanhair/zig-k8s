// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const Lease = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.coordination.v1.LeaseSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const LeaseList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.coordination.v1.Lease,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const LeaseSpec = struct {
    acquireTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    holderIdentity: ?[]const u8 = null,
    leaseDurationSeconds: ?i64 = null,
    leaseTransitions: ?i64 = null,
    preferredHolder: ?[]const u8 = null,
    renewTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    strategy: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
