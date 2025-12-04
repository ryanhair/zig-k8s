// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

/// Event is a report of an event somewhere in the cluster. It generally denotes some state change in the system. Events have a limited retention time and triggers and messages may evolve with time.  Event consumers should not rely on the timing of an event with a given Reason reflecting a consistent underlying trigger, or the continued existence of events with that Reason.  Events should be treated as informative, best-effort, supplemental data.
pub const Event = struct {
    /// action is what action was taken/failed regarding to the regarding object. It is machine-readable. This field cannot be empty for new Events and it can have at most 128 characters.
    action: ?[]const u8 = null,
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// deprecatedCount is the deprecated field assuring backward compatibility with core.v1 Event type.
    deprecatedCount: ?i64 = null,
    /// deprecatedFirstTimestamp is the deprecated field assuring backward compatibility with core.v1 Event type.
    deprecatedFirstTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// deprecatedLastTimestamp is the deprecated field assuring backward compatibility with core.v1 Event type.
    deprecatedLastTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// deprecatedSource is the deprecated field assuring backward compatibility with core.v1 Event type.
    deprecatedSource: ?root.io.k8s.api.core.v1.EventSource = null,
    /// eventTime is the time when this Event was first observed. It is required.
    eventTime: root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// note is a human-readable description of the status of this operation. Maximal length of the note is 1kB, but libraries should be prepared to handle values up to 64kB.
    note: ?[]const u8 = null,
    /// reason is why the action was taken. It is human-readable. This field cannot be empty for new Events and it can have at most 128 characters.
    reason: ?[]const u8 = null,
    /// regarding contains the object this Event is about. In most cases it's an Object reporting controller implements, e.g. ReplicaSetController implements ReplicaSets and this event is emitted because it acts on some changes in a ReplicaSet object.
    regarding: ?root.io.k8s.api.core.v1.ObjectReference = null,
    /// related is the optional secondary object for more complex actions. E.g. when regarding object triggers a creation or deletion of related object.
    related: ?root.io.k8s.api.core.v1.ObjectReference = null,
    /// reportingController is the name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`. This field cannot be empty for new Events.
    reportingController: ?[]const u8 = null,
    /// reportingInstance is the ID of the controller instance, e.g. `kubelet-xyzf`. This field cannot be empty for new Events and it can have at most 128 characters.
    reportingInstance: ?[]const u8 = null,
    /// series is data about the Event series this event represents or nil if it's a singleton Event.
    series: ?root.io.k8s.api.events.v1.EventSeries = null,
    /// type is the type of this event (Normal, Warning), new types could be added in the future. It is machine-readable. This field cannot be empty for new Events.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.deprecatedSource) |v| try v.validate();
        if (self.metadata) |v| try v.validate();
        if (self.regarding) |v| try v.validate();
        if (self.related) |v| try v.validate();
        if (self.series) |v| try v.validate();
    }
};

/// EventList is a list of Event objects.
pub const EventList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is a list of schema objects.
    items: []const root.io.k8s.api.events.v1.Event,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// EventSeries contain information on series of events, i.e. thing that was/is happening continuously for some time. How often to update the EventSeries is up to the event reporters. The default event reporter in "k8s.io/client-go/tools/events/event_broadcaster.go" shows how this struct is updated on heartbeats and can guide customized reporter implementations.
pub const EventSeries = struct {
    /// count is the number of occurrences in this series up to the last heartbeat time.
    count: i64,
    /// lastObservedTime is the time when last Event from the series was seen before last heartbeat.
    lastObservedTime: root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
