// Namespace: v1

const std = @import("std");
const root = @import("../../../../../../root.zig");

pub const APIService = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.kubeAggregator.pkg.apis.apiregistration.v1.APIServiceSpec = null,
    status: ?root.io.k8s.kubeAggregator.pkg.apis.apiregistration.v1.APIServiceStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const APIServiceCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const APIServiceList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.kubeAggregator.pkg.apis.apiregistration.v1.APIService,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const APIServiceSpec = struct {
    caBundle: ?[]const u8 = null,
    group: ?[]const u8 = null,
    groupPriorityMinimum: i64,
    insecureSkipTLSVerify: ?bool = null,
    service: ?root.io.k8s.kubeAggregator.pkg.apis.apiregistration.v1.ServiceReference = null,
    version: ?[]const u8 = null,
    versionPriority: i64,

    pub fn validate(self: @This()) !void {
        if (self.service) |v| try v.validate();
    }
};

pub const APIServiceStatus = struct {
    conditions: ?[]const root.io.k8s.kubeAggregator.pkg.apis.apiregistration.v1.APIServiceCondition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const ServiceReference = struct {
    name: ?[]const u8 = null,
    namespace: ?[]const u8 = null,
    port: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
