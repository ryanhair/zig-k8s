// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const CertificateSigningRequest = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.certificates.v1.CertificateSigningRequestSpec,
    status: ?root.io.k8s.api.certificates.v1.CertificateSigningRequestStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const CertificateSigningRequestCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    lastUpdateTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CertificateSigningRequestList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.certificates.v1.CertificateSigningRequest,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const CertificateSigningRequestSpec = struct {
    expirationSeconds: ?i64 = null,
    extra: ?std.json.Value = null,
    groups: ?[]const []const u8 = null,
    request: []const u8,
    signerName: []const u8,
    uid: ?[]const u8 = null,
    usages: ?[]const []const u8 = null,
    username: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CertificateSigningRequestStatus = struct {
    certificate: ?[]const u8 = null,
    conditions: ?[]const root.io.k8s.api.certificates.v1.CertificateSigningRequestCondition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

