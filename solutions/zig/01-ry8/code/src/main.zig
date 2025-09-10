const std = @import("std");
const stdout = std.fs.File.stdout();

pub fn main() !void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len < 3) {
        try stdout.writeAll("Usage: ./your_program.sh tokenize <filename>\n");
        std.process.exit(1);
    }

    const command = args[1];
    const filename = args[2];

    if (!std.mem.eql(u8, command, "tokenize")) {
        try stdout.writeAll("Unknown command: {s}\n");
        std.process.exit(1);
    }

    const file_contents = try std.fs.cwd().readFileAlloc(std.heap.page_allocator, filename, std.math.maxInt(usize));
    defer std.heap.page_allocator.free(file_contents);

    if (file_contents.len > 0) {
        @panic("Scanner not implemented");
    } else {
        try stdout.writeAll("EOF  null\n"); // Placeholder, replace this line when implementing the scanner
    }
}
