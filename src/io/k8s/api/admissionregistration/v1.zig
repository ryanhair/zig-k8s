// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const AuditAnnotation = struct {
    key: []const u8,
    valueExpression: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ExpressionWarning = struct {
    fieldRef: []const u8,
    warning: []const u8,

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
    excludeResourceRules: ?[]const root.io.k8s.api.admissionregistration.v1.NamedRuleWithOperations = null,
    matchPolicy: ?[]const u8 = null,
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    objectSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    resourceRules: ?[]const root.io.k8s.api.admissionregistration.v1.NamedRuleWithOperations = null,

    pub fn validate(self: @This()) !void {
        if (self.excludeResourceRules) |arr| for (arr) |item| try item.validate();
        if (self.namespaceSelector) |v| try v.validate();
        if (self.objectSelector) |v| try v.validate();
        if (self.resourceRules) |arr| for (arr) |item| try item.validate();
    }
};

pub const MutatingWebhook = struct {
    admissionReviewVersions: []const []const u8,
    clientConfig: root.io.k8s.api.admissionregistration.v1.WebhookClientConfig,
    failurePolicy: ?[]const u8 = null,
    matchConditions: ?[]const root.io.k8s.api.admissionregistration.v1.MatchCondition = null,
    matchPolicy: ?[]const u8 = null,
    name: []const u8,
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    objectSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    reinvocationPolicy: ?[]const u8 = null,
    rules: ?[]const root.io.k8s.api.admissionregistration.v1.RuleWithOperations = null,
    sideEffects: []const u8,
    timeoutSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        try self.clientConfig.validate();
        if (self.matchConditions) |arr| for (arr) |item| try item.validate();
        if (self.namespaceSelector) |v| try v.validate();
        if (self.objectSelector) |v| try v.validate();
        if (self.rules) |arr| for (arr) |item| try item.validate();
    }
};

pub const MutatingWebhookConfiguration = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    webhooks: ?[]const root.io.k8s.api.admissionregistration.v1.MutatingWebhook = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.webhooks) |arr| for (arr) |item| try item.validate();
    }
};

pub const MutatingWebhookConfigurationList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.admissionregistration.v1.MutatingWebhookConfiguration,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
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

pub const RuleWithOperations = struct {
    apiGroups: ?[]const []const u8 = null,
    apiVersions: ?[]const []const u8 = null,
    operations: ?[]const []const u8 = null,
    resources: ?[]const []const u8 = null,
    scope: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceReference = struct {
    name: []const u8,
    namespace: []const u8,
    path: ?[]const u8 = null,
    port: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TypeChecking = struct {
    expressionWarnings: ?[]const root.io.k8s.api.admissionregistration.v1.ExpressionWarning = null,

    pub fn validate(self: @This()) !void {
        if (self.expressionWarnings) |arr| for (arr) |item| try item.validate();
    }
};

pub const ValidatingAdmissionPolicy = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.admissionregistration.v1.ValidatingAdmissionPolicySpec = null,
    status: ?root.io.k8s.api.admissionregistration.v1.ValidatingAdmissionPolicyStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ValidatingAdmissionPolicyBinding = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.admissionregistration.v1.ValidatingAdmissionPolicyBindingSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const ValidatingAdmissionPolicyBindingList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.admissionregistration.v1.ValidatingAdmissionPolicyBinding,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ValidatingAdmissionPolicyBindingSpec = struct {
    matchResources: ?root.io.k8s.api.admissionregistration.v1.MatchResources = null,
    paramRef: ?root.io.k8s.api.admissionregistration.v1.ParamRef = null,
    policyName: ?[]const u8 = null,
    validationActions: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.matchResources) |v| try v.validate();
        if (self.paramRef) |v| try v.validate();
    }
};

pub const ValidatingAdmissionPolicyList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.admissionregistration.v1.ValidatingAdmissionPolicy,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ValidatingAdmissionPolicySpec = struct {
    auditAnnotations: ?[]const root.io.k8s.api.admissionregistration.v1.AuditAnnotation = null,
    failurePolicy: ?[]const u8 = null,
    matchConditions: ?[]const root.io.k8s.api.admissionregistration.v1.MatchCondition = null,
    matchConstraints: ?root.io.k8s.api.admissionregistration.v1.MatchResources = null,
    paramKind: ?root.io.k8s.api.admissionregistration.v1.ParamKind = null,
    validations: ?[]const root.io.k8s.api.admissionregistration.v1.Validation = null,
    variables: ?[]const root.io.k8s.api.admissionregistration.v1.Variable = null,

    pub fn validate(self: @This()) !void {
        if (self.auditAnnotations) |arr| for (arr) |item| try item.validate();
        if (self.matchConditions) |arr| for (arr) |item| try item.validate();
        if (self.matchConstraints) |v| try v.validate();
        if (self.paramKind) |v| try v.validate();
        if (self.validations) |arr| for (arr) |item| try item.validate();
        if (self.variables) |arr| for (arr) |item| try item.validate();
    }
};

pub const ValidatingAdmissionPolicyStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    observedGeneration: ?i64 = null,
    typeChecking: ?root.io.k8s.api.admissionregistration.v1.TypeChecking = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.typeChecking) |v| try v.validate();
    }
};

pub const ValidatingWebhook = struct {
    admissionReviewVersions: []const []const u8,
    clientConfig: root.io.k8s.api.admissionregistration.v1.WebhookClientConfig,
    failurePolicy: ?[]const u8 = null,
    matchConditions: ?[]const root.io.k8s.api.admissionregistration.v1.MatchCondition = null,
    matchPolicy: ?[]const u8 = null,
    name: []const u8,
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    objectSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    rules: ?[]const root.io.k8s.api.admissionregistration.v1.RuleWithOperations = null,
    sideEffects: []const u8,
    timeoutSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        try self.clientConfig.validate();
        if (self.matchConditions) |arr| for (arr) |item| try item.validate();
        if (self.namespaceSelector) |v| try v.validate();
        if (self.objectSelector) |v| try v.validate();
        if (self.rules) |arr| for (arr) |item| try item.validate();
    }
};

pub const ValidatingWebhookConfiguration = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    webhooks: ?[]const root.io.k8s.api.admissionregistration.v1.ValidatingWebhook = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.webhooks) |arr| for (arr) |item| try item.validate();
    }
};

pub const ValidatingWebhookConfigurationList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.admissionregistration.v1.ValidatingWebhookConfiguration,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const Validation = struct {
    expression: []const u8,
    message: ?[]const u8 = null,
    messageExpression: ?[]const u8 = null,
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Variable = struct {
    expression: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const WebhookClientConfig = struct {
    caBundle: ?[]const u8 = null,
    service: ?root.io.k8s.api.admissionregistration.v1.ServiceReference = null,
    url: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.service) |v| try v.validate();
    }
};

