// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const AllocatedDeviceStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    data: ?root.io.k8s.apimachinery.pkg.runtime.RawExtension = null,
    device: []const u8,
    driver: []const u8,
    networkData: ?root.io.k8s.api.resource.v1.NetworkDeviceData = null,
    pool: []const u8,
    shareID: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.networkData) |v| try v.validate();
    }
};

pub const AllocationResult = struct {
    allocationTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    devices: ?root.io.k8s.api.resource.v1.DeviceAllocationResult = null,
    nodeSelector: ?root.io.k8s.api.core.v1.NodeSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.devices) |v| try v.validate();
        if (self.nodeSelector) |v| try v.validate();
    }
};

pub const CELDeviceSelector = struct {
    expression: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CapacityRequestPolicy = struct {
    default: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    validRange: ?root.io.k8s.api.resource.v1.CapacityRequestPolicyRange = null,
    validValues: ?[]const root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        if (self.validRange) |v| try v.validate();
    }
};

pub const CapacityRequestPolicyRange = struct {
    max: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    min: root.io.k8s.apimachinery.pkg.api.resource.Quantity,
    step: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CapacityRequirements = struct {
    requests: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Counter = struct {
    value: root.io.k8s.apimachinery.pkg.api.resource.Quantity,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CounterSet = struct {
    counters: std.json.Value,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Device = struct {
    allNodes: ?bool = null,
    allowMultipleAllocations: ?bool = null,
    attributes: ?std.json.Value = null,
    bindingConditions: ?[]const []const u8 = null,
    bindingFailureConditions: ?[]const []const u8 = null,
    bindsToNode: ?bool = null,
    capacity: ?std.json.Value = null,
    consumesCounters: ?[]const root.io.k8s.api.resource.v1.DeviceCounterConsumption = null,
    name: []const u8,
    nodeName: ?[]const u8 = null,
    nodeSelector: ?root.io.k8s.api.core.v1.NodeSelector = null,
    taints: ?[]const root.io.k8s.api.resource.v1.DeviceTaint = null,

    pub fn validate(self: @This()) !void {
        if (self.consumesCounters) |arr| for (arr) |item| try item.validate();
        if (self.nodeSelector) |v| try v.validate();
        if (self.taints) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceAllocationConfiguration = struct {
    @"opaque": ?root.io.k8s.api.resource.v1.OpaqueDeviceConfiguration = null,
    requests: ?[]const []const u8 = null,
    source: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.@"opaque") |v| try v.validate();
    }
};

pub const DeviceAllocationResult = struct {
    config: ?[]const root.io.k8s.api.resource.v1.DeviceAllocationConfiguration = null,
    results: ?[]const root.io.k8s.api.resource.v1.DeviceRequestAllocationResult = null,

    pub fn validate(self: @This()) !void {
        if (self.config) |arr| for (arr) |item| try item.validate();
        if (self.results) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceAttribute = struct {
    bool: ?bool = null,
    int: ?i64 = null,
    string: ?[]const u8 = null,
    version: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DeviceCapacity = struct {
    requestPolicy: ?root.io.k8s.api.resource.v1.CapacityRequestPolicy = null,
    value: root.io.k8s.apimachinery.pkg.api.resource.Quantity,

    pub fn validate(self: @This()) !void {
        if (self.requestPolicy) |v| try v.validate();
    }
};

pub const DeviceClaim = struct {
    config: ?[]const root.io.k8s.api.resource.v1.DeviceClaimConfiguration = null,
    constraints: ?[]const root.io.k8s.api.resource.v1.DeviceConstraint = null,
    requests: ?[]const root.io.k8s.api.resource.v1.DeviceRequest = null,

    pub fn validate(self: @This()) !void {
        if (self.config) |arr| for (arr) |item| try item.validate();
        if (self.constraints) |arr| for (arr) |item| try item.validate();
        if (self.requests) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceClaimConfiguration = struct {
    @"opaque": ?root.io.k8s.api.resource.v1.OpaqueDeviceConfiguration = null,
    requests: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.@"opaque") |v| try v.validate();
    }
};

pub const DeviceClass = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.resource.v1.DeviceClassSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const DeviceClassConfiguration = struct {
    @"opaque": ?root.io.k8s.api.resource.v1.OpaqueDeviceConfiguration = null,

    pub fn validate(self: @This()) !void {
        if (self.@"opaque") |v| try v.validate();
    }
};

pub const DeviceClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.resource.v1.DeviceClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const DeviceClassSpec = struct {
    config: ?[]const root.io.k8s.api.resource.v1.DeviceClassConfiguration = null,
    extendedResourceName: ?[]const u8 = null,
    selectors: ?[]const root.io.k8s.api.resource.v1.DeviceSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.config) |arr| for (arr) |item| try item.validate();
        if (self.selectors) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceConstraint = struct {
    distinctAttribute: ?[]const u8 = null,
    matchAttribute: ?[]const u8 = null,
    requests: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DeviceCounterConsumption = struct {
    counterSet: []const u8,
    counters: std.json.Value,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DeviceRequest = struct {
    exactly: ?root.io.k8s.api.resource.v1.ExactDeviceRequest = null,
    firstAvailable: ?[]const root.io.k8s.api.resource.v1.DeviceSubRequest = null,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.exactly) |v| try v.validate();
        if (self.firstAvailable) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceRequestAllocationResult = struct {
    adminAccess: ?bool = null,
    bindingConditions: ?[]const []const u8 = null,
    bindingFailureConditions: ?[]const []const u8 = null,
    consumedCapacity: ?std.json.Value = null,
    device: []const u8,
    driver: []const u8,
    pool: []const u8,
    request: []const u8,
    shareID: ?[]const u8 = null,
    tolerations: ?[]const root.io.k8s.api.resource.v1.DeviceToleration = null,

    pub fn validate(self: @This()) !void {
        if (self.tolerations) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceSelector = struct {
    cel: ?root.io.k8s.api.resource.v1.CELDeviceSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.cel) |v| try v.validate();
    }
};

pub const DeviceSubRequest = struct {
    allocationMode: ?[]const u8 = null,
    capacity: ?root.io.k8s.api.resource.v1.CapacityRequirements = null,
    count: ?i64 = null,
    deviceClassName: []const u8,
    name: []const u8,
    selectors: ?[]const root.io.k8s.api.resource.v1.DeviceSelector = null,
    tolerations: ?[]const root.io.k8s.api.resource.v1.DeviceToleration = null,

    pub fn validate(self: @This()) !void {
        if (self.capacity) |v| try v.validate();
        if (self.selectors) |arr| for (arr) |item| try item.validate();
        if (self.tolerations) |arr| for (arr) |item| try item.validate();
    }
};

pub const DeviceTaint = struct {
    effect: []const u8,
    key: []const u8,
    timeAdded: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DeviceToleration = struct {
    effect: ?[]const u8 = null,
    key: ?[]const u8 = null,
    operator: ?[]const u8 = null,
    tolerationSeconds: ?i64 = null,
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ExactDeviceRequest = struct {
    adminAccess: ?bool = null,
    allocationMode: ?[]const u8 = null,
    capacity: ?root.io.k8s.api.resource.v1.CapacityRequirements = null,
    count: ?i64 = null,
    deviceClassName: []const u8,
    selectors: ?[]const root.io.k8s.api.resource.v1.DeviceSelector = null,
    tolerations: ?[]const root.io.k8s.api.resource.v1.DeviceToleration = null,

    pub fn validate(self: @This()) !void {
        if (self.capacity) |v| try v.validate();
        if (self.selectors) |arr| for (arr) |item| try item.validate();
        if (self.tolerations) |arr| for (arr) |item| try item.validate();
    }
};

pub const NetworkDeviceData = struct {
    hardwareAddress: ?[]const u8 = null,
    interfaceName: ?[]const u8 = null,
    ips: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const OpaqueDeviceConfiguration = struct {
    driver: []const u8,
    parameters: root.io.k8s.apimachinery.pkg.runtime.RawExtension,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceClaim = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.resource.v1.ResourceClaimSpec,
    status: ?root.io.k8s.api.resource.v1.ResourceClaimStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ResourceClaimConsumerReference = struct {
    apiGroup: ?[]const u8 = null,
    name: []const u8,
    resource: []const u8,
    uid: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceClaimList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.resource.v1.ResourceClaim,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ResourceClaimSpec = struct {
    devices: ?root.io.k8s.api.resource.v1.DeviceClaim = null,

    pub fn validate(self: @This()) !void {
        if (self.devices) |v| try v.validate();
    }
};

pub const ResourceClaimStatus = struct {
    allocation: ?root.io.k8s.api.resource.v1.AllocationResult = null,
    devices: ?[]const root.io.k8s.api.resource.v1.AllocatedDeviceStatus = null,
    reservedFor: ?[]const root.io.k8s.api.resource.v1.ResourceClaimConsumerReference = null,

    pub fn validate(self: @This()) !void {
        if (self.allocation) |v| try v.validate();
        if (self.devices) |arr| for (arr) |item| try item.validate();
        if (self.reservedFor) |arr| for (arr) |item| try item.validate();
    }
};

pub const ResourceClaimTemplate = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.resource.v1.ResourceClaimTemplateSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const ResourceClaimTemplateList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.resource.v1.ResourceClaimTemplate,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ResourceClaimTemplateSpec = struct {
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.resource.v1.ResourceClaimSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const ResourcePool = struct {
    generation: i64,
    name: []const u8,
    resourceSliceCount: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceSlice = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.resource.v1.ResourceSliceSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const ResourceSliceList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.resource.v1.ResourceSlice,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ResourceSliceSpec = struct {
    allNodes: ?bool = null,
    devices: ?[]const root.io.k8s.api.resource.v1.Device = null,
    driver: []const u8,
    nodeName: ?[]const u8 = null,
    nodeSelector: ?root.io.k8s.api.core.v1.NodeSelector = null,
    perDeviceNodeSelection: ?bool = null,
    pool: root.io.k8s.api.resource.v1.ResourcePool,
    sharedCounters: ?[]const root.io.k8s.api.resource.v1.CounterSet = null,

    pub fn validate(self: @This()) !void {
        if (self.devices) |arr| for (arr) |item| try item.validate();
        if (self.nodeSelector) |v| try v.validate();
        try self.pool.validate();
        if (self.sharedCounters) |arr| for (arr) |item| try item.validate();
    }
};
