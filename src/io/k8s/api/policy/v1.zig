// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const Eviction = struct {
    apiVersion: ?[]const u8 = null,
    deleteOptions: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,

    pub fn validate(self: @This()) !void {
        if (self.deleteOptions) |v| try v.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PodDisruptionBudget = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.policy.v1.PodDisruptionBudgetSpec = null,
    status: ?root.io.k8s.api.policy.v1.PodDisruptionBudgetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const PodDisruptionBudgetList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.policy.v1.PodDisruptionBudget,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PodDisruptionBudgetSpec = struct {
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    minAvailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    unhealthyPodEvictionPolicy: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.selector) |v| try v.validate();
    }
};

pub const PodDisruptionBudgetStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    currentHealthy: i64,
    desiredHealthy: i64,
    disruptedPods: ?std.json.Value = null,
    disruptionsAllowed: i64,
    expectedPods: i64,
    observedGeneration: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};
