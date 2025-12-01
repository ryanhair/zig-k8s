// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const BoundObjectReference = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    name: ?[]const u8 = null,
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SelfSubjectReview = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    status: ?root.io.k8s.api.authentication.v1.SelfSubjectReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const SelfSubjectReviewStatus = struct {
    userInfo: ?root.io.k8s.api.authentication.v1.UserInfo = null,

    pub fn validate(self: @This()) !void {
        if (self.userInfo) |v| try v.validate();
    }
};

pub const TokenRequest = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.authentication.v1.TokenRequestSpec,
    status: ?root.io.k8s.api.authentication.v1.TokenRequestStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const TokenRequestSpec = struct {
    audiences: []const []const u8,
    boundObjectRef: ?root.io.k8s.api.authentication.v1.BoundObjectReference = null,
    expirationSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.boundObjectRef) |v| try v.validate();
    }
};

pub const TokenRequestStatus = struct {
    expirationTimestamp: root.io.k8s.apimachinery.pkg.apis.meta.v1.Time,
    token: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TokenReview = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.authentication.v1.TokenReviewSpec,
    status: ?root.io.k8s.api.authentication.v1.TokenReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const TokenReviewSpec = struct {
    audiences: ?[]const []const u8 = null,
    token: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TokenReviewStatus = struct {
    audiences: ?[]const []const u8 = null,
    authenticated: ?bool = null,
    @"error": ?[]const u8 = null,
    user: ?root.io.k8s.api.authentication.v1.UserInfo = null,

    pub fn validate(self: @This()) !void {
        if (self.user) |v| try v.validate();
    }
};

pub const UserInfo = struct {
    extra: ?std.json.Value = null,
    groups: ?[]const []const u8 = null,
    uid: ?[]const u8 = null,
    username: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
