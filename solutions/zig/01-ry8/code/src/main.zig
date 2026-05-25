const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const gpa = init.gpa;

    const args = try init.minimal.args.toSlice(init.arena.allocator());

    if (args.len < 3) {
        std.debug.print("Usage: ./your_program.sh tokenize <filename>\n", .{});
        std.process.exit(1);
    }

    const command = args[1];
    const filename = args[2];

    if (!std.mem.eql(u8, command, "tokenize")) {
        std.debug.print("Unknown command: {s}\n", .{command});
        std.process.exit(1);
    }

    const file_contents = try std.Io.Dir.cwd().readFileAlloc(io, filename, gpa, .unlimited);
    defer gpa.free(file_contents);

    if (file_contents.len > 0) {
        @panic("Scanner not implemented");
    } else {
        try std.Io.File.stdout().writeStreamingAll(io, "EOF  null\n"); // Placeholder, replace this line when implementing the scanner
    }
}
