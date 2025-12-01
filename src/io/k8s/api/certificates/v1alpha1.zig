// Namespace: v1alpha1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const ClusterTrustBundle = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.certificates.v1alpha1.ClusterTrustBundleSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const ClusterTrustBundleList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.certificates.v1alpha1.ClusterTrustBundle,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ClusterTrustBundleSpec = struct {
    signerName: ?[]const u8 = null,
    trustBundle: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
