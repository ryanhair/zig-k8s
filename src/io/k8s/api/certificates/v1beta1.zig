// Namespace: v1beta1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const ClusterTrustBundle = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.certificates.v1beta1.ClusterTrustBundleSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const ClusterTrustBundleList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.certificates.v1beta1.ClusterTrustBundle,
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

pub const PodCertificateRequest = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.certificates.v1beta1.PodCertificateRequestSpec,
    status: ?root.io.k8s.api.certificates.v1beta1.PodCertificateRequestStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const PodCertificateRequestList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.certificates.v1beta1.PodCertificateRequest,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PodCertificateRequestSpec = struct {
    maxExpirationSeconds: ?i64 = null,
    nodeName: []const u8,
    nodeUID: []const u8,
    pkixPublicKey: []const u8,
    podName: []const u8,
    podUID: []const u8,
    proofOfPossession: []const u8,
    serviceAccountName: []const u8,
    serviceAccountUID: []const u8,
    signerName: []const u8,
    unverifiedUserAnnotations: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodCertificateRequestStatus = struct {
    beginRefreshAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    certificateChain: ?[]const u8 = null,
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    notAfter: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    notBefore: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

