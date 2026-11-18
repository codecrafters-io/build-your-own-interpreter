In this stage, you'll extend runtime-error handling to invalid function calls.

### Callable values and arity

A **callable** is a value that can be invoked. Numbers, strings, booleans, and
`nil` are not callable.

A function's **arity** is the number of arguments it expects. Lox calls must
supply exactly that number, including zero for `clock`. Too many or too few
arguments cause a runtime error.

Evaluate the callee and arguments in the established order, then check whether
the call is valid before executing the function body. On failure, stop the
program, report a diagnostic on stderr, and exit with code 70. Keep any stdout
already produced.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with runtime errors.

For example, if `test.lox` contains the following

```
85();
```

The tester will run your program like this. The shown diagnostic is on stderr:

```
$ ./your_program.sh run test.lox
Can only call functions and classes.
[line 1]
```

The tester varies the values and expressions. These examples show the required
behavior:

Too many arguments:

Input:

```
fun f(a, b) {
  print a;
  print b;
}

f(1, 2, 3, 4);
```

Example stderr:

```
Expected 2 arguments but got 4.
[line 6]
```

Too few arguments:

Input:

```
fun f(a, b) {}

f(1);
```

Example stderr:

```
Expected 2 arguments but got 1.
[line 3]
```

These examples produce empty stdout and exit with code 70. The tester checks
stdout and exit status.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/body_must_be_block.lox)
- The exact error message is not checked. The example message mentions classes,
  which are introduced in a later extension.
- For the book's explanation, see
  [Section 10.4: Function Objects](https://craftinginterpreters.com/functions.html#function-objects).
