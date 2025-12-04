// Namespace: v1alpha1

const std = @import("std");
const root = @import("../../../../root.zig");

/// An API server instance reports the version it can decode and the version it encodes objects to when persisting objects in the backend.
pub const ServerStorageVersion = struct {
    /// The ID of the reporting API server.
    apiServerID: ?[]const u8 = null,
    /// The API server can decode objects encoded in these versions. The encodingVersion must be included in the decodableVersions.
    decodableVersions: ?[]const []const u8 = null,
    /// The API server encodes the object to this version when persisting it in the backend (e.g., etcd).
    encodingVersion: ?[]const u8 = null,
    /// The API server can serve these versions. DecodableVersions must include all ServedVersions.
    servedVersions: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Storage version of a specific resource.
pub const StorageVersion = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// The name is <group>.<resource>.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec is an empty spec. It is here to comply with Kubernetes API style.
    spec: root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersionSpec,
    /// API server instances report the version they can decode and the version they encode objects to when persisting objects in the backend.
    status: root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersionStatus,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.status.validate();
    }
};

/// Describes the state of the storageVersion at a certain point.
pub const StorageVersionCondition = struct {
    /// Last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// A human readable message indicating details about the transition.
    message: []const u8,
    /// If set, this represents the .metadata.generation that the condition was set based upon.
    observedGeneration: ?i64 = null,
    /// The reason for the condition's last transition.
    reason: []const u8,
    /// Status of the condition, one of True, False, Unknown.
    status: []const u8,
    /// Type of the condition.
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// A list of StorageVersions.
pub const StorageVersionList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items holds a list of StorageVersion
    items: []const root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersion,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// StorageVersionSpec is an empty spec.
pub const StorageVersionSpec = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// API server instances report the versions they can decode and the version they encode objects to when persisting objects in the backend.
pub const StorageVersionStatus = struct {
    /// If all API server instances agree on the same encoding storage version, then this field is set to that version. Otherwise this field is left empty. API servers should finish updating its storageVersionStatus entry before serving write operations, so that this field will be in sync with the reality.
    commonEncodingVersion: ?[]const u8 = null,
    /// The latest available observations of the storageVersion's state.
    conditions: ?[]const root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersionCondition = null,
    /// The reported versions per API server instance.
    storageVersions: ?[]const root.io.k8s.api.apiserverinternal.v1alpha1.ServerStorageVersion = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.storageVersions) |arr| for (arr) |item| try item.validate();
    }
};
