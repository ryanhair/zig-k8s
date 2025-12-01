// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");

pub const HTTPIngressPath = struct {
    backend: root.io.k8s.api.networking.v1.IngressBackend,
    path: ?[]const u8 = null,
    pathType: []const u8,

    pub fn validate(self: @This()) !void {
        try self.backend.validate();
    }
};

pub const HTTPIngressRuleValue = struct {
    paths: []const root.io.k8s.api.networking.v1.HTTPIngressPath,

    pub fn validate(self: @This()) !void {
        for (self.paths) |item| try item.validate();
    }
};

pub const IPAddress = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1.IPAddressSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const IPAddressList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1.IPAddress,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const IPAddressSpec = struct {
    parentRef: root.io.k8s.api.networking.v1.ParentReference,

    pub fn validate(self: @This()) !void {
        try self.parentRef.validate();
    }
};

pub const IPBlock = struct {
    cidr: []const u8,
    except: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Ingress = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1.IngressSpec = null,
    status: ?root.io.k8s.api.networking.v1.IngressStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const IngressBackend = struct {
    resource: ?root.io.k8s.api.core.v1.TypedLocalObjectReference = null,
    service: ?root.io.k8s.api.networking.v1.IngressServiceBackend = null,

    pub fn validate(self: @This()) !void {
        if (self.resource) |v| try v.validate();
        if (self.service) |v| try v.validate();
    }
};

pub const IngressClass = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1.IngressClassSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const IngressClassList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1.IngressClass,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const IngressClassParametersReference = struct {
    apiGroup: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,
    namespace: ?[]const u8 = null,
    scope: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const IngressClassSpec = struct {
    controller: ?[]const u8 = null,
    parameters: ?root.io.k8s.api.networking.v1.IngressClassParametersReference = null,

    pub fn validate(self: @This()) !void {
        if (self.parameters) |v| try v.validate();
    }
};

pub const IngressList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1.Ingress,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const IngressLoadBalancerIngress = struct {
    hostname: ?[]const u8 = null,
    ip: ?[]const u8 = null,
    ports: ?[]const root.io.k8s.api.networking.v1.IngressPortStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

pub const IngressLoadBalancerStatus = struct {
    ingress: ?[]const root.io.k8s.api.networking.v1.IngressLoadBalancerIngress = null,

    pub fn validate(self: @This()) !void {
        if (self.ingress) |arr| for (arr) |item| try item.validate();
    }
};

pub const IngressPortStatus = struct {
    @"error": ?[]const u8 = null,
    port: i64,
    protocol: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const IngressRule = struct {
    host: ?[]const u8 = null,
    http: ?root.io.k8s.api.networking.v1.HTTPIngressRuleValue = null,

    pub fn validate(self: @This()) !void {
        if (self.http) |v| try v.validate();
    }
};

pub const IngressServiceBackend = struct {
    name: []const u8,
    port: ?root.io.k8s.api.networking.v1.ServiceBackendPort = null,

    pub fn validate(self: @This()) !void {
        if (self.port) |v| try v.validate();
    }
};

pub const IngressSpec = struct {
    defaultBackend: ?root.io.k8s.api.networking.v1.IngressBackend = null,
    ingressClassName: ?[]const u8 = null,
    rules: ?[]const root.io.k8s.api.networking.v1.IngressRule = null,
    tls: ?[]const root.io.k8s.api.networking.v1.IngressTLS = null,

    pub fn validate(self: @This()) !void {
        if (self.defaultBackend) |v| try v.validate();
        if (self.rules) |arr| for (arr) |item| try item.validate();
        if (self.tls) |arr| for (arr) |item| try item.validate();
    }
};

pub const IngressStatus = struct {
    loadBalancer: ?root.io.k8s.api.networking.v1.IngressLoadBalancerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.loadBalancer) |v| try v.validate();
    }
};

pub const IngressTLS = struct {
    hosts: ?[]const []const u8 = null,
    secretName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NetworkPolicy = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1.NetworkPolicySpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const NetworkPolicyEgressRule = struct {
    ports: ?[]const root.io.k8s.api.networking.v1.NetworkPolicyPort = null,
    to: ?[]const root.io.k8s.api.networking.v1.NetworkPolicyPeer = null,

    pub fn validate(self: @This()) !void {
        if (self.ports) |arr| for (arr) |item| try item.validate();
        if (self.to) |arr| for (arr) |item| try item.validate();
    }
};

pub const NetworkPolicyIngressRule = struct {
    from: ?[]const root.io.k8s.api.networking.v1.NetworkPolicyPeer = null,
    ports: ?[]const root.io.k8s.api.networking.v1.NetworkPolicyPort = null,

    pub fn validate(self: @This()) !void {
        if (self.from) |arr| for (arr) |item| try item.validate();
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

pub const NetworkPolicyList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1.NetworkPolicy,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const NetworkPolicyPeer = struct {
    ipBlock: ?root.io.k8s.api.networking.v1.IPBlock = null,
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    podSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.ipBlock) |v| try v.validate();
        if (self.namespaceSelector) |v| try v.validate();
        if (self.podSelector) |v| try v.validate();
    }
};

pub const NetworkPolicyPort = struct {
    endPort: ?i64 = null,
    port: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,
    protocol: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NetworkPolicySpec = struct {
    egress: ?[]const root.io.k8s.api.networking.v1.NetworkPolicyEgressRule = null,
    ingress: ?[]const root.io.k8s.api.networking.v1.NetworkPolicyIngressRule = null,
    podSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    policyTypes: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.egress) |arr| for (arr) |item| try item.validate();
        if (self.ingress) |arr| for (arr) |item| try item.validate();
        if (self.podSelector) |v| try v.validate();
    }
};

pub const ParentReference = struct {
    group: ?[]const u8 = null,
    name: []const u8,
    namespace: ?[]const u8 = null,
    resource: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceBackendPort = struct {
    name: ?[]const u8 = null,
    number: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceCIDR = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.networking.v1.ServiceCIDRSpec = null,
    status: ?root.io.k8s.api.networking.v1.ServiceCIDRStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ServiceCIDRList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.networking.v1.ServiceCIDR,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ServiceCIDRSpec = struct {
    cidrs: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceCIDRStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};
