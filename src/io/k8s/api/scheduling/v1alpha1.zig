// Namespace: v1alpha1

const std = @import("std");
const root = @import("../../../../root.zig");

/// BasicSchedulingPolicy indicates that standard Kubernetes scheduling behavior should be used.
pub const BasicSchedulingPolicy = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// GangSchedulingPolicy defines the parameters for gang scheduling.
pub const GangSchedulingPolicy = struct {
    /// MinCount is the minimum number of pods that must be schedulable or scheduled at the same time for the scheduler to admit the entire group. It must be a positive integer.
    minCount: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodGroup represents a set of pods with a common scheduling policy.
pub const PodGroup = struct {
    /// Name is a unique identifier for the PodGroup within the Workload. It must be a DNS label. This field is immutable.
    name: []const u8,
    /// Policy defines the scheduling policy for this PodGroup.
    policy: root.io.k8s.api.scheduling.v1alpha1.PodGroupPolicy,

    pub fn validate(self: @This()) !void {
        try self.policy.validate();
    }
};

/// PodGroupPolicy defines the scheduling configuration for a PodGroup.
pub const PodGroupPolicy = struct {
    /// Basic specifies that the pods in this group should be scheduled using standard Kubernetes scheduling behavior.
    basic: ?root.io.k8s.api.scheduling.v1alpha1.BasicSchedulingPolicy = null,
    /// Gang specifies that the pods in this group should be scheduled using all-or-nothing semantics.
    gang: ?root.io.k8s.api.scheduling.v1alpha1.GangSchedulingPolicy = null,

    pub fn validate(self: @This()) !void {
        if (self.gang) |v| try v.validate();
    }
};

/// TypedLocalObjectReference allows to reference typed object inside the same namespace.
pub const TypedLocalObjectReference = struct {
    /// APIGroup is the group for the resource being referenced. If APIGroup is empty, the specified Kind must be in the core API group. For any other third-party types, setting APIGroup is required. It must be a DNS subdomain.
    apiGroup: ?[]const u8 = null,
    /// Kind is the type of resource being referenced. It must be a path segment name.
    kind: []const u8,
    /// Name is the name of resource being referenced. It must be a path segment name.
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Workload allows for expressing scheduling constraints that should be used when managing lifecycle of workloads from scheduling perspective, including scheduling, preemption, eviction and other phases.
pub const Workload = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. Name must be a DNS subdomain.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the desired behavior of a Workload.
    spec: root.io.k8s.api.scheduling.v1alpha1.WorkloadSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

/// WorkloadList contains a list of Workload resources.
pub const WorkloadList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of Workloads.
    items: []const root.io.k8s.api.scheduling.v1alpha1.Workload,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// WorkloadSpec defines the desired state of a Workload.
pub const WorkloadSpec = struct {
    /// ControllerRef is an optional reference to the controlling object, such as a Deployment or Job. This field is intended for use by tools like CLIs to provide a link back to the original workload definition. When set, it cannot be changed.
    controllerRef: ?root.io.k8s.api.scheduling.v1alpha1.TypedLocalObjectReference = null,
    /// PodGroups is the list of pod groups that make up the Workload. The maximum number of pod groups is 8. This field is immutable.
    podGroups: []const root.io.k8s.api.scheduling.v1alpha1.PodGroup,

    pub fn validate(self: @This()) !void {
        if (self.controllerRef) |v| try v.validate();
        for (self.podGroups) |item| try item.validate();
    }
};
