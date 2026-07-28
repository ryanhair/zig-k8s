// Namespace: v1alpha3

const std = @import("std");
const root = @import("../../../../root.zig");

/// AllCompositeDisruptionMode means that children of a CompositePodGroup can only be disrupted or preempted together.
pub const AllCompositeDisruptionMode = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// AllDisruptionMode specifies that children can only be disrupted together.
pub const AllDisruptionMode = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// BasicSchedulingPolicy indicates that standard Kubernetes scheduling behavior should be used.
pub const BasicSchedulingPolicy = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// CompositeBasicSchedulingPolicy indicates that the groups belonging to the composite group should be scheduled independently.
pub const CompositeBasicSchedulingPolicy = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// CompositeDisruptionMode defines how individual entities within a composite pod group can be disrupted. Exactly one mode must be set.
pub const CompositeDisruptionMode = struct {
    /// all specifies that all children groups can only be disrupted together.
    all: ?root.io.k8s.api.scheduling.v1alpha3.AllCompositeDisruptionMode = null,
    /// single specifies that children groups can be disrupted independently from each other.
    single: ?root.io.k8s.api.scheduling.v1alpha3.SingleCompositeDisruptionMode = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// CompositeGangSchedulingPolicy indicates that the groups belonging to the composite group should be scheduled using all-or-nothing semantics.
pub const CompositeGangSchedulingPolicy = struct {
    /// minGroupCount is the minimum number of child groups that must be schedulable or scheduled at the same time for the scheduler to admit the entire group. It must be a positive integer.
    minGroupCount: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// CompositePodGroup represents a runtime instance of pod groups grouped together. CompositePodGroups are created by workload controllers (LWS, JobSet, etc...) from Workload.compositePodGroupTemplates. CompositePodGroup API enablement is toggled by the CompositePodGroup feature gate.
pub const CompositePodGroup = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired state of the CompositePodGroup.
    spec: root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupSpec,
    /// status represents the current observed state of the CompositePodGroup.
    status: ?root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// CompositePodGroupList contains a list of CompositePodGroup resources.
pub const CompositePodGroupList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of CompositePodGroups.
    items: []const root.io.k8s.api.scheduling.v1alpha3.CompositePodGroup,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// CompositePodGroupSchedulingConstraints defines scheduling constraints (e.g. topology) for a CompositePodGroup.
pub const CompositePodGroupSchedulingConstraints = struct {
    /// topology defines the topology constraints for the composite pod group. Currently only a single topology constraint can be specified. This may change in the future.
    topology: ?[]const root.io.k8s.api.scheduling.v1alpha3.TopologyConstraint = null,

    pub fn validate(self: @This()) !void {
        if (self.topology) |arr| for (arr) |item| try item.validate();
    }
};

/// CompositePodGroupSchedulingPolicy defines the scheduling configuration for a CompositePodGroup. Exactly one policy must be set.
pub const CompositePodGroupSchedulingPolicy = struct {
    /// basic specifies that the groups of this composite group should be scheduled independently. This field is immutable.
    basic: ?root.io.k8s.api.scheduling.v1alpha3.CompositeBasicSchedulingPolicy = null,
    /// gang specifies that the groups of this composite group should be scheduled using all-or-nothing semantics.
    gang: ?root.io.k8s.api.scheduling.v1alpha3.CompositeGangSchedulingPolicy = null,

    pub fn validate(self: @This()) !void {
        if (self.gang) |v| try v.validate();
    }
};

/// CompositePodGroupSpec defines the desired state of CompositePodGroup.
pub const CompositePodGroupSpec = struct {
    /// disruptionMode defines the mode in which a given CompositePodGroup can be disrupted. Controllers are expected to fill this field by copying it from a CompositePodGroupTemplate. One of Single, All. Defaults to Single if unset. This field is immutable.
    disruptionMode: ?root.io.k8s.api.scheduling.v1alpha3.CompositeDisruptionMode = null,
    /// parentCompositePodGroupName contains the name of the parent composite pod group within the same namespace as this composite pod group. It must be a DNS name. If it's nil, then this composite pod group is a root of a workload's hierarchy. This field is immutable.
    parentCompositePodGroupName: ?[]const u8 = null,
    /// preemptionPolicy is the Policy for preempting pods/podgroups with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset. When Priority Admission Controller is enabled, it populates this field from PriorityClassName, and defaults to PreemptLowerPriority if value is unset in PriorityClass. This field is immutable. This field is available only when the PodGroupPreemptionPolicy feature gate is enabled.
    preemptionPolicy: ?[]const u8 = null,
    /// priority is the value of priority of this composite pod group. Various system components use this field to find the priority of the composite pod group. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority. This field is immutable.
    priority: ?i64 = null,
    /// priorityClassName defines the priority that should be considered when scheduling this CompositePodGroup. Controllers are expected to fill this field by copying it from a CompositePodGroupTemplate. If left unspecified, it is validated and resolved similarly to the PriorityClassName field in Pods (i.e. if no priority class is specified, admission control can set this to the global default priority class if it exists. Otherwise, the composite pod group's priority will be zero). This field is immutable.
    priorityClassName: ?[]const u8 = null,
    /// schedulingConstraints defines optional scheduling constraints (e.g. topology) for this CompositePodGroup. Controllers are expected to fill this field by copying it from a CompositePodGroupTemplate. This field is immutable.
    schedulingConstraints: ?root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupSchedulingConstraints = null,
    /// schedulingPolicy defines the scheduling policy for this instance of the CompositePodGroup. Controllers are expected to fill this field by copying it from a CompositePodGroupTemplate. This field is immutable.
    schedulingPolicy: root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupSchedulingPolicy,
    /// workloadRef references an optional CompositePodGroup template within the Workload object that was used to create the CompositePodGroup. This field is required. This field is immutable.
    workloadRef: root.io.k8s.api.scheduling.v1alpha3.WorkloadReference,

    pub fn validate(self: @This()) !void {
        if (self.disruptionMode) |v| try v.validate();
        if (self.schedulingConstraints) |v| try v.validate();
        try self.schedulingPolicy.validate();
        try self.workloadRef.validate();
    }
};

/// CompositePodGroupStatus represents information about the status of a composite pod group.
pub const CompositePodGroupStatus = struct {
    /// conditions represent the latest observations of the CompositePodGroup's state.
    ///
    /// Known condition types: - "CompositePodGroupInitiallyScheduled": Indicates whether the overall scheduling requirement
    ///   for the subtree under this CompositePodGroup has been satisfied. Once this condition
    ///   transitions to True, it serves as a terminal state and will never revert to False,
    ///   even if pods are subsequently deleted and group constraints are no longer met.
    /// - "DisruptionTarget": Indicates whether the CompositePodGroup is about to be terminated
    ///   due to disruption such as preemption.
    ///
    /// Known reasons for the CompositePodGroupInitiallyScheduled condition: - "Unschedulable": The CompositePodGroup's subtree could not be placed due to resource constraints,
    ///   affinity/anti-affinity, or topological constraints.
    /// - "SchedulerError": The CompositePodGroup cannot be scheduled due to some internal error
    ///   that occurred during scheduling.
    /// - "Invalid": Set to True when kube-scheduler detects an invalid group layout during
    ///   runtime validation. The `message` field details the specific layout violation (such as
    ///   a detected cycle, exceeding the maximum depth of 4, or referencing multiple distinct Workloads).
    ///
    /// Known reasons for the DisruptionTarget condition: - "PreemptionByScheduler": The CompositePodGroup was targeted by the scheduler's preemption loop
    ///   to free up capacity for higher-priority preemptors.
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// CompositePodGroupTemplate represents a template for a CompositePodGroup with a scheduling policy.
pub const CompositePodGroupTemplate = struct {
    /// compositePodGroupTemplates is the list of templates for children CompositePodGroups. The maximum number of templates is 8. At least one entry in CompositePodGroupTemplates or PodGroupTemplates must be set.
    compositePodGroupTemplates: ?[]const root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupTemplate = null,
    /// disruptionMode defines the mode in which a given CompositePodGroup can be disrupted. One of Single, All. This field is immutable.
    disruptionMode: ?root.io.k8s.api.scheduling.v1alpha3.CompositeDisruptionMode = null,
    /// name is a unique identifier for the CompositePodGroupTemplate within the Workload. It must be a DNS label. This field is required.
    name: []const u8,
    /// podGroupTemplates is the list of templates for children PodGroups. The maximum number of templates is 8. At least one entry in CompositePodGroupTemplates or PodGroupTemplates must be set.
    podGroupTemplates: ?[]const root.io.k8s.api.scheduling.v1alpha3.PodGroupTemplate = null,
    /// preemptionPolicy is the Policy for preempting pods/podgroups with lower priority. One of Never, PreemptLowerPriority. This field is immutable. This field is available only when the PodGroupPreemptionPolicy feature gate is enabled.
    preemptionPolicy: ?[]const u8 = null,
    /// priority is the value of priority of composite pod groups created from this template. Various system components use this field to find the priority of the composite pod group. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority. This field is immutable.
    priority: ?i64 = null,
    /// priorityClassName indicates the priority that should be considered when scheduling a composite pod group created from this template. If no priority class is specified, admission control can set this to the global default priority class if it exists. Otherwise, composite pod groups created from this template will have the priority set to zero. This field is immutable.
    priorityClassName: ?[]const u8 = null,
    /// schedulingConstraints defines optional scheduling constraints (e.g. topology) for this CompositePodGroupTemplate. This field is immutable.
    schedulingConstraints: ?root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupSchedulingConstraints = null,
    /// schedulingPolicy defines the scheduling policy for this template.
    schedulingPolicy: root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupSchedulingPolicy,

    pub fn validate(self: @This()) !void {
        if (self.compositePodGroupTemplates) |arr| for (arr) |item| try item.validate();
        if (self.disruptionMode) |v| try v.validate();
        if (self.podGroupTemplates) |arr| for (arr) |item| try item.validate();
        if (self.schedulingConstraints) |v| try v.validate();
        try self.schedulingPolicy.validate();
    }
};

/// DisruptionMode defines how individual entities within a group can be disrupted. Exactly one mode can be set.
pub const DisruptionMode = struct {
    /// all specifies that all children can only be disrupted together.
    all: ?root.io.k8s.api.scheduling.v1alpha3.AllDisruptionMode = null,
    /// single specifies that children can be disrupted independently from each other.
    single: ?root.io.k8s.api.scheduling.v1alpha3.SingleDisruptionMode = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// GangSchedulingPolicy defines the parameters for gang scheduling.
pub const GangSchedulingPolicy = struct {
    /// minCount is the minimum number of pods that must be schedulable or scheduled at the same time for the scheduler to admit the entire group. It must be a positive integer. This field is mutable to support workload scaling.
    ///
    /// Note that the scheduler operates on an eventually consistent model. Updates to minCount may not be immediately reflected in scheduling decisions due to propagation delays. If minCount is updated while a scheduling cycle is in progress for that group, the new value may not take effect until the next cycle. Moreover, minCount is only enforced during scheduling, meaning that modifications to this field do not affect already-scheduled pods, applying only to those evaluated in future cycles.
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
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired state of the PodGroup.
    spec: root.io.k8s.api.scheduling.v1alpha3.PodGroupSpec,
    /// status represents the current observed state of the PodGroup.
    status: ?root.io.k8s.api.scheduling.v1alpha3.PodGroupStatus = null,

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
    items: []const root.io.k8s.api.scheduling.v1alpha3.PodGroup,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// PodGroupResourceClaim references exactly one ResourceClaim, either directly or by naming a ResourceClaimTemplate which is then turned into a ResourceClaim for the PodGroup.
///
/// It adds a name to it that uniquely identifies the ResourceClaim inside the PodGroup. Pods that need access to the ResourceClaim define a matching reference in its own Spec.ResourceClaims. The Pod's claim must match all fields of the PodGroup's claim exactly.
pub const PodGroupResourceClaim = struct {
    /// name uniquely identifies this resource claim inside the PodGroup. This must be a DNS_LABEL.
    name: []const u8,
    /// resourceClaimName is the name of a ResourceClaim object in the same namespace as this PodGroup. The ResourceClaim will be reserved for the PodGroup instead of its individual pods.
    ///
    /// Exactly one of ResourceClaimName and ResourceClaimTemplateName must be set.
    resourceClaimName: ?[]const u8 = null,
    /// resourceClaimTemplateName is the name of a ResourceClaimTemplate object in the same namespace as this PodGroup.
    ///
    /// The template will be used to create a new ResourceClaim, which will be bound to this PodGroup. When this PodGroup is deleted, the ResourceClaim will also be deleted. The PodGroup name and resource name, along with a generated component, will be used to form a unique name for the ResourceClaim, which will be recorded in podgroup.status.resourceClaimStatuses.
    ///
    /// This field is immutable and no changes will be made to the corresponding ResourceClaim by the control plane after creating the ResourceClaim.
    ///
    /// Exactly one of ResourceClaimName and ResourceClaimTemplateName must be set.
    resourceClaimTemplateName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodGroupResourceClaimStatus is stored in the PodGroupStatus for each PodGroupResourceClaim which references a ResourceClaimTemplate. It stores the generated name for the corresponding ResourceClaim.
pub const PodGroupResourceClaimStatus = struct {
    /// name uniquely identifies this resource claim inside the PodGroup. This must match the name of an entry in podgroup.spec.resourceClaims, which implies that the string must be a DNS_LABEL.
    name: []const u8,
    /// resourceClaimName is the name of the ResourceClaim that was generated for the PodGroup in the namespace of the PodGroup. If this is unset, then generating a ResourceClaim was not necessary. The podgroup.spec.resourceClaims entry can be ignored in this case.
    resourceClaimName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodGroupSchedulingConstraints defines scheduling constraints (e.g. topology) for a PodGroup.
pub const PodGroupSchedulingConstraints = struct {
    /// topology defines the topology constraints for the pod group. Currently only a single topology constraint can be specified. This may change in the future.
    topology: ?[]const root.io.k8s.api.scheduling.v1alpha3.TopologyConstraint = null,

    pub fn validate(self: @This()) !void {
        if (self.topology) |arr| for (arr) |item| try item.validate();
    }
};

/// PodGroupSchedulingPolicy defines the scheduling configuration for a PodGroup. Exactly one policy must be set. The policy is chosen at creation time by setting either the Basic or Gang field. The PodGroup may not change policy after creation. Fields within chosen policy may be updated after creation when their individual fields allow it.
pub const PodGroupSchedulingPolicy = struct {
    /// basic specifies that the pods in this group should be scheduled using standard Kubernetes scheduling behavior. Setting this field at group creation time opts this group to basic scheduling; this field cannot be changed afterward.
    basic: ?root.io.k8s.api.scheduling.v1alpha3.BasicSchedulingPolicy = null,
    /// gang specifies that the pods in this group should be scheduled using all-or-nothing semantics. Setting this field at group creation time opts this group to gang scheduling; this field cannot be set or unset afterward. The minCount field within Gang scheduling policy remains mutable after group creation.
    gang: ?root.io.k8s.api.scheduling.v1alpha3.GangSchedulingPolicy = null,

    pub fn validate(self: @This()) !void {
        if (self.gang) |v| try v.validate();
    }
};

/// PodGroupSpec defines the desired state of a PodGroup.
pub const PodGroupSpec = struct {
    /// disruptionMode defines the mode in which a given PodGroup can be disrupted. Controllers are expected to fill this field by copying it from a PodGroupTemplate. One of Single, All. Defaults to Single if unset. This field is immutable.
    disruptionMode: ?root.io.k8s.api.scheduling.v1alpha3.DisruptionMode = null,
    /// parentCompositePodGroupName contains the name of the parent composite pod group within the same namespace as this pod group. If it's nil, then this pod group is a root of a workload's hierarchy. This field is used only when the CompositePodGroup feature gate is enabled. This field is immutable.
    parentCompositePodGroupName: ?[]const u8 = null,
    /// preemptionPolicy is the Policy for preempting pods/podgroups with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset. When Priority Admission Controller is enabled, it populates this field from PriorityClassName, and defaults to PreemptLowerPriority if value is unset in PriorityClass. This field is immutable. This field is available only when the PodGroupPreemptionPolicy feature gate is enabled.
    preemptionPolicy: ?[]const u8 = null,
    /// priority is the value of priority of this pod group. Various system components use this field to find the priority of the pod group. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority. This field is immutable.
    priority: ?i64 = null,
    /// priorityClassName defines the priority that should be considered when scheduling this pod group. Controllers are expected to fill this field by copying it from a PodGroupTemplate. Otherwise, it is validated and resolved similarly to the PriorityClassName on PodGroupTemplate (i.e. if no priority class is specified, admission control can set this to the global default priority class if it exists. Otherwise, the pod group's priority will be zero). This field is immutable.
    priorityClassName: ?[]const u8 = null,
    /// resourceClaims defines which ResourceClaims may be shared among Pods in the group. Pods consume the devices allocated to a PodGroup's claim by defining a claim in its own Spec.ResourceClaims that matches the PodGroup's claim exactly. The claim must have the same name and refer to the same ResourceClaim or ResourceClaimTemplate.
    ///
    /// This is a beta-level field and requires that the DRAWorkloadResourceClaims feature gate is enabled.
    ///
    /// This field is immutable.
    resourceClaims: ?[]const root.io.k8s.api.scheduling.v1alpha3.PodGroupResourceClaim = null,
    /// schedulingConstraints defines optional scheduling constraints (e.g. topology) for this PodGroup. Controllers are expected to fill this field by copying it from a PodGroupTemplate. This field is immutable. This field is only available when the TopologyAwareWorkloadScheduling feature gate is enabled.
    schedulingConstraints: ?root.io.k8s.api.scheduling.v1alpha3.PodGroupSchedulingConstraints = null,
    /// schedulingPolicy defines the scheduling policy for this instance of the PodGroup. Controllers are expected to fill this field by copying it from a PodGroupTemplate.
    schedulingPolicy: root.io.k8s.api.scheduling.v1alpha3.PodGroupSchedulingPolicy,
    /// workloadRef references an optional PodGroup template within the Workload object that was used to create the PodGroup. This field is immutable.
    workloadRef: ?root.io.k8s.api.scheduling.v1alpha3.WorkloadReference = null,

    pub fn validate(self: @This()) !void {
        if (self.disruptionMode) |v| try v.validate();
        if (self.resourceClaims) |arr| for (arr) |item| try item.validate();
        if (self.schedulingConstraints) |v| try v.validate();
        try self.schedulingPolicy.validate();
        if (self.workloadRef) |v| try v.validate();
    }
};

/// PodGroupStatus represents information about the status of a pod group.
pub const PodGroupStatus = struct {
    /// conditions represent the latest observations of the PodGroup's state.
    ///
    /// Known condition types: - "PodGroupInitiallyScheduled": Indicates whether the scheduling requirement has been satisfied. Once this condition transitions to True, it serves as a terminal state and will never revert to False, even if pods are subsequently evicted and group constraints are no longer met. - "DisruptionTarget": Indicates whether the PodGroup is about to be terminated
    ///   due to disruption such as preemption.
    ///
    /// Known reasons for the PodGroupInitiallyScheduled condition: - "Unschedulable": The PodGroup cannot be scheduled due to resource constraints,
    ///   affinity/anti-affinity rules, or insufficient capacity for the gang.
    /// - "SchedulerError": The PodGroup cannot be scheduled due to some internal error
    ///   that happened during scheduling, for example due to nodeAffinity parsing errors.
    ///
    /// Known reasons for the DisruptionTarget condition: - "PreemptionByScheduler": The PodGroup was preempted by the scheduler to make room for
    ///   higher-priority PodGroups or Pods.
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    /// resourceClaimStatuses is status of resource claims.
    resourceClaimStatuses: ?[]const root.io.k8s.api.scheduling.v1alpha3.PodGroupResourceClaimStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.resourceClaimStatuses) |arr| for (arr) |item| try item.validate();
    }
};

/// PodGroupTemplate represents a template for a set of pods with a scheduling policy.
pub const PodGroupTemplate = struct {
    /// disruptionMode defines the mode in which a given PodGroup can be disrupted. One of Single, All. This field is immutable.
    disruptionMode: ?root.io.k8s.api.scheduling.v1alpha3.DisruptionMode = null,
    /// name is a unique identifier for the PodGroupTemplate within the Workload. It must be a DNS label. This field is immutable.
    name: []const u8,
    /// preemptionPolicy is the Policy for preempting pods/podgroups with lower priority. One of Never, PreemptLowerPriority. This field is immutable. This field is available only when the PodGroupPreemptionPolicy feature gate is enabled.
    preemptionPolicy: ?[]const u8 = null,
    /// priority is the value of priority of pod groups created from this template. Various system components use this field to find the priority of the pod group. The higher the value, the higher the priority. This field is immutable.
    priority: ?i64 = null,
    /// priorityClassName indicates the priority that should be considered when scheduling a pod group created from this template. This field is immutable.
    priorityClassName: ?[]const u8 = null,
    /// resourceClaims defines which ResourceClaims may be shared among Pods in the group. Pods consume the devices allocated to a PodGroup's claim by defining a claim in its own Spec.ResourceClaims that matches the PodGroup's claim exactly. The claim must have the same name and refer to the same ResourceClaim or ResourceClaimTemplate.
    ///
    /// This is a beta-level field and requires that the DRAWorkloadResourceClaims feature gate is enabled.
    ///
    /// This field is immutable.
    resourceClaims: ?[]const root.io.k8s.api.scheduling.v1alpha3.PodGroupResourceClaim = null,
    /// schedulingConstraints defines optional scheduling constraints (e.g. topology) for this PodGroupTemplate. This field is only available when the TopologyAwareWorkloadScheduling feature gate is enabled. This field is immutable.
    schedulingConstraints: ?root.io.k8s.api.scheduling.v1alpha3.PodGroupSchedulingConstraints = null,
    /// schedulingPolicy defines the scheduling policy for this PodGroupTemplate.
    schedulingPolicy: root.io.k8s.api.scheduling.v1alpha3.PodGroupSchedulingPolicy,

    pub fn validate(self: @This()) !void {
        if (self.disruptionMode) |v| try v.validate();
        if (self.resourceClaims) |arr| for (arr) |item| try item.validate();
        if (self.schedulingConstraints) |v| try v.validate();
        try self.schedulingPolicy.validate();
    }
};

/// SingleCompositeDisruptionMode means that individual children of a CompositePodGroup can be disrupted or preempted independently.
pub const SingleCompositeDisruptionMode = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SingleDisruptionMode specifies that children can be disrupted independently.
pub const SingleDisruptionMode = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// TopologyConstraint defines a topology constraint for a PodGroup.
pub const TopologyConstraint = struct {
    /// key specifies the key of the node label representing the topology domain. All pods within the PodGroup must be colocated within the same domain instance. Different PodGroups can land on different domain instances even if they derive from the same PodGroupTemplate. Examples: "topology.kubernetes.io/rack"
    key: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// TypedLocalObjectReference allows to reference typed object inside the same namespace.
pub const TypedLocalObjectReference = struct {
    /// apiGroup is the group for the resource being referenced. If APIGroup is empty, the specified Kind must be in the core API group. For any other third-party types, setting APIGroup is required. It must be a DNS subdomain.
    apiGroup: ?[]const u8 = null,
    /// kind is the type of resource being referenced. It must be a path segment name.
    kind: []const u8,
    /// name is the name of resource being referenced. It must be a path segment name.
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
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired behavior of a Workload.
    spec: root.io.k8s.api.scheduling.v1alpha3.WorkloadSpec,

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
    items: []const root.io.k8s.api.scheduling.v1alpha3.Workload,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata.
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
    all: ?root.io.k8s.api.scheduling.v1alpha3.WorkloadPodGroupAllDisruptionMode = null,
    /// single specifies that pods can be disrupted independently from each other.
    single: ?root.io.k8s.api.scheduling.v1alpha3.WorkloadPodGroupSingleDisruptionMode = null,

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
    topology: ?[]const root.io.k8s.api.scheduling.v1alpha3.TopologyConstraint = null,

    pub fn validate(self: @This()) !void {
        if (self.topology) |arr| for (arr) |item| try item.validate();
    }
};

/// WorkloadPodGroupSchedulingPolicy defines the scheduling policy for a group of pods managed by a workload controller. Exactly one policy must be set.
pub const WorkloadPodGroupSchedulingPolicy = struct {
    /// basic specifies that standard, pod-by-pod Kubernetes scheduling behavior should be used.
    basic: ?root.io.k8s.api.scheduling.v1alpha3.WorkloadPodGroupBasicSchedulingPolicy = null,
    /// gang specifies all-or-nothing scheduling semantics.
    gang: ?root.io.k8s.api.scheduling.v1alpha3.WorkloadPodGroupGangSchedulingPolicy = null,

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

/// WorkloadReference references the Workload object together with the template that was used to create a particular PodGroup.
pub const WorkloadReference = struct {
    /// templateName is the name of a template within the Workload object that was used to create a pod group. It must be a DNS label. This field is required.
    templateName: []const u8,
    /// workloadName is the name of the Workload object that contains a template that was used when creating a pod group. It must be a DNS name. This field is required.
    workloadName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadSpec defines the desired state of a Workload.
pub const WorkloadSpec = struct {
    /// compositePodGroupTemplates is the list of CompositePodGroup templates that make up the Workload. The maximum number of templates is 8. This field is immutable. Exactly one of CompositePodGroupTemplates and PodGroupTemplates must be set.
    ///
    /// This field is used only when the CompositePodGroup feature gate is enabled.
    compositePodGroupTemplates: ?[]const root.io.k8s.api.scheduling.v1alpha3.CompositePodGroupTemplate = null,
    /// controllerRef is an optional reference to the controlling object, such as a Deployment or Job. This field is intended for use by tools like CLIs to provide a link back to the original workload definition. This field is immutable.
    controllerRef: ?root.io.k8s.api.scheduling.v1alpha3.TypedLocalObjectReference = null,
    /// podGroupTemplates is the list of templates that make up the Workload. The maximum number of templates is 8. Templates cannot be added or removed after the workload is created. Existing templates may still be updated where their individual fields allow it. Exactly one of CompositePodGroupTemplates and PodGroupTemplates must be set.
    podGroupTemplates: ?[]const root.io.k8s.api.scheduling.v1alpha3.PodGroupTemplate = null,

    pub fn validate(self: @This()) !void {
        if (self.compositePodGroupTemplates) |arr| for (arr) |item| try item.validate();
        if (self.controllerRef) |v| try v.validate();
        if (self.podGroupTemplates) |arr| for (arr) |item| try item.validate();
    }
};
