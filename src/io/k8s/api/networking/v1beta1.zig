// Namespace: v1beta1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const IPAddress = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1beta1.IPAddressSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const IPAddressList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1beta1.IPAddress,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const IPAddressSpec = struct {
    parentRef: root.io.k8s.api.networking.v1beta1.ParentReference,

    pub fn validate(self: @This()) !void {
        try self.parentRef.validate();
    }
};

pub const ParentReference = struct {
    group: ?[]const u8 = null,
    name: []const u8,
    namespace: ?[]const u8 = null,
    resource: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceCIDR = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1beta1.ServiceCIDRSpec = null,
    status: ?root.io.k8s.api.networking.v1beta1.ServiceCIDRStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ServiceCIDRList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1beta1.ServiceCIDR,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ServiceCIDRSpec = struct {
    cidrs: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceCIDRStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};
