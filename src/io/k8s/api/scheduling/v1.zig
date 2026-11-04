// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

/// PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer.
pub const PriorityClass = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// description is an arbitrary string that usually provides guidelines on when this priority class should be used.
    description: ?[]const u8 = null,
    /// globalDefault specifies whether this PriorityClass should be considered as the default priority for pods that do not have any priority class. Only one PriorityClass can be marked as `globalDefault`. However, if more than one PriorityClasses exists with their `globalDefault` field set to true, the smallest value of such global default PriorityClasses will be used as the default priority.
    globalDefault: ?bool = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// preemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.
    preemptionPolicy: ?[]const u8 = null,
    /// value represents the integer value of this priority class. This is the actual priority that pods receive when they have the name of this class in their pod spec.
    value: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

/// PriorityClassList is a collection of priority classes.
pub const PriorityClassList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is the list of PriorityClasses
    items: []const root.io.k8s.api.scheduling.v1.PriorityClass,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// WorkloadPodGroupAllDisruptionMode indicates that all pods in the group must be disrupted together.
pub const WorkloadPodGroupAllDisruptionMode = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadPodGroupBasicSchedulingPolicy indicates standard Kubernetes scheduling behavior.
pub const WorkloadPodGroupBasicSchedulingPolicy = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadPodGroupDisruptionMode defines how individual pods within a group can be disrupted. Exactly one mode must be set.
pub const WorkloadPodGroupDisruptionMode = struct {
    /// all specifies that all pods in the group must be disrupted together.
    all: ?root.io.k8s.api.scheduling.v1.WorkloadPodGroupAllDisruptionMode = null,
    /// single specifies that pods can be disrupted independently from each other.
    single: ?root.io.k8s.api.scheduling.v1.WorkloadPodGroupSingleDisruptionMode = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadPodGroupGangSchedulingPolicy defines the parameters for gang (all-or-nothing) scheduling.
pub const WorkloadPodGroupGangSchedulingPolicy = struct {
    /// minCount is the minimum number of pods that must be scheduled at the same time for the scheduler to admit the entire group. This field is optional. If it is not specified, the controller should inject a context-specific sane default (e.g., parallelism for a Job). If set, it must be a positive integer.
    minCount: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadPodGroupResourceClaim references a dynamic resource claim that is shared across pods in the group.
pub const WorkloadPodGroupResourceClaim = struct {
    /// name uniquely identifies this resource claim inside the group. This field is required. It must be a DNS_LABEL.
    name: []const u8,
    /// resourceClaimName is the name of a ResourceClaim object in the same namespace. This field is optional. If it is not specified, no resource claim is used. If set, it must be a DNS subdomain.
    resourceClaimName: ?[]const u8 = null,
    /// resourceClaimTemplateName is the name of a ResourceClaimTemplate object in the same namespace. This field is optional. If it is not specified, no resource claim template is used. If set, it must be a DNS subdomain.
    resourceClaimTemplateName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadPodGroupSchedulingConstraints defines leaf-level scheduling constraints, such as topology.
pub const WorkloadPodGroupSchedulingConstraints = struct {
    /// topology specifies desired topological placements for all pods within the pod group. If unset, no topology placement is requested.
    topology: ?[]const root.io.k8s.api.scheduling.v1.WorkloadTopologyConstraint = null,

    pub fn validate(self: @This()) !void {
        if (self.topology) |arr| for (arr) |item| try item.validate();
    }
};

/// WorkloadPodGroupSchedulingPolicy defines the scheduling policy for a group of pods managed by a workload controller. Exactly one policy must be set.
pub const WorkloadPodGroupSchedulingPolicy = struct {
    /// basic specifies that standard, pod-by-pod Kubernetes scheduling behavior should be used.
    basic: ?root.io.k8s.api.scheduling.v1.WorkloadPodGroupBasicSchedulingPolicy = null,
    /// gang specifies all-or-nothing scheduling semantics.
    gang: ?root.io.k8s.api.scheduling.v1.WorkloadPodGroupGangSchedulingPolicy = null,

    pub fn validate(self: @This()) !void {
        if (self.gang) |v| try v.validate();
    }
};

/// WorkloadPodGroupSingleDisruptionMode indicates that individual pods can be disrupted independently.
pub const WorkloadPodGroupSingleDisruptionMode = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadTopologyConstraint defines a topology constraint for a group of pods managed by a workload controller.
pub const WorkloadTopologyConstraint = struct {
    /// key specifies the key of the node label representing the topology domain. All pods within the PodGroup (or CompositePodGroup) must be colocated within the same domain instance. Different groups can land on different domain instances even if they derive from the same template. Nodes where this label is missing or has an empty value do not belong to any domain instance, so pods within the PodGroup/CompositePodGroup cannot be scheduled onto them. Examples: "topology.kubernetes.io/rack"
    key: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
