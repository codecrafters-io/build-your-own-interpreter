The entry point for your Interpreter implementation is in `src/main.c`.

Study and uncomment the relevant code: 

```c
// Uncomment this block to pass the first stage
if (strlen(file_contents) > 0) {
    fprintf(stderr, "Scanner not implemented\n");
    exit(1);
}
printf("EOF  null\n"); // Placeholder, remove this line when implementing the scanner
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
