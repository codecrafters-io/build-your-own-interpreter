The entry point for your Interpreter implementation is in `src/main.zig`.

Study and uncomment the relevant code: 

```zig
// Uncomment this block to pass the first stage
const file_contents = try file.readToEndAlloc(allocator, 1024);
defer allocator.free(file_contents);
if (file_contents.len != 0) {
    @panic("Scanner not implemented");
} else {
    try stdout.print("EOF  null", .{});
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
