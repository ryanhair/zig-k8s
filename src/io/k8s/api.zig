// Namespace: api

const std = @import("std");
const root = @import("../../root.zig");

pub const node = @import("api/node.zig");
pub const admissionregistration = @import("api/admissionregistration.zig");
pub const apiserverinternal = @import("api/apiserverinternal.zig");
pub const coordination = @import("api/coordination.zig");
pub const core = @import("api/core.zig");
pub const apps = @import("api/apps.zig");
pub const discovery = @import("api/discovery.zig");
pub const policy = @import("api/policy.zig");
pub const events = @import("api/events.zig");
pub const resource = @import("api/resource.zig");
pub const autoscaling = @import("api/autoscaling.zig");
pub const flowcontrol = @import("api/flowcontrol.zig");
pub const scheduling = @import("api/scheduling.zig");
pub const networking = @import("api/networking.zig");
pub const storagemigration = @import("api/storagemigration.zig");
pub const storage = @import("api/storage.zig");
pub const authentication = @import("api/authentication.zig");
pub const batch = @import("api/batch.zig");
pub const authorization = @import("api/authorization.zig");
pub const certificates = @import("api/certificates.zig");
pub const rbac = @import("api/rbac.zig");
