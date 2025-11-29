// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const AggregationRule = struct {
    clusterRoleSelectors: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.clusterRoleSelectors) |arr| for (arr) |item| try item.validate();
    }
};

pub const ClusterRole = struct {
    aggregationRule: ?root.io.k8s.api.rbac.v1.AggregationRule = null,
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    rules: ?[]const root.io.k8s.api.rbac.v1.PolicyRule = null,

    pub fn validate(self: @This()) !void {
        if (self.aggregationRule) |v| try v.validate();
        if (self.metadata) |v| try v.validate();
        if (self.rules) |arr| for (arr) |item| try item.validate();
    }
};

pub const ClusterRoleBinding = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    roleRef: root.io.k8s.api.rbac.v1.RoleRef,
    subjects: ?[]const root.io.k8s.api.rbac.v1.Subject = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.roleRef.validate();
        if (self.subjects) |arr| for (arr) |item| try item.validate();
    }
};

pub const ClusterRoleBindingList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.rbac.v1.ClusterRoleBinding,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ClusterRoleList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.rbac.v1.ClusterRole,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PolicyRule = struct {
    apiGroups: ?[]const []const u8 = null,
    nonResourceURLs: ?[]const []const u8 = null,
    resourceNames: ?[]const []const u8 = null,
    resources: ?[]const []const u8 = null,
    verbs: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Role = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    rules: ?[]const root.io.k8s.api.rbac.v1.PolicyRule = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.rules) |arr| for (arr) |item| try item.validate();
    }
};

pub const RoleBinding = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    roleRef: root.io.k8s.api.rbac.v1.RoleRef,
    subjects: ?[]const root.io.k8s.api.rbac.v1.Subject = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.roleRef.validate();
        if (self.subjects) |arr| for (arr) |item| try item.validate();
    }
};

pub const RoleBindingList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.rbac.v1.RoleBinding,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const RoleList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.rbac.v1.Role,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const RoleRef = struct {
    apiGroup: []const u8,
    kind: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Subject = struct {
    apiGroup: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,
    namespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

