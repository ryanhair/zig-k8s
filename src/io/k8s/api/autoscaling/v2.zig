// Namespace: v2

const std = @import("std");
const root = @import("../../../../root.zig");

/// ContainerResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.  Only one "target" type should be set.
pub const ContainerResourceMetricSource = struct {
    /// container is the name of the container in the pods of the scaling target
    container: []const u8,
    /// name is the name of the resource in question.
    name: []const u8,
    /// target specifies the target value for the given metric
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.target.validate();
    }
};

/// ContainerResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing a single container in each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
pub const ContainerResourceMetricStatus = struct {
    /// container is the name of the container in the pods of the scaling target
    container: []const u8,
    /// current contains the current value for the given metric
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    /// name is the name of the resource in question.
    name: []const u8,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
    }
};

/// CrossVersionObjectReference contains enough information to let you identify the referred resource.
pub const CrossVersionObjectReference = struct {
    /// apiVersion is the API version of the referent
    apiVersion: ?[]const u8 = null,
    /// kind is the kind of the referent; More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: []const u8,
    /// name is the name of the referent; More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ExternalMetricSource indicates how to scale on a metric not associated with any Kubernetes object (for example length of queue in cloud messaging service, or QPS from loadbalancer running outside of cluster).
pub const ExternalMetricSource = struct {
    /// metric identifies the target metric by name and selector
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,
    /// target specifies the target value for the given metric
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.metric.validate();
        try self.target.validate();
    }
};

/// ExternalMetricStatus indicates the current value of a global metric not associated with any Kubernetes object.
pub const ExternalMetricStatus = struct {
    /// current contains the current value for the given metric
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    /// metric identifies the target metric by name and selector
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
        try self.metric.validate();
    }
};

/// HPAScalingPolicy is a single policy which must hold true for a specified past interval.
pub const HPAScalingPolicy = struct {
    /// periodSeconds specifies the window of time for which the policy should hold true. PeriodSeconds must be greater than zero and less than or equal to 1800 (30 min).
    periodSeconds: i64,
    /// type is used to specify the scaling policy.
    type: []const u8,
    /// value contains the amount of change which is permitted by the policy. It must be greater than zero
    value: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// HPAScalingRules configures the scaling behavior for one direction via scaling Policy Rules and a configurable metric tolerance.
///
/// Scaling Policy Rules are applied after calculating DesiredReplicas from metrics for the HPA. They can limit the scaling velocity by specifying scaling policies. They can prevent flapping by specifying the stabilization window, so that the number of replicas is not set instantly, instead, the safest value from the stabilization window is chosen.
///
/// The tolerance is applied to the metric values and prevents scaling too eagerly for small metric variations. (Note that setting a tolerance requires the beta HPAConfigurableTolerance feature gate to be enabled.)
pub const HPAScalingRules = struct {
    /// policies is a list of potential scaling polices which can be used during scaling. If not set, use the default values: - For scale up: allow doubling the number of pods, or an absolute change of 4 pods in a 15s window. - For scale down: allow all pods to be removed in a 15s window.
    policies: ?[]const root.io.k8s.api.autoscaling.v2.HPAScalingPolicy = null,
    /// selectPolicy is used to specify which policy should be used. If not set, the default value Max is used.
    selectPolicy: ?[]const u8 = null,
    /// stabilizationWindowSeconds is the number of seconds for which past recommendations should be considered while scaling up or scaling down. StabilizationWindowSeconds must be greater than or equal to zero and less than or equal to 3600 (one hour). If not set, use the default values: - For scale up: 0 (i.e. no stabilization is done). - For scale down: 300 (i.e. the stabilization window is 300 seconds long).
    stabilizationWindowSeconds: ?i64 = null,
    /// tolerance is the tolerance on the ratio between the current and desired metric value under which no updates are made to the desired number of replicas (e.g. 0.01 for 1%). Must be greater than or equal to zero. If not set, the default cluster-wide tolerance is applied (by default 10%).
    ///
    /// For example, if autoscaling is configured with a memory consumption target of 100Mi, and scale-down and scale-up tolerances of 5% and 1% respectively, scaling will be triggered when the actual consumption falls below 95Mi or exceeds 101Mi.
    ///
    /// This is an beta field and requires the HPAConfigurableTolerance feature gate to be enabled.
    tolerance: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        if (self.policies) |arr| for (arr) |item| try item.validate();
    }
};

/// HorizontalPodAutoscaler is the configuration for a horizontal pod autoscaler, which automatically manages the replica count of any resource implementing the scale subresource based on the metrics specified.
pub const HorizontalPodAutoscaler = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec is the specification for the behaviour of the autoscaler. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status.
    spec: ?root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerSpec = null,
    /// status is the current information about the autoscaler.
    status: ?root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// HorizontalPodAutoscalerBehavior configures the scaling behavior of the target in both Up and Down directions (scaleUp and scaleDown fields respectively).
pub const HorizontalPodAutoscalerBehavior = struct {
    /// scaleDown is scaling policy for scaling Down. If not set, the default value is to allow to scale down to minReplicas pods, with a 300 second stabilization window (i.e., the highest recommendation for the last 300sec is used).
    scaleDown: ?root.io.k8s.api.autoscaling.v2.HPAScalingRules = null,
    /// scaleUp is scaling policy for scaling Up. If not set, the default value is the higher of:
    ///   * increase no more than 4 pods per 60 seconds
    ///   * double the number of pods per 60 seconds
    /// No stabilization is used.
    scaleUp: ?root.io.k8s.api.autoscaling.v2.HPAScalingRules = null,

    pub fn validate(self: @This()) !void {
        if (self.scaleDown) |v| try v.validate();
        if (self.scaleUp) |v| try v.validate();
    }
};

/// HorizontalPodAutoscalerCondition describes the state of a HorizontalPodAutoscaler at a certain point.
pub const HorizontalPodAutoscalerCondition = struct {
    /// lastTransitionTime is the last time the condition transitioned from one status to another
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is a human-readable explanation containing details about the transition
    message: ?[]const u8 = null,
    /// reason is the reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// status is the status of the condition (True, False, Unknown)
    status: []const u8,
    /// type describes the current condition
    type: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// HorizontalPodAutoscalerList is a list of horizontal pod autoscaler objects.
pub const HorizontalPodAutoscalerList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is the list of horizontal pod autoscaler objects.
    items: []const root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscaler,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard list metadata.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// HorizontalPodAutoscalerSpec describes the desired functionality of the HorizontalPodAutoscaler.
pub const HorizontalPodAutoscalerSpec = struct {
    /// behavior configures the scaling behavior of the target in both Up and Down directions (scaleUp and scaleDown fields respectively). If not set, the default HPAScalingRules for scale up and scale down are used.
    behavior: ?root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerBehavior = null,
    /// maxReplicas is the upper limit for the number of replicas to which the autoscaler can scale up. It cannot be less that minReplicas.
    maxReplicas: i64,
    /// metrics contains the specifications for which to use to calculate the desired replica count (the maximum replica count across all metrics will be used).  The desired replica count is calculated multiplying the ratio between the target value and the current value by the current number of pods.  Ergo, metrics used must decrease as the pod count is increased, and vice-versa.  See the individual metric source types for more information about how each type of metric must respond. If not set, the default metric will be set to 80% average CPU utilization.
    metrics: ?[]const root.io.k8s.api.autoscaling.v2.MetricSpec = null,
    /// minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down.  It defaults to 1 pod.  minReplicas is allowed to be 0 if the alpha feature gate HPAScaleToZero is enabled and at least one Object or External metric is configured.  Scaling is active as long as at least one metric value is available.
    minReplicas: ?i64 = null,
    /// scaleTargetRef points to the target resource to scale, and is used to the pods for which metrics should be collected, as well as to actually change the replica count.
    scaleTargetRef: root.io.k8s.api.autoscaling.v2.CrossVersionObjectReference,

    pub fn validate(self: @This()) !void {
        if (self.behavior) |v| try v.validate();
        if (self.metrics) |arr| for (arr) |item| try item.validate();
        try self.scaleTargetRef.validate();
    }
};

/// HorizontalPodAutoscalerStatus describes the current status of a horizontal pod autoscaler.
pub const HorizontalPodAutoscalerStatus = struct {
    /// conditions is the set of conditions required for this autoscaler to scale its target, and indicates whether or not those conditions are met.
    conditions: ?[]const root.io.k8s.api.autoscaling.v2.HorizontalPodAutoscalerCondition = null,
    /// currentMetrics is the last read state of the metrics used by this autoscaler.
    currentMetrics: ?[]const root.io.k8s.api.autoscaling.v2.MetricStatus = null,
    /// currentReplicas is current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler.
    currentReplicas: ?i64 = null,
    /// desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler.
    desiredReplicas: i64,
    /// lastScaleTime is the last time the HorizontalPodAutoscaler scaled the number of pods, used by the autoscaler to control how often the number of pods is changed.
    lastScaleTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// observedGeneration is the most recent generation observed by this autoscaler.
    observedGeneration: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.currentMetrics) |arr| for (arr) |item| try item.validate();
    }
};

/// MetricIdentifier defines the name and optionally selector for a metric
pub const MetricIdentifier = struct {
    /// name is the name of the given metric
    name: []const u8,
    /// selector is the string-encoded form of a standard kubernetes label selector for the given metric When set, it is passed as an additional parameter to the metrics server for more specific metrics scoping. When unset, just the metricName will be used to gather metrics.
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.selector) |v| try v.validate();
    }
};

/// MetricSpec specifies how to scale based on a single metric (only `type` and one other matching field should be set at once).
pub const MetricSpec = struct {
    /// containerResource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing a single container in each pod of the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
    containerResource: ?root.io.k8s.api.autoscaling.v2.ContainerResourceMetricSource = null,
    /// external refers to a global metric that is not associated with any Kubernetes object. It allows autoscaling based on information coming from components running outside of cluster (for example length of queue in cloud messaging service, or QPS from loadbalancer running outside of cluster).
    external: ?root.io.k8s.api.autoscaling.v2.ExternalMetricSource = null,
    /// object refers to a metric describing a single kubernetes object (for example, hits-per-second on an Ingress object).
    object: ?root.io.k8s.api.autoscaling.v2.ObjectMetricSource = null,
    /// pods refers to a metric describing each pod in the current scale target (for example, transactions-processed-per-second).  The values will be averaged together before being compared to the target value.
    pods: ?root.io.k8s.api.autoscaling.v2.PodsMetricSource = null,
    /// resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
    resource: ?root.io.k8s.api.autoscaling.v2.ResourceMetricSource = null,
    /// type is the type of metric source.  It should be one of "ContainerResource", "External", "Object", "Pods" or "Resource", each mapping to a matching field in the object.
    type: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.containerResource) |v| try v.validate();
        if (self.external) |v| try v.validate();
        if (self.object) |v| try v.validate();
        if (self.pods) |v| try v.validate();
        if (self.resource) |v| try v.validate();
    }
};

/// MetricStatus describes the last-read state of a single metric.
pub const MetricStatus = struct {
    /// container resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing a single container in each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
    containerResource: ?root.io.k8s.api.autoscaling.v2.ContainerResourceMetricStatus = null,
    /// external refers to a global metric that is not associated with any Kubernetes object. It allows autoscaling based on information coming from components running outside of cluster (for example length of queue in cloud messaging service, or QPS from loadbalancer running outside of cluster).
    external: ?root.io.k8s.api.autoscaling.v2.ExternalMetricStatus = null,
    /// object refers to a metric describing a single kubernetes object (for example, hits-per-second on an Ingress object).
    object: ?root.io.k8s.api.autoscaling.v2.ObjectMetricStatus = null,
    /// pods refers to a metric describing each pod in the current scale target (for example, transactions-processed-per-second).  The values will be averaged together before being compared to the target value.
    pods: ?root.io.k8s.api.autoscaling.v2.PodsMetricStatus = null,
    /// resource refers to a resource metric (such as those specified in requests and limits) known to Kubernetes describing each pod in the current scale target (e.g. CPU or memory). Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
    resource: ?root.io.k8s.api.autoscaling.v2.ResourceMetricStatus = null,
    /// type is the type of metric source.  It will be one of "ContainerResource", "External", "Object", "Pods" or "Resource", each corresponds to a matching field in the object.
    type: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.containerResource) |v| try v.validate();
        if (self.external) |v| try v.validate();
        if (self.object) |v| try v.validate();
        if (self.pods) |v| try v.validate();
        if (self.resource) |v| try v.validate();
    }
};

/// MetricTarget defines the target value, average value, or average utilization of a specific metric
pub const MetricTarget = struct {
    /// averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods. Currently only valid for Resource metric source type
    averageUtilization: ?i64 = null,
    /// averageValue is the target value of the average of the metric across all relevant pods (as a quantity)
    averageValue: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    /// type represents whether the metric type is Utilization, Value, or AverageValue
    type: []const u8,
    /// value is the target value of the metric (as a quantity).
    value: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// MetricValueStatus holds the current value for a metric
pub const MetricValueStatus = struct {
    /// currentAverageUtilization is the current value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.
    averageUtilization: ?i64 = null,
    /// averageValue is the current value of the average of the metric across all relevant pods (as a quantity)
    averageValue: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    /// value is the current value of the metric (as a quantity).
    value: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
pub const ObjectMetricSource = struct {
    /// describedObject specifies the descriptions of a object,such as kind,name apiVersion
    describedObject: root.io.k8s.api.autoscaling.v2.CrossVersionObjectReference,
    /// metric identifies the target metric by name and selector
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,
    /// target specifies the target value for the given metric
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.describedObject.validate();
        try self.metric.validate();
        try self.target.validate();
    }
};

/// ObjectMetricStatus indicates the current value of a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
pub const ObjectMetricStatus = struct {
    /// current contains the current value for the given metric
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    /// DescribedObject specifies the descriptions of a object,such as kind,name apiVersion
    describedObject: root.io.k8s.api.autoscaling.v2.CrossVersionObjectReference,
    /// metric identifies the target metric by name and selector
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
        try self.describedObject.validate();
        try self.metric.validate();
    }
};

/// PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second). The values will be averaged together before being compared to the target value.
pub const PodsMetricSource = struct {
    /// metric identifies the target metric by name and selector
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,
    /// target specifies the target value for the given metric
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.metric.validate();
        try self.target.validate();
    }
};

/// PodsMetricStatus indicates the current value of a metric describing each pod in the current scale target (for example, transactions-processed-per-second).
pub const PodsMetricStatus = struct {
    /// current contains the current value for the given metric
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    /// metric identifies the target metric by name and selector
    metric: root.io.k8s.api.autoscaling.v2.MetricIdentifier,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
        try self.metric.validate();
    }
};

/// ResourceMetricSource indicates how to scale on a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  The values will be averaged together before being compared to the target.  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.  Only one "target" type should be set.
pub const ResourceMetricSource = struct {
    /// name is the name of the resource in question.
    name: []const u8,
    /// target specifies the target value for the given metric
    target: root.io.k8s.api.autoscaling.v2.MetricTarget,

    pub fn validate(self: @This()) !void {
        try self.target.validate();
    }
};

/// ResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the "pods" source.
pub const ResourceMetricStatus = struct {
    /// current contains the current value for the given metric
    current: root.io.k8s.api.autoscaling.v2.MetricValueStatus,
    /// name is the name of the resource in question.
    name: []const u8,

    pub fn validate(self: @This()) !void {
        try self.current.validate();
    }
};
