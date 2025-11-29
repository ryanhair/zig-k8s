// Namespace: v1alpha1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const ServerStorageVersion = struct {
    apiServerID: ?[]const u8 = null,
    decodableVersions: ?[]const []const u8 = null,
    encodingVersion: ?[]const u8 = null,
    servedVersions: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StorageVersion = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersionSpec,
    status: root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersionStatus,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.status.validate();
    }
};

pub const StorageVersionCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: []const u8,
    observedGeneration: ?i64 = null,
    reason: []const u8,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StorageVersionList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersion,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const StorageVersionSpec = struct {

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StorageVersionStatus = struct {
    commonEncodingVersion: ?[]const u8 = null,
    conditions: ?[]const root.io.k8s.api.apiserverinternal.v1alpha1.StorageVersionCondition = null,
    storageVersions: ?[]const root.io.k8s.api.apiserverinternal.v1alpha1.ServerStorageVersion = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.storageVersions) |arr| for (arr) |item| try item.validate();
    }
};

