// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const CSIDriver = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.storage.v1.CSIDriverSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const CSIDriverList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1.CSIDriver,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const CSIDriverSpec = struct {
    attachRequired: ?bool = null,
    fsGroupPolicy: ?[]const u8 = null,
    nodeAllocatableUpdatePeriodSeconds: ?i64 = null,
    podInfoOnMount: ?bool = null,
    requiresRepublish: ?bool = null,
    seLinuxMount: ?bool = null,
    serviceAccountTokenInSecrets: ?bool = null,
    storageCapacity: ?bool = null,
    tokenRequests: ?[]const root.io.k8s.api.storage.v1.TokenRequest = null,
    volumeLifecycleModes: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.tokenRequests) |arr| for (arr) |item| try item.validate();
    }
};

pub const CSINode = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.storage.v1.CSINodeSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const CSINodeDriver = struct {
    allocatable: ?root.io.k8s.api.storage.v1.VolumeNodeResources = null,
    name: []const u8,
    nodeID: []const u8,
    topologyKeys: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.allocatable) |v| try v.validate();
    }
};

pub const CSINodeList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1.CSINode,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const CSINodeSpec = struct {
    drivers: []const root.io.k8s.api.storage.v1.CSINodeDriver,

    pub fn validate(self: @This()) !void {
        for (self.drivers) |item| try item.validate();
    }
};

pub const CSIStorageCapacity = struct {
    apiVersion: ?[]const u8 = null,
    capacity: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    kind: ?[]const u8 = null,
    maximumVolumeSize: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    nodeTopology: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    storageClassName: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.nodeTopology) |v| try v.validate();
    }
};

pub const CSIStorageCapacityList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1.CSIStorageCapacity,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const StorageClass = struct {
    allowVolumeExpansion: ?bool = null,
    allowedTopologies: ?[]const root.io.k8s.api.core.v1.TopologySelectorTerm = null,
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    mountOptions: ?[]const []const u8 = null,
    parameters: ?std.json.Value = null,
    provisioner: []const u8,
    reclaimPolicy: ?[]const u8 = null,
    volumeBindingMode: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.allowedTopologies) |arr| for (arr) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const StorageClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1.StorageClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const TokenRequest = struct {
    audience: []const u8,
    expirationSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const VolumeAttachment = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.storage.v1.VolumeAttachmentSpec,
    status: ?root.io.k8s.api.storage.v1.VolumeAttachmentStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const VolumeAttachmentList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1.VolumeAttachment,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const VolumeAttachmentSource = struct {
    inlineVolumeSpec: ?root.io.k8s.api.core.v1.PersistentVolumeSpec = null,
    persistentVolumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.inlineVolumeSpec) |v| try v.validate();
    }
};

pub const VolumeAttachmentSpec = struct {
    attacher: []const u8,
    nodeName: []const u8,
    source: root.io.k8s.api.storage.v1.VolumeAttachmentSource,

    pub fn validate(self: @This()) !void {
        try self.source.validate();
    }
};

pub const VolumeAttachmentStatus = struct {
    attachError: ?root.io.k8s.api.storage.v1.VolumeError = null,
    attached: bool,
    attachmentMetadata: ?std.json.Value = null,
    detachError: ?root.io.k8s.api.storage.v1.VolumeError = null,

    pub fn validate(self: @This()) !void {
        if (self.attachError) |v| try v.validate();
        if (self.detachError) |v| try v.validate();
    }
};

pub const VolumeAttributesClass = struct {
    apiVersion: ?[]const u8 = null,
    driverName: []const u8,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    parameters: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

pub const VolumeAttributesClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storage.v1.VolumeAttributesClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const VolumeError = struct {
    errorCode: ?i64 = null,
    message: ?[]const u8 = null,
    time: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const VolumeNodeResources = struct {
    count: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
