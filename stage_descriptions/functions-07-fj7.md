In this stage, you'll add support for runtime errors in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.4: Function Objects](https://craftinginterpreters.com/functions.html#function-objects).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with runtime errors.

For example, if `test.lox` contains the following

```
85();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Can only call functions and classes.
[line 1]
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
"not a function"();
```

Expected Output:

```
Can only call functions and classes.
[line 1]
```

Test Case 2:

Input:

```
fun f(a, b) {
  print a;
  print b;
}

f(1, 2, 3, 4);
```

Expected Output:

```
Expected 2 arguments but got 4.
[line 6]
```

Test Case 3:

Input:

```
fun f(a, b) {}

f(1);
```

Expected Output:

```
Expected 2 arguments but got 1.
[line 3]
```

Test Case 4:

Input:

```
false();
```

Expected Output:

```
Can only call functions and classes.
[line 1]
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 70.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/body_must_be_block.lox)
- Error messages should be printed to `stderr`, not `stdout`.
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 70.