The entry point for your Interpreter implementation is in `src/main.rs`.

Study and uncomment the relevant code: 

```rust
// Uncomment this block to pass the first stage
if !file_contents.is_empty() {
    panic!("Scanner not implemented");
} else {
    println!("EOF  null"); // Placeholder, replace this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
