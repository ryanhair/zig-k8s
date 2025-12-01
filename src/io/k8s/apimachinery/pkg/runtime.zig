// Namespace: runtime

const std = @import("std");
const root = @import("../../../../root.zig");

pub const RawExtension = struct {
    pub fn validate(self: @This()) !void {
        _ = self;
    }
};
