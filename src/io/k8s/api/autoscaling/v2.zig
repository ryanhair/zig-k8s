// Namespace: v2

const std = @import("std");
const root = @import("../../../../root.zig");

pub const ContainerResourceMetricSource = struct {
    container: []const u8,
    name: []const u8,
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.target.validate();
    }
};

pub const ContainerResourceMetricStatus = struct {
    container: []const u8,
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
    }
};

pub const CrossVersionObjectReference = struct {
    apiVersion: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ExternalMetricSource = struct {
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.metric.validate();
        try self.target.validate();
    }
};

pub const ExternalMetricStatus = struct {
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
        try self.metric.validate();
    }
};

pub const HPAScalingPolicy = struct {
    periodSeconds: i64,
    type: []const u8,
    value: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HPAScalingRules = struct {
    policies: ?[]const root.io.k8s.api.autoscaling.v2.HPAScalingPolicy = null,
    selectPolicy: ?[]const u8 = null,
    stabilizationWindowSeconds: ?i64 = null,
    tolerance: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        if (self.policies) |arr| for (arr) |item| try item.validate();
    }
};

pub const HorizontalPodAutoscaler = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerSpec = null,
    status: ?root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const HorizontalPodAutoscalerBehavior = struct {
    scaleDown: ?root.io.k8s.api.autoscaling.v2.HPAScalingRules = null,
    scaleUp: ?root.io.k8s.api.autoscaling.v2.HPAScalingRules = null,

    pub fn validate(self: @This()) !void {
        if (self.scaleDown) |v| try v.validate();
        if (self.scaleUp) |v| try v.validate();
    }
};

pub const HorizontalPodAutoscalerCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HorizontalPodAutoscalerList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscaler,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const HorizontalPodAutoscalerSpec = struct {
    behavior: ?root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerBehavior = null,
    maxReplicas: i64,
    metrics: ?[]const root.io.k8s.api.autoscaling.v2.MetricSpec = null,
    minReplicas: ?i64 = null,
    scaleTargetRef: root.io.k8s.api.autoscaling.v2.CrossVersionObjectReference,

    pub fn validate(self: @This()) !void {
        if (self.behavior) |v| try v.validate();
        if (self.metrics) |arr| for (arr) |item| try item.validate();
        try self.scaleTargetRef.validate();
    }
};

pub const HorizontalPodAutoscalerStatus = struct {
    conditions: ?[]const root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerCondition = null,
    currentMetrics: ?[]const root.io.k8s.api.autoscaling.v2.MetricStatus = null,
    currentReplicas: ?i64 = null,
    desiredReplicas: i64,
    lastScaleTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    observedGeneration: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.currentMetrics) |arr| for (arr) |item| try item.validate();
    }
};

pub const MetricIdentifier = struct {
    name: []const u8,
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.selector) |v| try v.validate();
    }
};

pub const MetricSpec = struct {
    containerResource: ?root.io.k8s.api.autoscaling.v2.ContainerResourceMetricSource = null,
    external: ?root.io.k8s.api.autoscaling.v2.ExternalMetricSource = null,
    object: ?root.io.k8s.api.autoscaling.v2.ObjectMetricSource = null,
    pods: ?root.io.k8s.api.autoscaling.v2.PodsMetricSource = null,
    resource: ?root.io.k8s.api.autoscaling.v2.ResourceMetricSource = null,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.containerResource) |v| try v.validate();
        if (self.external) |v| try v.validate();
        if (self.object) |v| try v.validate();
        if (self.pods) |v| try v.validate();
        if (self.resource) |v| try v.validate();
    }
};

pub const MetricStatus = struct {
    containerResource: ?root.io.k8s.api.autoscaling.v2.ContainerResourceMetricStatus = null,
    external: ?root.io.k8s.api.autoscaling.v2.ExternalMetricStatus = null,
    object: ?root.io.k8s.api.autoscaling.v2.ObjectMetricStatus = null,
    pods: ?root.io.k8s.api.autoscaling.v2.PodsMetricStatus = null,
    resource: ?root.io.k8s.api.autoscaling.v2.ResourceMetricStatus = null,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.containerResource) |v| try v.validate();
        if (self.external) |v| try v.validate();
        if (self.object) |v| try v.validate();
        if (self.pods) |v| try v.validate();
        if (self.resource) |v| try v.validate();
    }
};

pub const MetricTarget = struct {
    averageUtilization: ?i64 = null,
    averageValue: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    type: []const u8,
    value: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const MetricValueStatus = struct {
    averageUtilization: ?i64 = null,
    averageValue: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    value: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ObjectMetricSource = struct {
    describedObject: root.io.k8s.api.autoscaling.v2.CrossVersionObjectReference,
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.describedObject.validate();
        try self.metric.validate();
        try self.target.validate();
    }
};

pub const ObjectMetricStatus = struct {
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    describedObject: root.io.k8s.api.autoscaling.v2.CrossVersionObjectReference,
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
        try self.describedObject.validate();
        try self.metric.validate();
    }
};

pub const PodsMetricSource = struct {
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.metric.validate();
        try self.target.validate();
    }
};

pub const PodsMetricStatus = struct {
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
        try self.metric.validate();
    }
};

pub const ResourceMetricSource = struct {
    name: []const u8,
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.target.validate();
    }
};

pub const ResourceMetricStatus = struct {
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
    }
};
