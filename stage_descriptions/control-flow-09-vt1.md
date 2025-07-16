In this stage, you'll add support for syntactic errors in your interpreter. Syntactic errors are errors that occur when the code is not written in the correct syntax.

### Book reference

The code for this stage is implemented in [Section 9.5: For Loops](https://craftinginterpreters.com/control-flow.html#for-loops).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with syntactic errors.

For example, if `test.lox` contains the following

```
for (;;) var foo;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 1] Error at 'var': Expect expression.
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
if (true) "ok"; else var foo;
```

Expected Output:

```
[line 1] Error at 'var': Expect expression.
```

Test Case 2:

Input:

```
for (var a = 1; {}; a = a + 1) {}
```

Expected Output:

```
[line 2] Error at '{': Expect expression.
[line 2] Error at ')': Expect ';' after expression.
```

Test Case 3:

Input:

```
for (var a = 1; a < 2; {}) {}
```

Expected Output:

```
[line 2] Error at '{': Expect expression.
```

Test Case 4:

Input:

```
for ({}; a < 2; a = a + 1) {}
```

Expected Output:

```
[line 2] Error at '{': Expect expression.
[line 2] Error at ')': Expect ';' after expression.
```

The tester will only assert that the exit code is 65, when there is a compilation error.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/dangling_else.lox)
- Error messages should be printed to `stderr`, not `stdout`.
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 65.