const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stderr = std.io.getStdErr().writer();

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 3) {
        try stderr.print("Usage: {s} tokenize <filename>\n", .{args[0]});
        return;
    }

    const command: []const u8 = args[1];
    const filename: []const u8 = args[2];

    if (std.mem.eql(u8, command, "tokenize")) {
        const file = try std.fs.cwd().openFile(filename, .{ .mode = .read_only });
        defer file.close();

        const file_contents = try file.readToEndAlloc(allocator, 1024);
        defer allocator.free(file_contents);
        if (file_contents.len != 0) {
            @panic("Scanner not implemented");
        } else {
            try stdout.print("EOF  null", .{});
        }

    } else {
        try stderr.print("Unknown command: {s}\n", .{command});
    }
}
