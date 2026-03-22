// Namespace: v1alpha3

const std = @import("std");
const root = @import("../../../../root.zig");

/// The device this taint is attached to has the "effect" on any claim which does not tolerate the taint and, through the claim, to pods using the claim.
pub const DeviceTaint = struct {
    /// The effect of the taint on claims that do not tolerate the taint and through such claims on the pods using them.
    ///
    /// Valid effects are None, NoSchedule and NoExecute. PreferNoSchedule as used for nodes is not valid here. More effects may get added in the future. Consumers must treat unknown effects like None.
    effect: []const u8,
    /// The taint key to be applied to a device. Must be a label name.
    key: []const u8,
    /// TimeAdded represents the time at which the taint was added or (only in a DeviceTaintRule) the effect was modified. Added automatically during create or update if not set.
    ///
    /// In addition, in a DeviceTaintRule a value provided during an update gets replaced with the current time if the provided value is the same as the old one and the new effect is different. Changing the key and/or value while keeping the effect unchanged is possible and does not update the time stamp because the eviction which uses it is either already started (NoExecute) or not started yet (NoEffect, NoSchedule).
    timeAdded: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// The taint value corresponding to the taint key. Must be a label value.
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// DeviceTaintRule adds one taint to all devices which match the selector. This has the same effect as if the taint was specified directly in the ResourceSlice by the DRA driver.
pub const DeviceTaintRule = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec specifies the selector and one taint.
    ///
    /// Changing the spec automatically increments the metadata.generation number.
    spec: root.io.k8s.api.resource.v1alpha3.DeviceTaintRuleSpec,
    /// Status provides information about what was requested in the spec.
    status: ?root.io.k8s.api.resource.v1alpha3.DeviceTaintRuleStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// DeviceTaintRuleList is a collection of DeviceTaintRules.
pub const DeviceTaintRuleList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of DeviceTaintRules.
    items: []const root.io.k8s.api.resource.v1alpha3.DeviceTaintRule,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// DeviceTaintRuleSpec specifies the selector and one taint.
pub const DeviceTaintRuleSpec = struct {
    /// DeviceSelector defines which device(s) the taint is applied to. All selector criteria must be satisfied for a device to match. The empty selector matches all devices. Without a selector, no devices are matches.
    deviceSelector: ?root.io.k8s.api.resource.v1alpha3.DeviceTaintSelector = null,
    /// The taint that gets applied to matching devices.
    taint: root.io.k8s.api.resource.v1alpha3.DeviceTaint,

    pub fn validate(self: @This()) !void {
        if (self.deviceSelector) |v| try v.validate();
        try self.taint.validate();
    }
};

/// DeviceTaintRuleStatus provides information about an on-going pod eviction.
pub const DeviceTaintRuleStatus = struct {
    /// Conditions provide information about the state of the DeviceTaintRule and the cluster at some point in time, in a machine-readable and human-readable format.
    ///
    /// The following condition is currently defined as part of this API, more may get added: - Type: EvictionInProgress - Status: True if there are currently pods which need to be evicted, False otherwise
    ///   (includes the effects which don't cause eviction).
    /// - Reason: not specified, may change - Message: includes information about number of pending pods and already evicted pods
    ///   in a human-readable format, updated periodically, may change
    ///
    /// For `effect: None`, the condition above gets set once for each change to the spec, with the message containing information about what would happen if the effect was `NoExecute`. This feedback can be used to decide whether changing the effect to `NoExecute` will work as intended. It only gets set once to avoid having to constantly update the status.
    ///
    /// Must have 8 or fewer entries.
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// DeviceTaintSelector defines which device(s) a DeviceTaintRule applies to. The empty selector matches all devices. Without a selector, no devices are matched.
pub const DeviceTaintSelector = struct {
    /// If device is set, only devices with that name are selected. This field corresponds to slice.spec.devices[].name.
    ///
    /// Setting also driver and pool may be required to avoid ambiguity, but is not required.
    device: ?[]const u8 = null,
    /// If driver is set, only devices from that driver are selected. This fields corresponds to slice.spec.driver.
    driver: ?[]const u8 = null,
    /// If pool is set, only devices in that pool are selected.
    ///
    /// Also setting the driver name may be useful to avoid ambiguity when different drivers use the same pool name, but this is not required because selecting pools from different drivers may also be useful, for example when drivers with node-local devices use the node name as their pool name.
    pool: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PoolStatus contains status information for a single resource pool.
pub const PoolStatus = struct {
    /// AllocatedDevices is the number of devices currently allocated to claims. A value of 0 means no devices are allocated. May be unset when validationError is set.
    allocatedDevices: ?i64 = null,
    /// AvailableDevices is the number of devices available for allocation. This equals TotalDevices - AllocatedDevices - UnavailableDevices. A value of 0 means no devices are currently available. May be unset when validationError is set.
    availableDevices: ?i64 = null,
    /// Driver is the DRA driver name for this pool. Must be a DNS subdomain (e.g., "gpu.example.com").
    driver: []const u8,
    /// Generation is the pool generation observed across all ResourceSlices in this pool. Only the latest generation is reported. During a generation rollout, if not all slices at the latest generation have been published, the pool is included with a validationError and device counts unset.
    generation: i64,
    /// NodeName is the node this pool is associated with. When omitted, the pool is not associated with a specific node. Must be a valid DNS subdomain name (RFC1123).
    nodeName: ?[]const u8 = null,
    /// PoolName is the name of the pool. Must be a valid resource pool name (DNS subdomains separated by "/").
    poolName: []const u8,
    /// ResourceSliceCount is the number of ResourceSlices that make up this pool. May be unset when validationError is set.
    resourceSliceCount: ?i64 = null,
    /// TotalDevices is the total number of devices in the pool across all slices. A value of 0 means the pool has no devices. May be unset when validationError is set.
    totalDevices: ?i64 = null,
    /// UnavailableDevices is the number of devices that are not available due to taints or other conditions, but are not allocated. A value of 0 means all unallocated devices are available. May be unset when validationError is set.
    unavailableDevices: ?i64 = null,
    /// ValidationError is set when the pool's data could not be fully validated (e.g., incomplete slice publication). When set, device count fields and ResourceSliceCount may be unset.
    validationError: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourcePoolStatusRequest triggers a one-time calculation of resource pool status based on the provided filters. Once status is set, the request is considered complete and will not be reprocessed. Users should delete and recreate requests to get updated information.
pub const ResourcePoolStatusRequest = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object metadata
    metadata: root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta,
    /// Spec defines the filters for which pools to include in the status. The spec is immutable once created.
    spec: root.io.k8s.api.resource.v1alpha3.ResourcePoolStatusRequestSpec,
    /// Status is populated by the controller with the calculated pool status. When status is non-nil, the request is considered complete and the entire object becomes immutable.
    status: ?root.io.k8s.api.resource.v1alpha3.ResourcePoolStatusRequestStatus = null,

    pub fn validate(self: @This()) !void {
        try self.metadata.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// ResourcePoolStatusRequestList is a collection of ResourcePoolStatusRequests.
pub const ResourcePoolStatusRequestList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of ResourcePoolStatusRequests.
    items: []const root.io.k8s.api.resource.v1alpha3.ResourcePoolStatusRequest,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ResourcePoolStatusRequestSpec defines the filters for the pool status request.
pub const ResourcePoolStatusRequestSpec = struct {
    /// Driver specifies the DRA driver name to filter pools. Only pools from ResourceSlices with this driver will be included. Must be a DNS subdomain (e.g., "gpu.example.com").
    driver: []const u8,
    /// Limit optionally specifies the maximum number of pools to return in the status. If more pools match the filter criteria, the response will be truncated (i.e., len(status.pools) < status.poolCount).
    ///
    /// Default: 100 Minimum: 1 Maximum: 1000
    limit: ?i64 = null,
    /// PoolName optionally filters to a specific pool name. If not specified, all pools from the specified driver are included. When specified, must be a non-empty valid resource pool name (DNS subdomains separated by "/").
    poolName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourcePoolStatusRequestStatus contains the calculated pool status information.
pub const ResourcePoolStatusRequestStatus = struct {
    /// Conditions provide information about the state of the request. A condition with type=Complete or type=Failed will always be set when the status is populated.
    ///
    /// Known condition types: - "Complete": True when the request has been processed successfully - "Failed": True when the request could not be processed
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    /// PoolCount is the total number of pools that matched the filter criteria, regardless of truncation. This helps users understand how many pools exist even when the response is truncated. A value of 0 means no pools matched the filter criteria.
    poolCount: i64,
    /// Pools contains the first `spec.limit` matching pools, sorted by driver then pool name. If `len(pools) < poolCount`, the list was truncated. When omitted, no pools matched the request filters.
    pools: ?[]const root.io.k8s.api.resource.v1alpha3.PoolStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.pools) |arr| for (arr) |item| try item.validate();
    }
};
