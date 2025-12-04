// Namespace: v1beta1

const std = @import("std");
const root = @import("../../../../root.zig");

/// StorageVersionMigration represents a migration of stored data to the latest storage version.
pub const StorageVersionMigration = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Specification of the migration.
    spec: ?root.io.k8s.api.storagemigration.v1beta1.StorageVersionMigrationSpec = null,
    /// Status of the migration.
    status: ?root.io.k8s.api.storagemigration.v1beta1.StorageVersionMigrationStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// StorageVersionMigrationList is a collection of storage version migrations.
pub const StorageVersionMigrationList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of StorageVersionMigration
    items: []const root.io.k8s.api.storagemigration.v1beta1.StorageVersionMigration,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// Spec of the storage version migration.
pub const StorageVersionMigrationSpec = struct {
    /// The resource that is being migrated. The migrator sends requests to the endpoint serving the resource. Immutable.
    resource: root.io.k8s.apimachinery.pkg.apis.meta.v1.GroupResource,

    pub fn validate(self: @This()) !void {
        try self.resource.validate();
    }
};

/// Status of the storage version migration.
pub const StorageVersionMigrationStatus = struct {
    /// The latest available observations of the migration's current state.
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    /// ResourceVersion to compare with the GC cache for performing the migration. This is the current resource version of given group, version and resource when kube-controller-manager first observes this StorageVersionMigration resource.
    resourceVersion: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};
