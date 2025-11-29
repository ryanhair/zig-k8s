// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const Endpoint = struct {
    addresses: []const []const u8,
    conditions: ?root.io.k8s.api.discovery.v1.EndpointConditions = null,
    deprecatedTopology: ?std.json.Value = null,
    hints: ?root.io.k8s.api.discovery.v1.EndpointHints = null,
    hostname: ?[]const u8 = null,
    nodeName: ?[]const u8 = null,
    targetRef: ?root.io.k8s.api.core.v1.ObjectReference = null,
    zone: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |v| try v.validate();
        if (self.hints) |v| try v.validate();
        if (self.targetRef) |v| try v.validate();
    }
};

pub const EndpointConditions = struct {
    ready: ?bool = null,
    serving: ?bool = null,
    terminating: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const EndpointHints = struct {
    forNodes: ?[]const root.io.k8s.api.discovery.v1.ForNode = null,
    forZones: ?[]const root.io.k8s.api.discovery.v1.ForZone = null,

    pub fn validate(self: @This()) !void {
        if (self.forNodes) |arr| for (arr) |item| try item.validate();
        if (self.forZones) |arr| for (arr) |item| try item.validate();
    }
};

pub const EndpointPort = struct {
    appProtocol: ?[]const u8 = null,
    name: ?[]const u8 = null,
    port: ?i64 = null,
    protocol: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const EndpointSlice = struct {
    addressType: []const u8,
    apiVersion: ?[]const u8 = null,
    endpoints: []const root.io.k8s.api.discovery.v1.Endpoint,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    ports: ?[]const root.io.k8s.api.discovery.v1.EndpointPort = null,

    pub fn validate(self: @This()) !void {
        for (self.endpoints) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

pub const EndpointSliceList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.discovery.v1.EndpointSlice,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ForNode = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ForZone = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

