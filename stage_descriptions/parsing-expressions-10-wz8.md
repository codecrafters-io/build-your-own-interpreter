In this stage, you'll add support for handling syntax errors in expressions.

### Book reference

The code for this stage is implemented in [Section 6.3: Syntax Errors](https://craftinginterpreters.com/parsing-expressions.html#syntax-errors).

### Tests

The tester will run a series of tests with `test.lox` files that contain syntax errors.

For example, if `test.lox` contains the following:

```
(72 +)
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
[line 1] Error at ')': Expect expression.
```

The tester will assert that the exit code is 65.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- Error messages should be printed to `stderr`, not `stdout`.
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 65.