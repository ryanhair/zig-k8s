// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const ControllerRevision = struct {
    apiVersion: ?[]const u8 = null,
    data: ?root.io.k8s.apimachinery.pkg.runtime.RawExtension = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    revision: i64,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

pub const ControllerRevisionList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.apps.v1.ControllerRevision,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const DaemonSet = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.apps.v1.DaemonSetSpec = null,
    status: ?root.io.k8s.api.apps.v1.DaemonSetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const DaemonSetCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DaemonSetList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.apps.v1.DaemonSet,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const DaemonSetSpec = struct {
    minReadySeconds: ?i64 = null,
    revisionHistoryLimit: ?i64 = null,
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    template: root.io.k8s.api.core.v1.PodTemplateSpec,
    updateStrategy: ?root.io.k8s.api.apps.v1.DaemonSetUpdateStrategy = null,

    pub fn validate(self: @This()) !void {
        try self.selector.validate();
        try self.template.validate();
        if (self.updateStrategy) |v| try v.validate();
    }
};

pub const DaemonSetStatus = struct {
    collisionCount: ?i64 = null,
    conditions: ?[]const root.io.k8s.api.apps.v1.DaemonSetCondition = null,
    currentNumberScheduled: i64,
    desiredNumberScheduled: i64,
    numberAvailable: ?i64 = null,
    numberMisscheduled: i64,
    numberReady: i64,
    numberUnavailable: ?i64 = null,
    observedGeneration: ?i64 = null,
    updatedNumberScheduled: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const DaemonSetUpdateStrategy = struct {
    rollingUpdate: ?root.io.k8s.api.apps.v1.RollingUpdateDaemonSet = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.rollingUpdate) |v| try v.validate();
    }
};

pub const Deployment = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.apps.v1.DeploymentSpec = null,
    status: ?root.io.k8s.api.apps.v1.DeploymentStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const DeploymentCondition = struct {
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

pub const DeploymentList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.apps.v1.Deployment,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const DeploymentSpec = struct {
    minReadySeconds: ?i64 = null,
    paused: ?bool = null,
    progressDeadlineSeconds: ?i64 = null,
    replicas: ?i64 = null,
    revisionHistoryLimit: ?i64 = null,
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    strategy: ?root.io.k8s.api.apps.v1.DeploymentStrategy = null,
    template: root.io.k8s.api.core.v1.PodTemplateSpec,

    pub fn validate(self: @This()) !void {
        try self.selector.validate();
        if (self.strategy) |v| try v.validate();
        try self.template.validate();
    }
};

pub const DeploymentStatus = struct {
    availableReplicas: ?i64 = null,
    collisionCount: ?i64 = null,
    conditions: ?[]const root.io.k8s.api.apps.v1.DeploymentCondition = null,
    observedGeneration: ?i64 = null,
    readyReplicas: ?i64 = null,
    replicas: ?i64 = null,
    terminatingReplicas: ?i64 = null,
    unavailableReplicas: ?i64 = null,
    updatedReplicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeploymentStrategy = struct {
    rollingUpdate: ?root.io.k8s.api.apps.v1.RollingUpdateDeployment = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.rollingUpdate) |v| try v.validate();
    }
};

pub const ReplicaSet = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.apps.v1.ReplicaSetSpec = null,
    status: ?root.io.k8s.api.apps.v1.ReplicaSetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ReplicaSetCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ReplicaSetList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.apps.v1.ReplicaSet,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ReplicaSetSpec = struct {
    minReadySeconds: ?i64 = null,
    replicas: ?i64 = null,
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    template: ?root.io.k8s.api.core.v1.PodTemplateSpec = null,

    pub fn validate(self: @This()) !void {
        try self.selector.validate();
        if (self.template) |v| try v.validate();
    }
};

pub const ReplicaSetStatus = struct {
    availableReplicas: ?i64 = null,
    conditions: ?[]const root.io.k8s.api.apps.v1.ReplicaSetCondition = null,
    fullyLabeledReplicas: ?i64 = null,
    observedGeneration: ?i64 = null,
    readyReplicas: ?i64 = null,
    replicas: i64,
    terminatingReplicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const RollingUpdateDaemonSet = struct {
    maxSurge: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const RollingUpdateDeployment = struct {
    maxSurge: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const RollingUpdateStatefulSetStrategy = struct {
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    partition: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StatefulSet = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.apps.v1.StatefulSetSpec = null,
    status: ?root.io.k8s.api.apps.v1.StatefulSetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const StatefulSetCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StatefulSetList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.apps.v1.StatefulSet,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const StatefulSetOrdinals = struct {
    start: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StatefulSetPersistentVolumeClaimRetentionPolicy = struct {
    whenDeleted: ?[]const u8 = null,
    whenScaled: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StatefulSetSpec = struct {
    minReadySeconds: ?i64 = null,
    ordinals: ?root.io.k8s.api.apps.v1.StatefulSetOrdinals = null,
    persistentVolumeClaimRetentionPolicy: ?root.io.k8s.api.apps.v1.StatefulSetPersistentVolumeClaimRetentionPolicy = null,
    podManagementPolicy: ?[]const u8 = null,
    replicas: ?i64 = null,
    revisionHistoryLimit: ?i64 = null,
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    serviceName: ?[]const u8 = null,
    template: root.io.k8s.api.core.v1.PodTemplateSpec,
    updateStrategy: ?root.io.k8s.api.apps.v1.StatefulSetUpdateStrategy = null,
    volumeClaimTemplates: ?[]const root.io.k8s.api.core.v1.PersistentVolumeClaim = null,

    pub fn validate(self: @This()) !void {
        if (self.ordinals) |v| try v.validate();
        if (self.persistentVolumeClaimRetentionPolicy) |v| try v.validate();
        try self.selector.validate();
        try self.template.validate();
        if (self.updateStrategy) |v| try v.validate();
        if (self.volumeClaimTemplates) |arr| for (arr) |item| try item.validate();
    }
};

pub const StatefulSetStatus = struct {
    availableReplicas: ?i64 = null,
    collisionCount: ?i64 = null,
    conditions: ?[]const root.io.k8s.api.apps.v1.StatefulSetCondition = null,
    currentReplicas: ?i64 = null,
    currentRevision: ?[]const u8 = null,
    observedGeneration: ?i64 = null,
    readyReplicas: ?i64 = null,
    replicas: i64,
    updateRevision: ?[]const u8 = null,
    updatedReplicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const StatefulSetUpdateStrategy = struct {
    rollingUpdate: ?root.io.k8s.api.apps.v1.RollingUpdateStatefulSetStrategy = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.rollingUpdate) |v| try v.validate();
    }
};

