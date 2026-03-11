// Namespace: v1alpha2

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

/// PodGroup represents a runtime instance of pods grouped together. PodGroups are created by workload controllers (Job, LWS, JobSet, etc...) from Workload.podGroupTemplates. PodGroup API enablement is toggled by the GenericWorkload feature gate.
pub const PodGroup = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the desired state of the PodGroup.
    spec: root.io.k8s.api.scheduling.v1alpha2.PodGroupSpec,
    /// Status represents the current observed state of the PodGroup.
    status: ?root.io.k8s.api.scheduling.v1alpha2.PodGroupStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// PodGroupList contains a list of PodGroup resources.
pub const PodGroupList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of PodGroups.
    items: []const root.io.k8s.api.scheduling.v1alpha2.PodGroup,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// PodGroupSchedulingPolicy defines the scheduling configuration for a PodGroup. Exactly one policy must be set.
pub const PodGroupSchedulingPolicy = struct {
    /// Basic specifies that the pods in this group should be scheduled using standard Kubernetes scheduling behavior.
    basic: ?root.io.k8s.api.scheduling.v1alpha2.BasicSchedulingPolicy = null,
    /// Gang specifies that the pods in this group should be scheduled using all-or-nothing semantics.
    gang: ?root.io.k8s.api.scheduling.v1alpha2.GangSchedulingPolicy = null,

    pub fn validate(self: @This()) !void {
        if (self.gang) |v| try v.validate();
    }
};

/// PodGroupSpec defines the desired state of a PodGroup.
pub const PodGroupSpec = struct {
    /// PodGroupTemplateRef references an optional PodGroup template within other object (e.g. Workload) that was used to create the PodGroup. This field is immutable.
    podGroupTemplateRef: ?root.io.k8s.api.scheduling.v1alpha2.PodGroupTemplateReference = null,
    /// SchedulingPolicy defines the scheduling policy for this instance of the PodGroup. Controllers are expected to fill this field by copying it from a PodGroupTemplate. This field is immutable.
    schedulingPolicy: root.io.k8s.api.scheduling.v1alpha2.PodGroupSchedulingPolicy,

    pub fn validate(self: @This()) !void {
        if (self.podGroupTemplateRef) |v| try v.validate();
        try self.schedulingPolicy.validate();
    }
};

/// PodGroupStatus represents information about the status of a pod group.
pub const PodGroupStatus = struct {
    /// Conditions represent the latest observations of the PodGroup's state.
    ///
    /// Known condition types: - "PodGroupScheduled": Indicates whether the scheduling requirement has been satisfied. - "DisruptionTarget": Indicates whether the PodGroup is about to be terminated
    ///   due to disruption such as preemption.
    ///
    /// Known reasons for the PodGroupScheduled condition: - "Unschedulable": The PodGroup cannot be scheduled due to resource constraints,
    ///   affinity/anti-affinity rules, or insufficient capacity for the gang.
    /// - "SchedulerError": The PodGroup cannot be scheduled due to some internal error
    ///   that happened during scheduling, for example due to nodeAffinity parsing errors.
    ///
    /// Known reasons for the DisruptionTarget condition: - "PreemptionByScheduler": The PodGroup was preempted by the scheduler to make room for
    ///   higher-priority PodGroups or Pods.
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// PodGroupTemplate represents a template for a set of pods with a scheduling policy.
pub const PodGroupTemplate = struct {
    /// Name is a unique identifier for the PodGroupTemplate within the Workload. It must be a DNS label. This field is immutable.
    name: []const u8,
    /// SchedulingPolicy defines the scheduling policy for this PodGroupTemplate.
    schedulingPolicy: root.io.k8s.api.scheduling.v1alpha2.PodGroupSchedulingPolicy,

    pub fn validate(self: @This()) !void {
        try self.schedulingPolicy.validate();
    }
};

/// PodGroupTemplateReference references a PodGroup template defined in some object (e.g. Workload). Exactly one reference must be set.
pub const PodGroupTemplateReference = struct {
    /// Workload references the PodGroupTemplate within the Workload object that was used to create the PodGroup.
    workload: ?root.io.k8s.api.scheduling.v1alpha2.WorkloadPodGroupTemplateReference = null,

    pub fn validate(self: @This()) !void {
        if (self.workload) |v| try v.validate();
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

/// Workload allows for expressing scheduling constraints that should be used when managing the lifecycle of workloads from the scheduling perspective, including scheduling, preemption, eviction and other phases. Workload API enablement is toggled by the GenericWorkload feature gate.
pub const Workload = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the desired behavior of a Workload.
    spec: root.io.k8s.api.scheduling.v1alpha2.WorkloadSpec,

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
    items: []const root.io.k8s.api.scheduling.v1alpha2.Workload,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// WorkloadPodGroupTemplateReference references the PodGroupTemplate within the Workload object.
pub const WorkloadPodGroupTemplateReference = struct {
    /// PodGroupTemplateName defines the PodGroupTemplate name within the Workload object.
    podGroupTemplateName: []const u8,
    /// WorkloadName defines the name of the Workload object.
    workloadName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadSpec defines the desired state of a Workload.
pub const WorkloadSpec = struct {
    /// ControllerRef is an optional reference to the controlling object, such as a Deployment or Job. This field is intended for use by tools like CLIs to provide a link back to the original workload definition. This field is immutable.
    controllerRef: ?root.io.k8s.api.scheduling.v1alpha2.TypedLocalObjectReference = null,
    /// PodGroupTemplates is the list of templates that make up the Workload. The maximum number of templates is 8. This field is immutable.
    podGroupTemplates: []const root.io.k8s.api.scheduling.v1alpha2.PodGroupTemplate,

    pub fn validate(self: @This()) !void {
        if (self.controllerRef) |v| try v.validate();
        for (self.podGroupTemplates) |item| try item.validate();
    }
};
