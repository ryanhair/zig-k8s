// Namespace: version

const std = @import("std");
const root = @import("../../../../root.zig");


pub const Info = struct {
    buildDate: []const u8,
    compiler: []const u8,
    emulationMajor: ?[]const u8 = null,
    emulationMinor: ?[]const u8 = null,
    gitCommit: []const u8,
    gitTreeState: []const u8,
    gitVersion: []const u8,
    goVersion: []const u8,
    major: []const u8,
    minCompatibilityMajor: ?[]const u8 = null,
    minCompatibilityMinor: ?[]const u8 = null,
    minor: []const u8,
    platform: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

