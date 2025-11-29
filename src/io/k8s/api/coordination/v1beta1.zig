// Namespace: v1beta1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const LeaseCandidate = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.coordination.v1beta1.LeaseCandidateSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const LeaseCandidateList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.coordination.v1beta1.LeaseCandidate,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const LeaseCandidateSpec = struct {
    binaryVersion: []const u8,
    emulationVersion: ?[]const u8 = null,
    leaseName: []const u8,
    pingTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    renewTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    strategy: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

