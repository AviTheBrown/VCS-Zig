const std = @import("std");

pub fn main() void {
    var gpa = std.heap.GeneralPurposeAllocator().init;
    const allocator = gpa.allocator();
    defer {
        const deinit_status = gpa.deinit();
        if (deinit_status == .leak) @panic("Memory Leak Detected");
    }

    var args = try std.process.argsWithAllocator(allocator);
}
