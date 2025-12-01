// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const ExemptPriorityLevelConfiguration = struct {
    lendablePercent: ?i64 = null,
    nominalConcurrencyShares: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FlowDistinguisherMethod = struct {
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FlowSchema = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.flowcontrol.v1.FlowSchemaSpec = null,
    status: ?root.io.k8s.api.flowcontrol.v1.FlowSchemaStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const FlowSchemaCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: ?[]const u8 = null,
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FlowSchemaList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.flowcontrol.v1.FlowSchema,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const FlowSchemaSpec = struct {
    distinguisherMethod: ?root.io.k8s.api.flowcontrol.v1.FlowDistinguisherMethod = null,
    matchingPrecedence: ?i64 = null,
    priorityLevelConfiguration: root.io.k8s.api.flowcontrol.v1.PriorityLevelConfigurationReference,
    rules: ?[]const root.io.k8s.api.flowcontrol.v1.PolicyRulesWithSubjects = null,

    pub fn validate(self: @This()) !void {
        if (self.distinguisherMethod) |v| try v.validate();
        try self.priorityLevelConfiguration.validate();
        if (self.rules) |arr| for (arr) |item| try item.validate();
    }
};

pub const FlowSchemaStatus = struct {
    conditions: ?[]const root.io.k8s.api.flowcontrol.v1.FlowSchemaCondition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const GroupSubject = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const LimitResponse = struct {
    queuing: ?root.io.k8s.api.flowcontrol.v1.QueuingConfiguration = null,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.queuing) |v| try v.validate();
    }
};

pub const LimitedPriorityLevelConfiguration = struct {
    borrowingLimitPercent: ?i64 = null,
    lendablePercent: ?i64 = null,
    limitResponse: ?root.io.k8s.api.flowcontrol.v1.LimitResponse = null,
    nominalConcurrencyShares: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.limitResponse) |v| try v.validate();
    }
};

pub const NonResourcePolicyRule = struct {
    nonResourceURLs: []const []const u8,
    verbs: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PolicyRulesWithSubjects = struct {
    nonResourceRules: ?[]const root.io.k8s.api.flowcontrol.v1.NonResourcePolicyRule = null,
    resourceRules: ?[]const root.io.k8s.api.flowcontrol.v1.ResourcePolicyRule = null,
    subjects: []const root.io.k8s.api.flowcontrol.v1.Subject,

    pub fn validate(self: @This()) !void {
        if (self.nonResourceRules) |arr| for (arr) |item| try item.validate();
        if (self.resourceRules) |arr| for (arr) |item| try item.validate();
        for (self.subjects) |item| try item.validate();
    }
};

pub const PriorityLevelConfiguration = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.flowcontrol.v1.PriorityLevelConfigurationSpec = null,
    status: ?root.io.k8s.api.flowcontrol.v1.PriorityLevelConfigurationStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const PriorityLevelConfigurationCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: ?[]const u8 = null,
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PriorityLevelConfigurationList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.flowcontrol.v1.PriorityLevelConfiguration,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PriorityLevelConfigurationReference = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PriorityLevelConfigurationSpec = struct {
    exempt: ?root.io.k8s.api.flowcontrol.v1.ExemptPriorityLevelConfiguration = null,
    limited: ?root.io.k8s.api.flowcontrol.v1.LimitedPriorityLevelConfiguration = null,
    type: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.exempt) |v| try v.validate();
        if (self.limited) |v| try v.validate();
    }
};

pub const PriorityLevelConfigurationStatus = struct {
    conditions: ?[]const root.io.k8s.api.flowcontrol.v1.PriorityLevelConfigurationCondition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const QueuingConfiguration = struct {
    handSize: ?i64 = null,
    queueLengthLimit: ?i64 = null,
    queues: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourcePolicyRule = struct {
    apiGroups: []const []const u8,
    clusterScope: ?bool = null,
    namespaces: ?[]const []const u8 = null,
    resources: []const []const u8,
    verbs: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceAccountSubject = struct {
    name: []const u8,
    namespace: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Subject = struct {
    group: ?root.io.k8s.api.flowcontrol.v1.GroupSubject = null,
    kind: []const u8,
    serviceAccount: ?root.io.k8s.api.flowcontrol.v1.ServiceAccountSubject = null,
    user: ?root.io.k8s.api.flowcontrol.v1.UserSubject = null,

    pub fn validate(self: @This()) !void {
        if (self.group) |v| try v.validate();
        if (self.serviceAccount) |v| try v.validate();
        if (self.user) |v| try v.validate();
    }
};

pub const UserSubject = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
