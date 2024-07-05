The entry point for your Interpreter implementation is in `cmd/myinterpreter/main.go`.

Study and uncomment the relevant code: 

```go
// Uncomment this block to pass the first stage

filename := os.Args[2]
fileContents, err := os.ReadFile(filename)
if err != nil {
	fmt.Fprintf(os.Stderr, "Error reading file: %v\n", err)
	os.Exit(1)
}

if len(fileContents) > 0 {
	panic("Scanner not implemented")
} else {
	fmt.Println("EOF  null") // Placeholder, remove this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
