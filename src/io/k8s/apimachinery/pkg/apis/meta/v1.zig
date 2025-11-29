// Namespace: v1

const std = @import("std");
const root = @import("../../../../../../root.zig");


pub const APIGroup = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    name: []const u8,
    preferredVersion: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.GroupVersionForDiscovery = null,
    serverAddressByClientCIDRs: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.ServerAddressByClientCIDR = null,
    versions: []const root.io.k8s.apimachinery.pkg.apis.meta.v1.GroupVersionForDiscovery,

    pub fn validate(self: @This()) !void {
        if (self.preferredVersion) |v| try v.validate();
        if (self.serverAddressByClientCIDRs) |arr| for (arr) |item| try item.validate();
        for (self.versions) |item| try item.validate();
    }
};

pub const APIGroupList = struct {
    apiVersion: ?[]const u8 = null,
    groups: []const root.io.k8s.apimachinery.pkg.apis.meta.v1.APIGroup,
    kind: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        for (self.groups) |item| try item.validate();
    }
};

pub const APIResource = struct {
    categories: ?[]const []const u8 = null,
    group: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,
    namespaced: bool,
    shortNames: ?[]const []const u8 = null,
    singularName: []const u8,
    storageVersionHash: ?[]const u8 = null,
    verbs: []const []const u8,
    version: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const APIResourceList = struct {
    apiVersion: ?[]const u8 = null,
    groupVersion: []const u8,
    kind: ?[]const u8 = null,
    resources: []const root.io.k8s.apimachinery.pkg.apis.meta.v1.APIResource,

    pub fn validate(self: @This()) !void {
        for (self.resources) |item| try item.validate();
    }
};

pub const APIVersions = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    serverAddressByClientCIDRs: []const root.io.k8s.apimachinery.pkg.apis.meta.v1.ServerAddressByClientCIDR,
    versions: []const []const u8,

    pub fn validate(self: @This()) !void {
        for (self.serverAddressByClientCIDRs) |item| try item.validate();
    }
};

pub const Condition = struct {
    lastTransitionTime: root.io.k8s.apimachinery.pkg.apis.meta.v1.Time,
    message: []const u8,
    observedGeneration: ?i64 = null,
    reason: []const u8,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DeleteOptions = struct {
    apiVersion: ?[]const u8 = null,
    dryRun: ?[]const []const u8 = null,
    gracePeriodSeconds: ?i64 = null,
    ignoreStoreReadErrorWithClusterBreakingPotential: ?bool = null,
    kind: ?[]const u8 = null,
    orphanDependents: ?bool = null,
    preconditions: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Preconditions = null,
    propagationPolicy: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.preconditions) |v| try v.validate();
    }
};

pub const FieldSelectorRequirement = struct {
    key: []const u8,
    operator: []const u8,
    values: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FieldsV1 = struct {

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GroupResource = struct {
    group: []const u8,
    resource: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GroupVersionForDiscovery = struct {
    groupVersion: []const u8,
    version: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const LabelSelector = struct {
    matchExpressions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelectorRequirement = null,
    matchLabels: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.matchExpressions) |arr| for (arr) |item| try item.validate();
    }
};

pub const LabelSelectorRequirement = struct {
    key: []const u8,
    operator: []const u8,
    values: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ListMeta = struct {
    @"continue": ?[]const u8 = null,
    remainingItemCount: ?i64 = null,
    resourceVersion: ?[]const u8 = null,
    selfLink: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ManagedFieldsEntry = struct {
    apiVersion: ?[]const u8 = null,
    fieldsType: ?[]const u8 = null,
    fieldsV1: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.FieldsV1 = null,
    manager: ?[]const u8 = null,
    operation: ?[]const u8 = null,
    subresource: ?[]const u8 = null,
    time: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const MicroTime = []const u8;

pub const ObjectMeta = struct {
    annotations: ?std.json.Value = null,
    creationTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    deletionGracePeriodSeconds: ?i64 = null,
    deletionTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    finalizers: ?[]const []const u8 = null,
    generateName: ?[]const u8 = null,
    generation: ?i64 = null,
    labels: ?std.json.Value = null,
    managedFields: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.ManagedFieldsEntry = null,
    name: ?[]const u8 = null,
    namespace: ?[]const u8 = null,
    ownerReferences: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.OwnerReference = null,
    resourceVersion: ?[]const u8 = null,
    selfLink: ?[]const u8 = null,
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.managedFields) |arr| for (arr) |item| try item.validate();
        if (self.ownerReferences) |arr| for (arr) |item| try item.validate();
    }
};

pub const OwnerReference = struct {
    apiVersion: []const u8,
    blockOwnerDeletion: ?bool = null,
    controller: ?bool = null,
    kind: []const u8,
    name: []const u8,
    uid: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Patch = struct {

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Preconditions = struct {
    resourceVersion: ?[]const u8 = null,
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServerAddressByClientCIDR = struct {
    clientCIDR: []const u8,
    serverAddress: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Status = struct {
    apiVersion: ?[]const u8 = null,
    code: ?i64 = null,
    details: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.StatusDetails = null,
    kind: ?[]const u8 = null,
    message: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,
    reason: ?[]const u8 = null,
    status: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.details) |v| try v.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const StatusCause = struct {
    field: ?[]const u8 = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StatusDetails = struct {
    causes: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.StatusCause = null,
    group: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    name: ?[]const u8 = null,
    retryAfterSeconds: ?i64 = null,
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.causes) |arr| for (arr) |item| try item.validate();
    }
};

pub const Time = []const u8;

pub const WatchEvent = struct {
    object: root.io.k8s.apimachinery.pkg.runtime.RawExtension,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

