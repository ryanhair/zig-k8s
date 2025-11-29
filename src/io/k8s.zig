// Namespace: k8s

const std = @import("std");
const root = @import("../root.zig");

pub const apimachinery = @import("k8s/apimachinery.zig");
pub const api = @import("k8s/api.zig");
pub const kubeAggregator = @import("k8s/kube-aggregator.zig");
pub const apiextensionsApiserver = @import("k8s/apiextensions-apiserver.zig");

