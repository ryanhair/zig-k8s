// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const CrossVersionObjectReference = struct {
    apiVersion: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HorizontalPodAutoscaler = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.autoscaling.v1.HorizontalPodAutoscalerSpec = null,
    status: ?root.io.k8s.api.autoscaling.v1.HorizontalPodAutoscalerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const HorizontalPodAutoscalerList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.autoscaling.v1.HorizontalPodAutoscaler,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const HorizontalPodAutoscalerSpec = struct {
    maxReplicas: i64,
    minReplicas: ?i64 = null,
    scaleTargetRef: root.io.k8s.api.autoscaling.v1.CrossVersionObjectReference,
    targetCPUUtilizationPercentage: ?i64 = null,

    pub fn validate(self: @This()) !void {
        try self.scaleTargetRef.validate();
    }
};

pub const HorizontalPodAutoscalerStatus = struct {
    currentCPUUtilizationPercentage: ?i64 = null,
    currentReplicas: i64,
    desiredReplicas: i64,
    lastScaleTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    observedGeneration: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Scale = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.autoscaling.v1.ScaleSpec = null,
    status: ?root.io.k8s.api.autoscaling.v1.ScaleStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ScaleSpec = struct {
    replicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ScaleStatus = struct {
    replicas: i64,
    selector: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

