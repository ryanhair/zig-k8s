// Namespace: v1beta1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const StorageVersionMigration = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.storagemigration.v1beta1.StorageVersionMigrationSpec = null,
    status: ?root.io.k8s.api.storagemigration.v1beta1.StorageVersionMigrationStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const StorageVersionMigrationList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.storagemigration.v1beta1.StorageVersionMigration,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const StorageVersionMigrationSpec = struct {
    resource: root.io.k8s.apimachinery.pkg.apis.meta.v1.GroupResource,

    pub fn validate(self: @This()) !void {
        try self.resource.validate();
    }
};

pub const StorageVersionMigrationStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    resourceVersion: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

