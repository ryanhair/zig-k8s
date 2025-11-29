// Namespace: v1alpha1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const BasicSchedulingPolicy = struct {

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GangSchedulingPolicy = struct {
    minCount: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodGroup = struct {
    name: []const u8,
    policy: root.io.k8s.api.scheduling.v1alpha1.PodGroupPolicy,

    pub fn validate(self: @This()) !void {
        try self.policy.validate();
    }
};

pub const PodGroupPolicy = struct {
    basic: ?root.io.k8s.api.scheduling.v1alpha1.BasicSchedulingPolicy = null,
    gang: ?root.io.k8s.api.scheduling.v1alpha1.GangSchedulingPolicy = null,

    pub fn validate(self: @This()) !void {
        if (self.gang) |v| try v.validate();
    }
};

pub const TypedLocalObjectReference = struct {
    apiGroup: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Workload = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.scheduling.v1alpha1.WorkloadSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const WorkloadList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.scheduling.v1alpha1.Workload,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const WorkloadSpec = struct {
    controllerRef: ?root.io.k8s.api.scheduling.v1alpha1.TypedLocalObjectReference = null,
    podGroups: []const root.io.k8s.api.scheduling.v1alpha1.PodGroup,

    pub fn validate(self: @This()) !void {
        if (self.controllerRef) |v| try v.validate();
        for (self.podGroups) |item| try item.validate();
    }
};

