// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

/// AuthorizationOptions contains options for specifying the client's authorization abilities.
pub const AuthorizationOptions = struct {
    /// handledDecisionTypes specifies what decision types the client can handle in the context it is in. Currently valid values are: - [Allow, Deny, NoOpinion] (for conditions-unaware clients) or - [Allow, Deny, NoOpinion, ConditionsMap, Union, ...] (for conditions-aware clients) If the authorizer would like to return conditions, but the client does not opt in to handle those here,
    ///   the authorizer must fail closed to a safe unconditional decision
    ///   (Deny if any Deny conditions were present, otherwise NoOpinion).
    /// Order does not matter in this slice; set semantics should be used. The server does not reject unrecognized decision types, but focuses on whether the client supports a mode that the server does. All clients must support "classic", conditions-unaware authorization.
    handledDecisionTypes: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Condition represents a single authorization condition to be evaluated against data available later in the request chain, e.g. objects available in admission.
pub const Condition = struct {
    /// condition returns a string encoding of the condition to be evaluated. It is a pure, deterministic function from ConditionsData to a boolean (or error). Might or might not be human-readable. Optional, if the ID alone is enough for the authorizer to know how to evaluate the condition.
    condition: ?[]const u8 = null,
    /// description is an optional human-friendly description that can be shown as an error message or for debugging. Optional.
    description: ?[]const u8 = null,
    /// id uniquely identifies this condition within the scope of the authorizer that authored it and ConditionsMap it is part of. Validated as a Kubernetes label key. Any domain of form *.k8s.io or *.kubernetes.io is reserved for Kubernetes use.
    id: []const u8,
    /// type describes the type of the condition, if there are multiple possibilities. Should be formatted as a Kubernetes label key. Any domain of form *.k8s.io or *.kubernetes.io is reserved for Kubernetes use. authorizer.kubernetes.io/cel is a conditions type for CEL, handled by kube-apiserver. Optional. Can be omitted if the authorizer already knows how to evaluate the condition.
    type: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ConditionsAwareDecision represents one authorizer's decision. It is an enum type, with variants described in ConditionsAwareDecisionType, plus a reason and error.
pub const ConditionsAwareDecision = struct {
    /// allow represents an unconditional Allow decision. Must be non-null when type == "Allow", otherwise this field must be unset.
    allow: ?root.io.k8s.api.authorization.v1.UnconditionalDecision = null,
    /// conditionsMap represents a conditional decision, modelled as a map of conditions. Must be non-null when type == "ConditionsMap", otherwise this field must be unset.
    conditionsMap: ?root.io.k8s.api.authorization.v1.ConditionsMap = null,
    /// deny represents an unconditional Deny decision. Must be non-null when type == "Deny", otherwise this field must be unset.
    deny: ?root.io.k8s.api.authorization.v1.UnconditionalDecision = null,
    /// noOpinion represents an unconditional NoOpinion decision. Must be non-null when type == "NoOpinion", otherwise this field must be unset.
    noOpinion: ?root.io.k8s.api.authorization.v1.UnconditionalDecision = null,
    /// type describes the type of the decision, and acts as an enum discriminator.
    type: []const u8,
    /// union forms an ordered tree of decisions, where the union decision is represented by an internal node, and all other decision types are leaf nodes. During evaluation, the leaf decisions are evaluated in depth-first order, until an Allow or Deny decision is found. The order of the decisions should match the order of the authorizers in the union authorizer for interpretability, but the authorizerName is the map key. At least one of the leaves must be of type ConditionsMap, as otherwise the union could be trivially reduced to just a single Allow/Deny/NoOpinion.
    ///
    /// Must have at least one element when type == "Union", otherwise this field must be unset.
    @"union": ?[]const root.io.k8s.api.authorization.v1.NamedConditionsAwareDecision = null,

    pub fn validate(self: @This()) !void {
        if (self.allow) |v| try v.validate();
        if (self.conditionsMap) |v| try v.validate();
        if (self.deny) |v| try v.validate();
        if (self.noOpinion) |v| try v.validate();
        if (self.@"union") |arr| for (arr) |item| try item.validate();
    }
};

/// ConditionsMap represents a map of conditions, keyed by ID across all conditions, across all effects. The ConditionsMap must have at least one Allow condition or at least one Deny condition. It cannot contain more than 128 conditions in total. The conditions are evaluated against data available later, to determine whether the authorizer that authored the conditions allows or denies the request. If all conditions in the map evaluate to false, the final decision must be NoOpinion.
pub const ConditionsMap = struct {
    /// allowConditions contains the conditions with Allow effect. If any such condition evaluates to true, the ConditionsMap as a whole must evaluate to Allow.
    allowConditions: ?[]const root.io.k8s.api.authorization.v1.Condition = null,
    /// denyConditions contains the conditions with Deny effect. If any such condition evaluates to true or error, the ConditionsMap as a whole must evaluate to Deny.
    denyConditions: ?[]const root.io.k8s.api.authorization.v1.Condition = null,
    /// noOpinionConditions contains the conditions with NoOpinion effect. If any such condition evaluates to true or error, the ConditionsMap as a whole must evaluate to NoOpinion.
    noOpinionConditions: ?[]const root.io.k8s.api.authorization.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.allowConditions) |arr| for (arr) |item| try item.validate();
        if (self.denyConditions) |arr| for (arr) |item| try item.validate();
        if (self.noOpinionConditions) |arr| for (arr) |item| try item.validate();
    }
};

/// FieldSelectorAttributes indicates a field limited access. Webhook authors are encouraged to * ensure rawSelector and requirements are not both set * consider the requirements field if set * not try to parse or consider the rawSelector field if set. This is to avoid another CVE-2022-2880 (i.e. getting different systems to agree on how exactly to parse a query is not something we want), see https://www.oxeye.io/resources/golang-parameter-smuggling-attack for more details. For the *SubjectAccessReview endpoints of the kube-apiserver: * If rawSelector is empty and requirements are empty, the request is not limited. * If rawSelector is present and requirements are empty, the rawSelector will be parsed and limited if the parsing succeeds. * If rawSelector is empty and requirements are present, the requirements should be honored * If rawSelector is present and requirements are present, the request is invalid.
pub const FieldSelectorAttributes = struct {
    /// rawSelector is the serialization of a field selector that would be included in a query parameter. Webhook implementations are encouraged to ignore rawSelector. The kube-apiserver's *SubjectAccessReview will parse the rawSelector as long as the requirements are not present.
    rawSelector: ?[]const u8 = null,
    /// requirements is the parsed interpretation of a field selector. All requirements must be met for a resource instance to match the selector. Webhook implementations should handle requirements, but how to handle them is up to the webhook. Since requirements can only limit the request, it is safe to authorize as unlimited request if the requirements are not understood.
    requirements: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.FieldSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.requirements) |arr| for (arr) |item| try item.validate();
    }
};

/// LabelSelectorAttributes indicates a label limited access. Webhook authors are encouraged to * ensure rawSelector and requirements are not both set * consider the requirements field if set * not try to parse or consider the rawSelector field if set. This is to avoid another CVE-2022-2880 (i.e. getting different systems to agree on how exactly to parse a query is not something we want), see https://www.oxeye.io/resources/golang-parameter-smuggling-attack for more details. For the *SubjectAccessReview endpoints of the kube-apiserver: * If rawSelector is empty and requirements are empty, the request is not limited. * If rawSelector is present and requirements are empty, the rawSelector will be parsed and limited if the parsing succeeds. * If rawSelector is empty and requirements are present, the requirements should be honored * If rawSelector is present and requirements are present, the request is invalid.
pub const LabelSelectorAttributes = struct {
    /// rawSelector is the serialization of a field selector that would be included in a query parameter. Webhook implementations are encouraged to ignore rawSelector. The kube-apiserver's *SubjectAccessReview will parse the rawSelector as long as the requirements are not present.
    rawSelector: ?[]const u8 = null,
    /// requirements is the parsed interpretation of a label selector. All requirements must be met for a resource instance to match the selector. Webhook implementations should handle requirements, but how to handle them is up to the webhook. Since requirements can only limit the request, it is safe to authorize as unlimited request if the requirements are not understood.
    requirements: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.requirements) |arr| for (arr) |item| try item.validate();
    }
};

/// LocalSubjectAccessReview checks whether or not a user or group can perform an action in a given namespace. Having a namespace scoped resource makes it much easier to grant namespace scoped policy that includes permissions checking.
pub const LocalSubjectAccessReview = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec holds information about the request being evaluated.  spec.namespace must be equal to the namespace you made the request against.  If empty, it is defaulted.
    spec: root.io.k8s.api.authorization.v1.SubjectAccessReviewSpec,
    /// status is filled in by the server and indicates whether the request is allowed or not
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// NamedConditionsAwareDecision is a named ConditionsAwareDecision, returned by a unioned authorizer.
pub const NamedConditionsAwareDecision = struct {
    /// authorizerName details the name of the authorizer that authored the condition, such that the right Decision can be paired with the right authorizer when evaluating the conditions, even across API server replicas. The name must be stable over time. This name must be unique within a given union authorizer, not necessarily globally.
    authorizerName: []const u8,
    /// decision carries the inner decision returned from the authorizer.
    decision: root.io.k8s.api.authorization.v1.ConditionsAwareDecision,

    pub fn validate(self: @This()) !void {
        try self.decision.validate();
    }
};

/// NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface
pub const NonResourceAttributes = struct {
    /// path is the URL path of the request
    path: ?[]const u8 = null,
    /// verb is the standard HTTP verb
    verb: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NonResourceRule holds information that describes a rule for the non-resource
pub const NonResourceRule = struct {
    /// nonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  "*" means all.
    nonResourceURLs: ?[]const []const u8 = null,
    /// verbs is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  "*" means all.
    verbs: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface
pub const ResourceAttributes = struct {
    /// fieldSelector describes the limitation on access based on field.  It can only limit access, not broaden it.
    fieldSelector: ?root.io.k8s.api.authorization.v1.FieldSelectorAttributes = null,
    /// group is the API Group of the Resource.  "*" means all.
    group: ?[]const u8 = null,
    /// labelSelector describes the limitation on access based on labels.  It can only limit access, not broaden it.
    labelSelector: ?root.io.k8s.api.authorization.v1.LabelSelectorAttributes = null,
    /// name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.
    name: ?[]const u8 = null,
    /// namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview
    namespace: ?[]const u8 = null,
    /// resource is one of the existing resource types.  "*" means all.
    resource: ?[]const u8 = null,
    /// subresource is one of the existing resource types.  "" means none.
    subresource: ?[]const u8 = null,
    /// verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.
    verb: ?[]const u8 = null,
    /// version is the API Version of the Resource.  "*" means all.
    version: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.fieldSelector) |v| try v.validate();
        if (self.labelSelector) |v| try v.validate();
    }
};

/// ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
pub const ResourceRule = struct {
    /// apiGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  "*" means all.
    apiGroups: ?[]const []const u8 = null,
    /// resourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  "*" means all.
    resourceNames: ?[]const []const u8 = null,
    /// resources is a list of resources this rule applies to.  "*" means all in the specified apiGroups.
    ///  "*/foo" represents the subresource 'foo' for all resources in the specified apiGroups.
    resources: ?[]const []const u8 = null,
    /// verbs is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  "*" means all.
    verbs: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SelfSubjectAccessReview checks whether or the current user can perform an action.  Not filling in a spec.namespace means "in all namespaces".  Self is a special case, because users should always be able to check whether they can perform an action
pub const SelfSubjectAccessReview = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec holds information about the request being evaluated.  user and groups must be empty
    spec: root.io.k8s.api.authorization.v1.SelfSubjectAccessReviewSpec,
    /// status is filled in by the server and indicates whether the request is allowed or not
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of resourceAttributes and nonResourceAttributes must be set
pub const SelfSubjectAccessReviewSpec = struct {
    /// authorizationOptions contains options for specifying the client's authorization abilities. If unset, only unconditional authorization is supported, for backwards-compatibility. Requires the ConditionalAuthorization feature to be enabled.
    authorizationOptions: ?root.io.k8s.api.authorization.v1.AuthorizationOptions = null,
    /// nonResourceAttributes describes information for a non-resource access request
    nonResourceAttributes: ?root.io.k8s.api.authorization.v1.NonResourceAttributes = null,
    /// resourceAttributes describes information for a resource access request
    resourceAttributes: ?root.io.k8s.api.authorization.v1.ResourceAttributes = null,

    pub fn validate(self: @This()) !void {
        if (self.authorizationOptions) |v| try v.validate();
        if (self.nonResourceAttributes) |v| try v.validate();
        if (self.resourceAttributes) |v| try v.validate();
    }
};

/// SelfSubjectRulesReview enumerates the set of actions the current user can perform within a namespace. The returned list of actions may be incomplete depending on the server's authorization mode, and any errors experienced during the evaluation. SelfSubjectRulesReview should be used by UIs to show/hide actions, or to quickly let an end user reason about their permissions. It should NOT Be used by external systems to drive authorization decisions as this raises confused deputy, cache lifetime/revocation, and correctness concerns. SubjectAccessReview, and LocalAccessReview are the correct way to defer authorization decisions to the API server.
pub const SelfSubjectRulesReview = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec holds information about the request being evaluated.
    spec: root.io.k8s.api.authorization.v1.SelfSubjectRulesReviewSpec,
    /// status is filled in by the server and indicates the set of actions a user can perform.
    status: ?root.io.k8s.api.authorization.v1.SubjectRulesReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SelfSubjectRulesReviewSpec defines the specification for SelfSubjectRulesReview.
pub const SelfSubjectRulesReviewSpec = struct {
    /// namespace to evaluate rules for. Required.
    namespace: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SubjectAccessReview checks whether or not a user or group can perform an action.
pub const SubjectAccessReview = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// metadata is the standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec holds information about the request being evaluated
    spec: root.io.k8s.api.authorization.v1.SubjectAccessReviewSpec,
    /// status is filled in by the server and indicates whether the request is allowed or not
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SubjectAccessReviewSpec is a description of the access request.  Exactly one of resourceAttributes and nonResourceAttributes must be set
pub const SubjectAccessReviewSpec = struct {
    /// authorizationOptions contains options for specifying the client's authorization abilities. If unset, only unconditional authorization is supported, for backwards-compatibility. Requires the ConditionalAuthorization feature to be enabled.
    authorizationOptions: ?root.io.k8s.api.authorization.v1.AuthorizationOptions = null,
    /// extra corresponds to the user.Info.GetExtra() method from the authenticator.  Since that is input to the authorizer it needs a reflection here.
    extra: ?std.json.Value = null,
    /// groups is the groups you're testing for.
    groups: ?[]const []const u8 = null,
    /// nonResourceAttributes describes information for a non-resource access request
    nonResourceAttributes: ?root.io.k8s.api.authorization.v1.NonResourceAttributes = null,
    /// resourceAttributes describes information for a resource access request
    resourceAttributes: ?root.io.k8s.api.authorization.v1.ResourceAttributes = null,
    /// uid information about the requesting user.
    uid: ?[]const u8 = null,
    /// user is the user you're testing for. If you specify "User" but not "Groups", then is it interpreted as "What if User were not a member of any groups
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.authorizationOptions) |v| try v.validate();
        if (self.nonResourceAttributes) |v| try v.validate();
        if (self.resourceAttributes) |v| try v.validate();
    }
};

/// SubjectAccessReviewStatus
pub const SubjectAccessReviewStatus = struct {
    /// allowed is true if the action would be allowed, false otherwise. allowed=true is mutually exclusive with denied=true and conditionalDecision != nil.
    allowed: ?bool = null,
    /// conditionalDecision represents a conditional decision returned by the authorizer. When conditionalDecision is set, allowed, denied, reason and evaluationError must have their zero values. The top-level decision type should be ConditionsAwareDecisionTypeConditionsMap or ConditionsAwareDecisionTypeUnion, as Allow/Deny/NoOpinion decisions can be represented with SubjectAccessReviewStatus.Allowed and SubjectAccessReviewStatus.Denied alone. May only be set if spec.authorizationOptions.handledDecisionTypes includes `ConditionsMap` and `Union`. Requires the ConditionalAuthorization feature to be enabled.
    conditionalDecision: ?root.io.k8s.api.authorization.v1.ConditionsAwareDecision = null,
    /// denied is optional. True if the action would be denied, otherwise false If allowed is false, denied is false, and conditionalDecision is unset, then the authorizer has no opinion on whether to authorize the action. denied=true is mutually exclusive with allowed=true and conditionalDecision != nil.
    denied: ?bool = null,
    /// evaluationError is an indication that some error occurred during the authorization check. It is entirely possible to get an error and be able to continue determine authorization status in spite of it. For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request.
    evaluationError: ?[]const u8 = null,
    /// reason is optional.  It indicates why a request was allowed or denied.
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditionalDecision) |v| try v.validate();
    }
};

/// SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it's safe to assume the subject has that permission, even if that list is incomplete.
pub const SubjectRulesReviewStatus = struct {
    /// evaluationError can appear in combination with Rules. It indicates an error occurred during rule evaluation, such as an authorizer that doesn't support rule evaluation, and that ResourceRules and/or NonResourceRules may be incomplete.
    evaluationError: ?[]const u8 = null,
    /// incomplete is true when the rules returned by this call are incomplete. This is most commonly encountered when an authorizer, such as an external authorizer, doesn't support rules evaluation.
    incomplete: ?bool = null,
    /// nonResourceRules is the list of actions the subject is allowed to perform on non-resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
    nonResourceRules: ?[]const root.io.k8s.api.authorization.v1.NonResourceRule = null,
    /// resourceRules is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
    resourceRules: ?[]const root.io.k8s.api.authorization.v1.ResourceRule = null,

    pub fn validate(self: @This()) !void {
        if (self.nonResourceRules) |arr| for (arr) |item| try item.validate();
        if (self.resourceRules) |arr| for (arr) |item| try item.validate();
    }
};

/// UnconditionalDecision represents the data associated with an unconditional decision.
pub const UnconditionalDecision = struct {
    /// evaluationError is an indication that some error occurred during the authorization check. It is entirely possible to get an error and be able to continue determine authorization status in spite of it. For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request.
    evaluationError: ?[]const u8 = null,
    /// reason is optional. It indicates why a request was allowed or denied.
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
