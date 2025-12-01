// Namespace: v1alpha3

const std = @import("std");
const root = @import("../../../../root.zig");

pub const DeviceTaint = struct {
    effect: []const u8,
    key: []const u8,
    timeAdded: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DeviceTaintRule = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.resource.v1alpha3.DeviceTaintRuleSpec,
    status: ?root.io.k8s.api.resource.v1alpha3.DeviceTaintRuleStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const DeviceTaintRuleList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.resource.v1alpha3.DeviceTaintRule,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const DeviceTaintRuleSpec = struct {
    deviceSelector: ?root.io.k8s.api.resource.v1alpha3.DeviceTaintSelector = null,
    taint: root.io.k8s.api.resource.v1alpha3.DeviceTaint,

    pub fn validate(self: @This()) !void {
        if (self.deviceSelector) |v| try v.validate();
        try self.taint.validate();
    }
};

pub const DeviceTaintRuleStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceTaintSelector = struct {
    device: ?[]const u8 = null,
    driver: ?[]const u8 = null,
    pool: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
