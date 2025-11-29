// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const Event = struct {
    action: ?[]const u8 = null,
    apiVersion: ?[]const u8 = null,
    deprecatedCount: ?i64 = null,
    deprecatedFirstTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    deprecatedLastTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    deprecatedSource: ?root.io.k8s.api.core.v1.EventSource = null,
    eventTime: root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    note: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    regarding: ?root.io.k8s.api.core.v1.ObjectReference = null,
    related: ?root.io.k8s.api.core.v1.ObjectReference = null,
    reportingController: ?[]const u8 = null,
    reportingInstance: ?[]const u8 = null,
    series: ?root.io.k8s.api.events.v1.EventSeries = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.deprecatedSource) |v| try v.validate();
        if (self.metadata) |v| try v.validate();
        if (self.regarding) |v| try v.validate();
        if (self.related) |v| try v.validate();
        if (self.series) |v| try v.validate();
    }
};

pub const EventList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.events.v1.Event,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const EventSeries = struct {
    count: i64,
    lastObservedTime: root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

