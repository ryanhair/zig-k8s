// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

/// Lease defines a lease concept.
pub const Lease = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec contains the specification of the Lease. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.coordination.v1.LeaseSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

/// LeaseList is a list of Lease objects.
pub const LeaseList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is a list of schema objects.
    items: []const root.io.k8s.api.coordination.v1.Lease,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// LeaseSpec is a specification of a Lease.
pub const LeaseSpec = struct {
    /// acquireTime is a time when the current lease was acquired.
    acquireTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    /// holderIdentity contains the identity of the holder of a current lease. If Coordinated Leader Election is used, the holder identity must be equal to the elected LeaseCandidate.metadata.name field.
    holderIdentity: ?[]const u8 = null,
    /// leaseDurationSeconds is a duration that candidates for a lease need to wait to force acquire it. This is measured against the time of last observed renewTime.
    leaseDurationSeconds: ?i64 = null,
    /// leaseTransitions is the number of transitions of a lease between holders.
    leaseTransitions: ?i64 = null,
    /// PreferredHolder signals to a lease holder that the lease has a more optimal holder and should be given up. This field can only be set if Strategy is also set.
    preferredHolder: ?[]const u8 = null,
    /// renewTime is a time when the current holder of a lease has last updated the lease.
    renewTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    /// Strategy indicates the strategy for picking the leader for coordinated leader election. If the field is not specified, there is no active coordination for this lease. (Alpha) Using this field requires the CoordinatedLeaderElection feature gate to be enabled.
    strategy: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
