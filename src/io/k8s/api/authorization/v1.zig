// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const FieldSelectorAttributes = struct {
    rawSelector: ?[]const u8 = null,
    requirements: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.FieldSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.requirements) |arr| for (arr) |item| try item.validate();
    }
};

pub const LabelSelectorAttributes = struct {
    rawSelector: ?[]const u8 = null,
    requirements: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.requirements) |arr| for (arr) |item| try item.validate();
    }
};

pub const LocalSubjectAccessReview = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.authorization.v1.SubjectAccessReviewSpec,
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const NonResourceAttributes = struct {
    path: ?[]const u8 = null,
    verb: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NonResourceRule = struct {
    nonResourceURLs: ?[]const []const u8 = null,
    verbs: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceAttributes = struct {
    fieldSelector: ?root.io.k8s.api.authorization.v1.FieldSelectorAttributes = null,
    group: ?[]const u8 = null,
    labelSelector: ?root.io.k8s.api.authorization.v1.LabelSelectorAttributes = null,
    name: ?[]const u8 = null,
    namespace: ?[]const u8 = null,
    resource: ?[]const u8 = null,
    subresource: ?[]const u8 = null,
    verb: ?[]const u8 = null,
    version: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.fieldSelector) |v| try v.validate();
        if (self.labelSelector) |v| try v.validate();
    }
};

pub const ResourceRule = struct {
    apiGroups: ?[]const []const u8 = null,
    resourceNames: ?[]const []const u8 = null,
    resources: ?[]const []const u8 = null,
    verbs: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SelfSubjectAccessReview = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.authorization.v1.SelfSubjectAccessReviewSpec,
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const SelfSubjectAccessReviewSpec = struct {
    nonResourceAttributes: ?root.io.k8s.api.authorization.v1.NonResourceAttributes = null,
    resourceAttributes: ?root.io.k8s.api.authorization.v1.ResourceAttributes = null,

    pub fn validate(self: @This()) !void {
        if (self.nonResourceAttributes) |v| try v.validate();
        if (self.resourceAttributes) |v| try v.validate();
    }
};

pub const SelfSubjectRulesReview = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.authorization.v1.SelfSubjectRulesReviewSpec,
    status: ?root.io.k8s.api.authorization.v1.SubjectRulesReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const SelfSubjectRulesReviewSpec = struct {
    namespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SubjectAccessReview = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.authorization.v1.SubjectAccessReviewSpec,
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const SubjectAccessReviewSpec = struct {
    extra: ?std.json.Value = null,
    groups: ?[]const []const u8 = null,
    nonResourceAttributes: ?root.io.k8s.api.authorization.v1.NonResourceAttributes = null,
    resourceAttributes: ?root.io.k8s.api.authorization.v1.ResourceAttributes = null,
    uid: ?[]const u8 = null,
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.nonResourceAttributes) |v| try v.validate();
        if (self.resourceAttributes) |v| try v.validate();
    }
};

pub const SubjectAccessReviewStatus = struct {
    allowed: bool,
    denied: ?bool = null,
    evaluationError: ?[]const u8 = null,
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SubjectRulesReviewStatus = struct {
    evaluationError: ?[]const u8 = null,
    incomplete: bool,
    nonResourceRules: []const root.io.k8s.api.authorization.v1.NonResourceRule,
    resourceRules: []const root.io.k8s.api.authorization.v1.ResourceRule,

    pub fn validate(self: @This()) !void {
        for (self.nonResourceRules) |item| try item.validate();
        for (self.resourceRules) |item| try item.validate();
    }
};

