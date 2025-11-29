// Namespace: v1alpha1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const ApplyConfiguration = struct {
    expression: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const JSONPatch = struct {
    expression: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const MatchCondition = struct {
    expression: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const MatchResources = struct {
    excludeResourceRules: ?[]const root.io.k8s.api.admissionregistration.v1alpha1.NamedRuleWithOperations = null,
    matchPolicy: ?[]const u8 = null,
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    objectSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    resourceRules: ?[]const root.io.k8s.api.admissionregistration.v1alpha1.NamedRuleWithOperations = null,

    pub fn validate(self: @This()) !void {
        if (self.excludeResourceRules) |arr| for (arr) |item| try item.validate();
        if (self.namespaceSelector) |v| try v.validate();
        if (self.objectSelector) |v| try v.validate();
        if (self.resourceRules) |arr| for (arr) |item| try item.validate();
    }
};

pub const MutatingAdmissionPolicy = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.admissionregistration.v1alpha1.MutatingAdmissionPolicySpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const MutatingAdmissionPolicyBinding = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.admissionregistration.v1alpha1.MutatingAdmissionPolicyBindingSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const MutatingAdmissionPolicyBindingList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.admissionregistration.v1alpha1.MutatingAdmissionPolicyBinding,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const MutatingAdmissionPolicyBindingSpec = struct {
    matchResources: ?root.io.k8s.api.admissionregistration.v1alpha1.MatchResources = null,
    paramRef: ?root.io.k8s.api.admissionregistration.v1alpha1.ParamRef = null,
    policyName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.matchResources) |v| try v.validate();
        if (self.paramRef) |v| try v.validate();
    }
};

pub const MutatingAdmissionPolicyList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.admissionregistration.v1alpha1.MutatingAdmissionPolicy,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const MutatingAdmissionPolicySpec = struct {
    failurePolicy: ?[]const u8 = null,
    matchConditions: ?[]const root.io.k8s.api.admissionregistration.v1alpha1.MatchCondition = null,
    matchConstraints: ?root.io.k8s.api.admissionregistration.v1alpha1.MatchResources = null,
    mutations: ?[]const root.io.k8s.api.admissionregistration.v1alpha1.Mutation = null,
    paramKind: ?root.io.k8s.api.admissionregistration.v1alpha1.ParamKind = null,
    reinvocationPolicy: ?[]const u8 = null,
    variables: ?[]const root.io.k8s.api.admissionregistration.v1alpha1.Variable = null,

    pub fn validate(self: @This()) !void {
        if (self.matchConditions) |arr| for (arr) |item| try item.validate();
        if (self.matchConstraints) |v| try v.validate();
        if (self.mutations) |arr| for (arr) |item| try item.validate();
        if (self.paramKind) |v| try v.validate();
        if (self.variables) |arr| for (arr) |item| try item.validate();
    }
};

pub const Mutation = struct {
    applyConfiguration: ?root.io.k8s.api.admissionregistration.v1alpha1.ApplyConfiguration = null,
    jsonPatch: ?root.io.k8s.api.admissionregistration.v1alpha1.JSONPatch = null,
    patchType: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.applyConfiguration) |v| try v.validate();
        if (self.jsonPatch) |v| try v.validate();
    }
};

pub const NamedRuleWithOperations = struct {
    apiGroups: ?[]const []const u8 = null,
    apiVersions: ?[]const []const u8 = null,
    operations: ?[]const []const u8 = null,
    resourceNames: ?[]const []const u8 = null,
    resources: ?[]const []const u8 = null,
    scope: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ParamKind = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ParamRef = struct {
    name: ?[]const u8 = null,
    namespace: ?[]const u8 = null,
    parameterNotFoundAction: ?[]const u8 = null,
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.selector) |v| try v.validate();
    }
};

pub const Variable = struct {
    expression: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

