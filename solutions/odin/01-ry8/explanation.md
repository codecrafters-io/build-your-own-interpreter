The entry point for your Interpreter implementation is in `src/main.odin`.

Study and uncomment the relevant code: 

```odin
// Uncomment this block to pass the first stage
if len(file_contents) > 0 {
    panic("Scanner not implemented")
} else {
    fmt.println("EOF  null") // Placeholder, replace this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
