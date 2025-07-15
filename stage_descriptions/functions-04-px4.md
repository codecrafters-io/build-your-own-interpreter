In this stage, you'll add support for detecting and handling syntax errors in user defined functions in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.3: Function Declarations](https://craftinginterpreters.com/functions.html#function-declarations).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with user defined functions with arguments.

For example, if `test.lox` contains the following

```
clock(;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 2] Error at ';': Expect expression.
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
print clock(;
```

Expected Output:

```
[line 1] Error at ';': Expect expression.
```

Test Case 2:

Input:

```
print clock)));
```

Expected Output:

```
[line 1] Error at ')': Expect ';' after value.
```

Test Case 3:

Input:

```
fun f() 74;
print f();
```

Expected Output:

```
[line 2] Error at '74': Expect '{' before function body.
```

Test Case 4:

Input:

```
fun foo(a, b c, d, e, f) {}
foo();
```

Expected Output:

```
[line 2] Error at 'c': Expect ')' after parameters.
```

The tester will assert that the exit code of your program is 65, when there is a compilation error.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/body_must_be_block.lox)
- Error messages should be printed to `stderr`, not `stdout`.
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 65.