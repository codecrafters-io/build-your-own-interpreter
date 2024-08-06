The entry point for your Interpreter implementation is in `app/main.c`.

Study and uncomment the relevant code: 

```c
// Uncomment this block to pass the first stage
if (size != 0) {
  fprintf(stderr, "Scanner not implemented\n");
} else {
  printf("EOF  null\n"); // Placeholder, remove this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
