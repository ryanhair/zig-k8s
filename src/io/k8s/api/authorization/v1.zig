// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

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
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec holds information about the request being evaluated.  spec.namespace must be equal to the namespace you made the request against.  If empty, it is defaulted.
    spec: root.io.k8s.api.authorization.v1.SubjectAccessReviewSpec,
    /// Status is filled in by the server and indicates whether the request is allowed or not
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface
pub const NonResourceAttributes = struct {
    /// Path is the URL path of the request
    path: ?[]const u8 = null,
    /// Verb is the standard HTTP verb
    verb: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NonResourceRule holds information that describes a rule for the non-resource
pub const NonResourceRule = struct {
    /// NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  "*" means all.
    nonResourceURLs: ?[]const []const u8 = null,
    /// Verb is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  "*" means all.
    verbs: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface
pub const ResourceAttributes = struct {
    /// fieldSelector describes the limitation on access based on field.  It can only limit access, not broaden it.
    fieldSelector: ?root.io.k8s.api.authorization.v1.FieldSelectorAttributes = null,
    /// Group is the API Group of the Resource.  "*" means all.
    group: ?[]const u8 = null,
    /// labelSelector describes the limitation on access based on labels.  It can only limit access, not broaden it.
    labelSelector: ?root.io.k8s.api.authorization.v1.LabelSelectorAttributes = null,
    /// Name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.
    name: ?[]const u8 = null,
    /// Namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview
    namespace: ?[]const u8 = null,
    /// Resource is one of the existing resource types.  "*" means all.
    resource: ?[]const u8 = null,
    /// Subresource is one of the existing resource types.  "" means none.
    subresource: ?[]const u8 = null,
    /// Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.
    verb: ?[]const u8 = null,
    /// Version is the API Version of the Resource.  "*" means all.
    version: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.fieldSelector) |v| try v.validate();
        if (self.labelSelector) |v| try v.validate();
    }
};

/// ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
pub const ResourceRule = struct {
    /// APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  "*" means all.
    apiGroups: ?[]const []const u8 = null,
    /// ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  "*" means all.
    resourceNames: ?[]const []const u8 = null,
    /// Resources is a list of resources this rule applies to.  "*" means all in the specified apiGroups.
    ///  "*/foo" represents the subresource 'foo' for all resources in the specified apiGroups.
    resources: ?[]const []const u8 = null,
    /// Verb is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  "*" means all.
    verbs: []const []const u8,

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
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec holds information about the request being evaluated.  user and groups must be empty
    spec: root.io.k8s.api.authorization.v1.SelfSubjectAccessReviewSpec,
    /// Status is filled in by the server and indicates whether the request is allowed or not
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
pub const SelfSubjectAccessReviewSpec = struct {
    /// NonResourceAttributes describes information for a non-resource access request
    nonResourceAttributes: ?root.io.k8s.api.authorization.v1.NonResourceAttributes = null,
    /// ResourceAuthorizationAttributes describes information for a resource access request
    resourceAttributes: ?root.io.k8s.api.authorization.v1.ResourceAttributes = null,

    pub fn validate(self: @This()) !void {
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
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec holds information about the request being evaluated.
    spec: root.io.k8s.api.authorization.v1.SelfSubjectRulesReviewSpec,
    /// Status is filled in by the server and indicates the set of actions a user can perform.
    status: ?root.io.k8s.api.authorization.v1.SubjectRulesReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SelfSubjectRulesReviewSpec defines the specification for SelfSubjectRulesReview.
pub const SelfSubjectRulesReviewSpec = struct {
    /// Namespace to evaluate rules for. Required.
    namespace: ?[]const u8 = null,

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
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec holds information about the request being evaluated
    spec: root.io.k8s.api.authorization.v1.SubjectAccessReviewSpec,
    /// Status is filled in by the server and indicates whether the request is allowed or not
    status: ?root.io.k8s.api.authorization.v1.SubjectAccessReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set
pub const SubjectAccessReviewSpec = struct {
    /// Extra corresponds to the user.Info.GetExtra() method from the authenticator.  Since that is input to the authorizer it needs a reflection here.
    extra: ?std.json.Value = null,
    /// Groups is the groups you're testing for.
    groups: ?[]const []const u8 = null,
    /// NonResourceAttributes describes information for a non-resource access request
    nonResourceAttributes: ?root.io.k8s.api.authorization.v1.NonResourceAttributes = null,
    /// ResourceAuthorizationAttributes describes information for a resource access request
    resourceAttributes: ?root.io.k8s.api.authorization.v1.ResourceAttributes = null,
    /// UID information about the requesting user.
    uid: ?[]const u8 = null,
    /// User is the user you're testing for. If you specify "User" but not "Groups", then is it interpreted as "What if User were not a member of any groups
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.nonResourceAttributes) |v| try v.validate();
        if (self.resourceAttributes) |v| try v.validate();
    }
};

/// SubjectAccessReviewStatus
pub const SubjectAccessReviewStatus = struct {
    /// Allowed is required. True if the action would be allowed, false otherwise.
    allowed: bool,
    /// Denied is optional. True if the action would be denied, otherwise false. If both allowed is false and denied is false, then the authorizer has no opinion on whether to authorize the action. Denied may not be true if Allowed is true.
    denied: ?bool = null,
    /// EvaluationError is an indication that some error occurred during the authorization check. It is entirely possible to get an error and be able to continue determine authorization status in spite of it. For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request.
    evaluationError: ?[]const u8 = null,
    /// Reason is optional.  It indicates why a request was allowed or denied.
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it's safe to assume the subject has that permission, even if that list is incomplete.
pub const SubjectRulesReviewStatus = struct {
    /// EvaluationError can appear in combination with Rules. It indicates an error occurred during rule evaluation, such as an authorizer that doesn't support rule evaluation, and that ResourceRules and/or NonResourceRules may be incomplete.
    evaluationError: ?[]const u8 = null,
    /// Incomplete is true when the rules returned by this call are incomplete. This is most commonly encountered when an authorizer, such as an external authorizer, doesn't support rules evaluation.
    incomplete: bool,
    /// NonResourceRules is the list of actions the subject is allowed to perform on non-resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
    nonResourceRules: []const root.io.k8s.api.authorization.v1.NonResourceRule,
    /// ResourceRules is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.
    resourceRules: []const root.io.k8s.api.authorization.v1.ResourceRule,

    pub fn validate(self: @This()) !void {
        for (self.nonResourceRules) |item| try item.validate();
        for (self.resourceRules) |item| try item.validate();
    }
};
