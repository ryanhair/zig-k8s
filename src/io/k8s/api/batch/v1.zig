// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const CronJob = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.batch.v1.CronJobSpec = null,
    status: ?root.io.k8s.api.batch.v1.CronJobStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const CronJobList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.batch.v1.CronJob,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const CronJobSpec = struct {
    concurrencyPolicy: ?[]const u8 = null,
    failedJobsHistoryLimit: ?i64 = null,
    jobTemplate: root.io.k8s.api.batch.v1.JobTemplateSpec,
    schedule: []const u8,
    startingDeadlineSeconds: ?i64 = null,
    successfulJobsHistoryLimit: ?i64 = null,
    @"suspend": ?bool = null,
    timeZone: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.jobTemplate.validate();
    }
};

pub const CronJobStatus = struct {
    active: ?[]const root.io.k8s.api.core.v1.ObjectReference = null,
    lastScheduleTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    lastSuccessfulTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        if (self.active) |arr| for (arr) |item| try item.validate();
    }
};

pub const Job = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.batch.v1.JobSpec = null,
    status: ?root.io.k8s.api.batch.v1.JobStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const JobCondition = struct {
    lastProbeTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const JobList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.batch.v1.Job,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const JobSpec = struct {
    activeDeadlineSeconds: ?i64 = null,
    backoffLimit: ?i64 = null,
    backoffLimitPerIndex: ?i64 = null,
    completionMode: ?[]const u8 = null,
    completions: ?i64 = null,
    managedBy: ?[]const u8 = null,
    manualSelector: ?bool = null,
    maxFailedIndexes: ?i64 = null,
    parallelism: ?i64 = null,
    podFailurePolicy: ?root.io.k8s.api.batch.v1.PodFailurePolicy = null,
    podReplacementPolicy: ?[]const u8 = null,
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    successPolicy: ?root.io.k8s.api.batch.v1.SuccessPolicy = null,
    @"suspend": ?bool = null,
    template: root.io.k8s.api.core.v1.PodTemplateSpec,
    ttlSecondsAfterFinished: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.podFailurePolicy) |v| try v.validate();
        if (self.selector) |v| try v.validate();
        if (self.successPolicy) |v| try v.validate();
        try self.template.validate();
    }
};

pub const JobStatus = struct {
    active: ?i64 = null,
    completedIndexes: ?[]const u8 = null,
    completionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    conditions: ?[]const root.io.k8s.api.batch.v1.JobCondition = null,
    failed: ?i64 = null,
    failedIndexes: ?[]const u8 = null,
    ready: ?i64 = null,
    startTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    succeeded: ?i64 = null,
    terminating: ?i64 = null,
    uncountedTerminatedPods: ?root.io.k8s.api.batch.v1.UncountedTerminatedPods = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.uncountedTerminatedPods) |v| try v.validate();
    }
};

pub const JobTemplateSpec = struct {
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.batch.v1.JobSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const PodFailurePolicy = struct {
    rules: []const root.io.k8s.api.batch.v1.PodFailurePolicyRule,

    pub fn validate(self: @This()) !void {
        for (self.rules) |item| try item.validate();
    }
};

pub const PodFailurePolicyOnExitCodesRequirement = struct {
    containerName: ?[]const u8 = null,
    operator: []const u8,
    values: []const i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodFailurePolicyOnPodConditionsPattern = struct {
    status: ?[]const u8 = null,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodFailurePolicyRule = struct {
    action: []const u8,
    onExitCodes: ?root.io.k8s.api.batch.v1.PodFailurePolicyOnExitCodesRequirement = null,
    onPodConditions: ?[]const root.io.k8s.api.batch.v1.PodFailurePolicyOnPodConditionsPattern = null,

    pub fn validate(self: @This()) !void {
        if (self.onExitCodes) |v| try v.validate();
        if (self.onPodConditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const SuccessPolicy = struct {
    rules: []const root.io.k8s.api.batch.v1.SuccessPolicyRule,

    pub fn validate(self: @This()) !void {
        for (self.rules) |item| try item.validate();
    }
};

pub const SuccessPolicyRule = struct {
    succeededCount: ?i64 = null,
    succeededIndexes: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const UncountedTerminatedPods = struct {
    failed: ?[]const []const u8 = null,
    succeeded: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
