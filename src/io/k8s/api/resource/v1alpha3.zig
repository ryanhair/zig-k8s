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
    /// TimeAdded represents the time at which the taint was added. Added automatically during create or update if not set.
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
