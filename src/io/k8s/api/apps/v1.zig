// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

/// ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers.
pub const ControllerRevision = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// data is the serialized representation of the state.
    data: root.io.k8s.apimachinery.pkg.runtime.RawExtension,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// revision indicates the revision of the state represented by Data.
    revision: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

/// ControllerRevisionList is a resource containing a list of ControllerRevision objects.
pub const ControllerRevisionList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of ControllerRevisions
    items: []const root.io.k8s.api.apps.v1.ControllerRevision,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// DaemonSet represents the configuration of a daemon set.
pub const DaemonSet = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired behavior of this daemon set. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: root.io.k8s.api.apps.v1.DaemonSetSpec,
    /// status is the current status of this daemon set. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.apps.v1.DaemonSetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// DaemonSetCondition describes the state of a DaemonSet at a certain point.
pub const DaemonSetCondition = struct {
    /// lastTransitionTime is the last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is a human readable string indicating details about the transition.
    message: ?[]const u8 = null,
    /// reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// status of the condition, one of True, False, Unknown.
    status: ?[]const u8 = null,
    /// type of DaemonSet condition.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// DaemonSetList is a collection of daemon sets.
pub const DaemonSetList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// A list of daemon sets.
    items: []const root.io.k8s.api.apps.v1.DaemonSet,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// DaemonSetSpec is the specification of a daemon set.
pub const DaemonSetSpec = struct {
    /// minReadySeconds is the minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
    minReadySeconds: ?i64 = null,
    /// revisionHistoryLimit is the maximum number of old revisions to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
    revisionHistoryLimit: ?i64 = null,
    /// selector is the label query to identify pods that are managed by the daemon set. Must match in order to be controlled. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    /// template describes the pod that will be created. The DaemonSet will create exactly one copy of this pod on every node that matches the template's node selector (or on every node if no node selector is specified). The only allowed template.spec.restartPolicy value is "Always". More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
    template: root.io.k8s.api.core.v1.PodTemplateSpec,
    /// updateStrategy to replace existing DaemonSet pods with new pods.
    updateStrategy: ?root.io.k8s.api.apps.v1.DaemonSetUpdateStrategy = null,

    pub fn validate(self: @This()) !void {
        try self.selector.validate();
        try self.template.validate();
        if (self.updateStrategy) |v| try v.validate();
    }
};

/// DaemonSetStatus represents the current status of a daemon set.
pub const DaemonSetStatus = struct {
    /// collisionCount is the number of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
    collisionCount: ?i64 = null,
    /// conditions lists the latest available observations of a DaemonSet's current state.
    conditions: ?[]const root.io.k8s.api.apps.v1.DaemonSetCondition = null,
    /// currentNumberScheduled is the number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
    currentNumberScheduled: i64,
    /// desiredNumberScheduled is the total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
    desiredNumberScheduled: i64,
    /// numberAvailable is the number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds).
    numberAvailable: ?i64 = null,
    /// numberMisscheduled is the number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
    numberMisscheduled: i64,
    /// numberReady is the number of nodes that should be running the daemon pod and have one or more of the daemon pod running with a Ready Condition.
    numberReady: i64,
    /// numberUnavailable is the number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds).
    numberUnavailable: ?i64 = null,
    /// observedGeneration is the most recent generation observed by the daemon set controller.
    observedGeneration: ?i64 = null,
    /// updatedNumberScheduled is the total number of nodes that are running updated daemon pod.
    updatedNumberScheduled: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// DaemonSetUpdateStrategy is a struct used to control the update strategy for a DaemonSet.
pub const DaemonSetUpdateStrategy = struct {
    /// rollingUpdate config params. Present only if type = "RollingUpdate".
    rollingUpdate: ?root.io.k8s.api.apps.v1.RollingUpdateDaemonSet = null,
    /// type of daemon set update. Can be "RollingUpdate" or "OnDelete". Default is RollingUpdate.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.rollingUpdate) |v| try v.validate();
    }
};

/// Deployment enables declarative updates for Pods and ReplicaSets.
pub const Deployment = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired behavior of the Deployment.
    spec: root.io.k8s.api.apps.v1.DeploymentSpec,
    /// status is the most recently observed status of the Deployment.
    status: ?root.io.k8s.api.apps.v1.DeploymentStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// DeploymentCondition describes the state of a deployment at a certain point.
pub const DeploymentCondition = struct {
    /// lastTransitionTime is the last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// lastUpdateTime is the last time this condition was updated.
    lastUpdateTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is a human readable string indicating details about the transition.
    message: ?[]const u8 = null,
    /// reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// status of the condition, one of True, False, Unknown.
    status: ?[]const u8 = null,
    /// type of deployment condition.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// DeploymentList is a list of Deployments.
pub const DeploymentList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is the list of Deployments.
    items: []const root.io.k8s.api.apps.v1.Deployment,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// DeploymentSpec is the specification of the desired behavior of the Deployment.
pub const DeploymentSpec = struct {
    /// minReadySeconds is the minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
    minReadySeconds: ?i64 = null,
    /// paused indicates that the deployment is paused.
    paused: ?bool = null,
    /// progressDeadlineSeconds is the maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.
    progressDeadlineSeconds: ?i64 = null,
    /// replicas is the desired number of pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
    replicas: ?i64 = null,
    /// revisionHistoryLimit is the maximum number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
    revisionHistoryLimit: ?i64 = null,
    /// selector is a label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment. It must match the pod template's labels.
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    /// strategy to use to replace existing Deployment pods with new ones.
    strategy: ?root.io.k8s.api.apps.v1.DeploymentStrategy = null,
    /// template describes the pods that will be created. The only allowed template.spec.restartPolicy value is "Always".
    template: root.io.k8s.api.core.v1.PodTemplateSpec,

    pub fn validate(self: @This()) !void {
        try self.selector.validate();
        if (self.strategy) |v| try v.validate();
        try self.template.validate();
    }
};

/// DeploymentStatus is the most recently observed status of the Deployment.
pub const DeploymentStatus = struct {
    /// availableReplicas is the total number of available non-terminating pods (ready for at least minReadySeconds) targeted by this deployment.
    availableReplicas: ?i64 = null,
    /// collisionCount is the number of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.
    collisionCount: ?i64 = null,
    /// conditions lists the latest available observations of a deployment's current state.
    conditions: ?[]const root.io.k8s.api.apps.v1.DeploymentCondition = null,
    /// observedGeneration is the generation observed by the deployment controller.
    observedGeneration: ?i64 = null,
    /// readyReplicas is the total number of non-terminating pods targeted by this Deployment with a Ready Condition.
    readyReplicas: ?i64 = null,
    /// replicas is the total number of non-terminating pods targeted by this deployment (their labels match the selector).
    replicas: ?i64 = null,
    /// terminatingReplicas is the number of terminating pods targeted by this deployment. Terminating pods have a non-null .metadata.deletionTimestamp and have not yet reached the Failed or Succeeded .status.phase.
    ///
    /// This is a beta field and requires enabling DeploymentReplicaSetTerminatingReplicas feature (enabled by default).
    terminatingReplicas: ?i64 = null,
    /// unavailableReplicas is the total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.
    unavailableReplicas: ?i64 = null,
    /// updatedReplicas is total number of non-terminating pods targeted by this deployment that have the desired template spec.
    updatedReplicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// DeploymentStrategy describes how to replace existing pods with new ones.
pub const DeploymentStrategy = struct {
    /// rollingUpdate config params. Present only if type = RollingUpdate.
    rollingUpdate: ?root.io.k8s.api.apps.v1.RollingUpdateDeployment = null,
    /// type of deployment. Can be "Recreate" or "RollingUpdate". Default is RollingUpdate.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.rollingUpdate) |v| try v.validate();
    }
};

/// ReplicaSet ensures that a specified number of pod replicas are running at any given time.
pub const ReplicaSet = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. If the Labels of a ReplicaSet are empty, they are defaulted to be the same as the Pod(s) that the ReplicaSet manages. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the specification of the desired behavior of the ReplicaSet. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: root.io.k8s.api.apps.v1.ReplicaSetSpec,
    /// status is the most recently observed status of the ReplicaSet. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.apps.v1.ReplicaSetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// ReplicaSetCondition describes the state of a replica set at a certain point.
pub const ReplicaSetCondition = struct {
    /// lastTransitionTime is the last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is a human readable string indicating details about the transition.
    message: ?[]const u8 = null,
    /// reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// status of the condition, one of True, False, Unknown.
    status: ?[]const u8 = null,
    /// type of replica set condition.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ReplicaSetList is a collection of ReplicaSets.
pub const ReplicaSetList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of ReplicaSets. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset
    items: []const root.io.k8s.api.apps.v1.ReplicaSet,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ReplicaSetSpec is the specification of a ReplicaSet.
pub const ReplicaSetSpec = struct {
    /// minReadySeconds is the minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    minReadySeconds: ?i64 = null,
    /// replicas is the number of desired pods. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset
    replicas: ?i64 = null,
    /// selector is a label query over pods that should match the replica count. Label keys and values that must match in order to be controlled by this replica set. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    /// template is the object that describes the pod that will be created if insufficient replicas are detected. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#pod-template
    template: ?root.io.k8s.api.core.v1.PodTemplateSpec = null,

    pub fn validate(self: @This()) !void {
        try self.selector.validate();
        if (self.template) |v| try v.validate();
    }
};

/// ReplicaSetStatus represents the current status of a ReplicaSet.
pub const ReplicaSetStatus = struct {
    /// availableReplicas is the number of available non-terminating pods (ready for at least minReadySeconds) for this ReplicaSet.
    availableReplicas: ?i64 = null,
    /// conditions lists the latest available observations of a ReplicaSet's current state.
    conditions: ?[]const root.io.k8s.api.apps.v1.ReplicaSetCondition = null,
    /// fullyLabeledReplicas is the number of non-terminating pods that have labels matching the labels of the pod template of the ReplicaSet.
    fullyLabeledReplicas: ?i64 = null,
    /// observedGeneration reflects the generation of the most recently observed ReplicaSet.
    observedGeneration: ?i64 = null,
    /// readyReplicas is the number of non-terminating pods targeted by this ReplicaSet with a Ready Condition.
    readyReplicas: ?i64 = null,
    /// replicas is the most recently observed number of non-terminating pods. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset
    replicas: i64,
    /// terminatingReplicas is the number of terminating pods for this ReplicaSet. Terminating pods have a non-null .metadata.deletionTimestamp and have not yet reached the Failed or Succeeded .status.phase.
    ///
    /// This is a beta field and requires enabling DeploymentReplicaSetTerminatingReplicas feature (enabled by default).
    terminatingReplicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// Spec to control the desired behavior of daemon set rolling update.
pub const RollingUpdateDaemonSet = struct {
    /// maxSurge is the maximum number of nodes with an existing available DaemonSet pod that can have an updated DaemonSet pod during an update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up to a minimum of 1. Default value is 0. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their a new pod created before the old pod is marked as deleted. The update starts by launching new pods on 30% of nodes. Once an updated pod is available (Ready for at least minReadySeconds) the old DaemonSet pod on that node is marked deleted. If the old pod becomes unavailable for any reason (Ready transitions to false, is evicted, or is drained) an updated pod is immediately created on that node without considering surge limits. Allowing surge implies the possibility that the resources consumed by the daemonset on any given node can double if the readiness check fails, and so resource intensive daemonsets should take into account that they may cause evictions during disruption.
    maxSurge: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    /// maxUnavailable is the maximum number of DaemonSet pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of total number of DaemonSet pods at the start of the update (ex: 10%). Absolute number is calculated from percentage by rounding up. This cannot be 0 if MaxSurge is 0 Default value is 1. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their pods stopped for an update at any given time. The update starts by stopping at most 30% of those DaemonSet pods and then brings up new DaemonSet pods in their place. Once the new pods are available, it then proceeds onto other DaemonSet pods, thus ensuring that at least 70% of original number of DaemonSet pods are available at all times during the update.
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Spec to control the desired behavior of rolling update.
pub const RollingUpdateDeployment = struct {
    /// maxSurge is the maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up. Defaults to 25%. Example: when this is set to 30%, the new ReplicaSet can be scaled up immediately when the rolling update starts, such that the total number of old and new pods do not exceed 130% of desired pods. Once old pods have been killed, new ReplicaSet can be scaled up further, ensuring that total number of pods running at any time during the update is at most 130% of desired pods.
    maxSurge: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    /// maxUnavailable is the maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding down. This can not be 0 if MaxSurge is 0. Defaults to 25%. Example: when this is set to 30%, the old ReplicaSet can be scaled down to 70% of desired pods immediately when the rolling update starts. Once new pods are ready, old ReplicaSet can be scaled down further, followed by scaling up the new ReplicaSet, ensuring that the total number of pods available at all times during the update is at least 70% of desired pods.
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// RollingUpdateStatefulSetStrategy is used to communicate parameter for RollingUpdateStatefulSetStrategyType.
pub const RollingUpdateStatefulSetStrategy = struct {
    /// maxUnavailable is the maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding up. This can not be 0. Defaults to 1. This field is beta-level and is enabled by default. The field applies to all pods in the range 0 to Replicas-1. That means if there is any unavailable pod in the range 0 to Replicas-1, it will be counted towards MaxUnavailable. This setting might not be effective for the OrderedReady podManagementPolicy. That policy ensures pods are created and become ready one at a time.
    maxUnavailable: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    /// partition indicates the ordinal at which the StatefulSet should be partitioned for updates. During a rolling update, all pods from ordinal Replicas-1 to Partition are updated. All pods from ordinal Partition-1 to 0 remain untouched. This is helpful in being able to do a canary based deployment. The default value is 0.
    partition: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// StatefulSet represents a set of pods with consistent identities. Identities are defined as:
///   - Network: A single stable DNS and hostname.
///   - Storage: As many VolumeClaims as requested.
///
/// The StatefulSet guarantees that a given network identity will always map to the same storage identity.
pub const StatefulSet = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired identities of pods in this set.
    spec: root.io.k8s.api.apps.v1.StatefulSetSpec,
    /// status is the current status of Pods in this StatefulSet. This data may be out of date by some window of time.
    status: ?root.io.k8s.api.apps.v1.StatefulSetStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// StatefulSetCondition describes the state of a statefulset at a certain point.
pub const StatefulSetCondition = struct {
    /// lastTransitionTime is the last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is a human readable string indicating details about the transition.
    message: ?[]const u8 = null,
    /// reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// status of the condition, one of True, False, Unknown.
    status: ?[]const u8 = null,
    /// type of statefulset condition.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// StatefulSetList is a collection of StatefulSets.
pub const StatefulSetList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of stateful sets.
    items: []const root.io.k8s.api.apps.v1.StatefulSet,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// StatefulSetOrdinals describes the policy used for replica ordinal assignment in this StatefulSet.
pub const StatefulSetOrdinals = struct {
    /// start is the number representing the first replica's index. It may be used to number replicas from an alternate index (eg: 1-indexed) over the default 0-indexed names, or to orchestrate progressive movement of replicas from one StatefulSet to another. If set, replica indices will be in the range:
    ///   [.spec.ordinals.start, .spec.ordinals.start + .spec.replicas).
    /// If unset, defaults to 0. Replica indices will be in the range:
    ///   [0, .spec.replicas).
    start: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// StatefulSetPersistentVolumeClaimRetentionPolicy describes the policy used for PVCs created from the StatefulSet VolumeClaimTemplates.
pub const StatefulSetPersistentVolumeClaimRetentionPolicy = struct {
    /// whenDeleted specifies what happens to PVCs created from StatefulSet VolumeClaimTemplates when the StatefulSet is deleted. The default policy of `Retain` causes PVCs to not be affected by StatefulSet deletion. The `Delete` policy causes those PVCs to be deleted.
    whenDeleted: ?[]const u8 = null,
    /// whenScaled specifies what happens to PVCs created from StatefulSet VolumeClaimTemplates when the StatefulSet is scaled down. The default policy of `Retain` causes PVCs to not be affected by a scaledown. The `Delete` policy causes the associated PVCs for any excess pods above the replica count to be deleted.
    whenScaled: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// A StatefulSetSpec is the specification of a StatefulSet.
pub const StatefulSetSpec = struct {
    /// minReadySeconds is the minimum number of seconds for which a newly created pod should be ready without any of its container crashing for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    minReadySeconds: ?i64 = null,
    /// ordinals controls the numbering of replica indices in a StatefulSet. The default ordinals behavior assigns a "0" index to the first replica and increments the index by one for each additional replica requested.
    ordinals: ?root.io.k8s.api.apps.v1.StatefulSetOrdinals = null,
    /// persistentVolumeClaimRetentionPolicy describes the lifecycle of persistent volume claims created from volumeClaimTemplates. By default, all persistent volume claims are created as needed and retained until manually deleted. This policy allows the lifecycle to be altered, for example by deleting persistent volume claims when their stateful set is deleted, or when their pod is scaled down.
    persistentVolumeClaimRetentionPolicy: ?root.io.k8s.api.apps.v1.StatefulSetPersistentVolumeClaimRetentionPolicy = null,
    /// podManagementPolicy controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down. The default policy is `OrderedReady`, where pods are created in increasing order (pod-0, then pod-1, etc) and the controller will wait until each pod is ready before continuing. When scaling down, the pods are removed in the opposite order. The alternative policy is `Parallel` which will create pods in parallel to match the desired scale without waiting, and on scale down will delete all pods at once.
    podManagementPolicy: ?[]const u8 = null,
    /// replicas is the desired number of replicas of the given Template. These are replicas in the sense that they are instantiations of the same Template, but individual replicas also have a consistent identity. If unspecified, defaults to 1.
    replicas: ?i64 = null,
    /// revisionHistoryLimit is the maximum number of revisions that will be maintained in the StatefulSet's revision history. The revision history consists of all revisions not represented by a currently applied StatefulSetSpec version. The default value is 10.
    revisionHistoryLimit: ?i64 = null,
    /// selector is a label query over pods that should match the replica count. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
    selector: root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector,
    /// serviceName is the name of the service that governs this StatefulSet. This service must exist before the StatefulSet, and is responsible for the network identity of the set. Pods get DNS/hostnames that follow the pattern: pod-specific-string.serviceName.default.svc.cluster.local where "pod-specific-string" is managed by the StatefulSet controller.
    serviceName: ?[]const u8 = null,
    /// template is the object that describes the pod that will be created if insufficient replicas are detected. Each pod stamped out by the StatefulSet will fulfill this Template, but have a unique identity from the rest of the StatefulSet. Each pod will be named with the format <statefulsetname>-<podindex>. For example, a pod in a StatefulSet named "web" with index number "3" would be named "web-3". The only allowed template.spec.restartPolicy value is "Always".
    template: root.io.k8s.api.core.v1.PodTemplateSpec,
    /// updateStrategy indicates the StatefulSetUpdateStrategy that will be employed to update Pods in the StatefulSet when a revision is made to Template.
    updateStrategy: ?root.io.k8s.api.apps.v1.StatefulSetUpdateStrategy = null,
    /// volumeClaimTemplates is a list of claims that pods are allowed to reference. The StatefulSet controller is responsible for mapping network identities to claims in a way that maintains the identity of a pod. Every claim in this list must have at least one matching (by name) volumeMount in one container in the template. A claim in this list takes precedence over any volumes in the template, with the same name.
    volumeClaimTemplates: ?[]const root.io.k8s.api.core.v1.PersistentVolumeClaim = null,

    pub fn validate(self: @This()) !void {
        if (self.ordinals) |v| try v.validate();
        if (self.persistentVolumeClaimRetentionPolicy) |v| try v.validate();
        try self.selector.validate();
        try self.template.validate();
        if (self.updateStrategy) |v| try v.validate();
        if (self.volumeClaimTemplates) |arr| for (arr) |item| try item.validate();
    }
};

/// StatefulSetStatus represents the current state of a StatefulSet.
pub const StatefulSetStatus = struct {
    /// availableReplicas is the number of available non-terminating pods (ready for at least minReadySeconds) targeted by this StatefulSet.
    availableReplicas: ?i64 = null,
    /// collisionCount is the count of hash collisions for the StatefulSet. The StatefulSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
    collisionCount: ?i64 = null,
    /// conditions lists the latest available observations of a StatefulSet's current state.
    conditions: ?[]const root.io.k8s.api.apps.v1.StatefulSetCondition = null,
    /// currentReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by currentRevision.
    currentReplicas: ?i64 = null,
    /// currentRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [0,currentReplicas).
    currentRevision: ?[]const u8 = null,
    /// observedGeneration is the most recent generation observed for this StatefulSet. It corresponds to the StatefulSet's generation, which is updated on mutation by the API Server.
    observedGeneration: ?i64 = null,
    /// readyReplicas is the number of pods created for this StatefulSet with a Ready Condition.
    readyReplicas: ?i64 = null,
    /// replicas is the number of Pods created by the StatefulSet controller.
    replicas: i64,
    /// updateRevision indicates the version of the StatefulSet used to generate Pods in the sequence [replicas-updatedReplicas,replicas)
    updateRevision: ?[]const u8 = null,
    /// updatedReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by updateRevision.
    updatedReplicas: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// StatefulSetUpdateStrategy indicates the strategy that the StatefulSet controller will use to perform updates. It includes any additional parameters necessary to perform the update for the indicated strategy.
pub const StatefulSetUpdateStrategy = struct {
    /// rollingUpdate is used to communicate parameters when Type is RollingUpdateStatefulSetStrategyType.
    rollingUpdate: ?root.io.k8s.api.apps.v1.RollingUpdateStatefulSetStrategy = null,
    /// type indicates the type of the StatefulSetUpdateStrategy. Default is RollingUpdate.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.rollingUpdate) |v| try v.validate();
    }
};
