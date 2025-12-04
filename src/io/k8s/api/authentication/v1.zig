// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

/// BoundObjectReference is a reference to an object that a token is bound to.
pub const BoundObjectReference = struct {
    /// API version of the referent.
    apiVersion: ?[]const u8 = null,
    /// Kind of the referent. Valid kinds are 'Pod' and 'Secret'.
    kind: ?[]const u8 = null,
    /// Name of the referent.
    name: ?[]const u8 = null,
    /// UID of the referent.
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SelfSubjectReview contains the user information that the kube-apiserver has about the user making this request. When using impersonation, users will receive the user info of the user being impersonated.  If impersonation or request header authentication is used, any extra keys will have their case ignored and returned as lowercase.
pub const SelfSubjectReview = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Status is filled in by the server with the user attributes.
    status: ?root.io.k8s.api.authentication.v1.SelfSubjectReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// SelfSubjectReviewStatus is filled by the kube-apiserver and sent back to a user.
pub const SelfSubjectReviewStatus = struct {
    /// User attributes of the user making this request.
    userInfo: ?root.io.k8s.api.authentication.v1.UserInfo = null,

    pub fn validate(self: @This()) !void {
        if (self.userInfo) |v| try v.validate();
    }
};

/// TokenRequest requests a token for a given service account.
pub const TokenRequest = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec holds information about the request being evaluated
    spec: root.io.k8s.api.authentication.v1.TokenRequestSpec,
    /// Status is filled in by the server and indicates whether the token can be authenticated.
    status: ?root.io.k8s.api.authentication.v1.TokenRequestStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// TokenRequestSpec contains client provided parameters of a token request.
pub const TokenRequestSpec = struct {
    /// Audiences are the intendend audiences of the token. A recipient of a token must identify themself with an identifier in the list of audiences of the token, and otherwise should reject the token. A token issued for multiple audiences may be used to authenticate against any of the audiences listed but implies a high degree of trust between the target audiences.
    audiences: []const []const u8,
    /// BoundObjectRef is a reference to an object that the token will be bound to. The token will only be valid for as long as the bound object exists. NOTE: The API server's TokenReview endpoint will validate the BoundObjectRef, but other audiences may not. Keep ExpirationSeconds small if you want prompt revocation.
    boundObjectRef: ?root.io.k8s.api.authentication.v1.BoundObjectReference = null,
    /// ExpirationSeconds is the requested duration of validity of the request. The token issuer may return a token with a different validity duration so a client needs to check the 'expiration' field in a response.
    expirationSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.boundObjectRef) |v| try v.validate();
    }
};

/// TokenRequestStatus is the result of a token request.
pub const TokenRequestStatus = struct {
    /// ExpirationTimestamp is the time of expiration of the returned token.
    expirationTimestamp: root.io.k8s.apimachinery.pkg.apis.meta.v1.Time,
    /// Token is the opaque bearer token.
    token: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// TokenReview attempts to authenticate a token to a known user. Note: TokenReview requests may be cached by the webhook token authenticator plugin in the kube-apiserver.
pub const TokenReview = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec holds information about the request being evaluated
    spec: root.io.k8s.api.authentication.v1.TokenReviewSpec,
    /// Status is filled in by the server and indicates whether the request can be authenticated.
    status: ?root.io.k8s.api.authentication.v1.TokenReviewStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

/// TokenReviewSpec is a description of the token authentication request.
pub const TokenReviewSpec = struct {
    /// Audiences is a list of the identifiers that the resource server presented with the token identifies as. Audience-aware token authenticators will verify that the token was intended for at least one of the audiences in this list. If no audiences are provided, the audience will default to the audience of the Kubernetes apiserver.
    audiences: ?[]const []const u8 = null,
    /// Token is the opaque bearer token.
    token: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// TokenReviewStatus is the result of the token authentication request.
pub const TokenReviewStatus = struct {
    /// Audiences are audience identifiers chosen by the authenticator that are compatible with both the TokenReview and token. An identifier is any identifier in the intersection of the TokenReviewSpec audiences and the token's audiences. A client of the TokenReview API that sets the spec.audiences field should validate that a compatible audience identifier is returned in the status.audiences field to ensure that the TokenReview server is audience aware. If a TokenReview returns an empty status.audience field where status.authenticated is "true", the token is valid against the audience of the Kubernetes API server.
    audiences: ?[]const []const u8 = null,
    /// Authenticated indicates that the token was associated with a known user.
    authenticated: ?bool = null,
    /// Error indicates that the token couldn't be checked
    @"error": ?[]const u8 = null,
    /// User is the UserInfo associated with the provided token.
    user: ?root.io.k8s.api.authentication.v1.UserInfo = null,

    pub fn validate(self: @This()) !void {
        if (self.user) |v| try v.validate();
    }
};

/// UserInfo holds the information about the user needed to implement the user.Info interface.
pub const UserInfo = struct {
    /// Any additional information provided by the authenticator.
    extra: ?std.json.Value = null,
    /// The names of groups this user is a part of.
    groups: ?[]const []const u8 = null,
    /// A unique value that identifies this user across time. If this user is deleted and another user by the same name is added, they will have different UIDs.
    uid: ?[]const u8 = null,
    /// The name that uniquely identifies this user among all active users.
    username: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
