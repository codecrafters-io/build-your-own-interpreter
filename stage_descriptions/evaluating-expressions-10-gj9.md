In this stage, you'll add support for handling runtime errors while evaluating the unary operator `-`.

### Book reference

The code for this stage is implemented in [Section 7.3: Runtime Errors](https://craftinginterpreters.com/evaluating-expressions.html#runtime-errors).

### Tests

The tester will test your program using a `test.lox` file that contains an expression with the unary operator `-`. This expression
will contain a usage of the `-` operator that should throw a runtime error.

The unary operator `-` will throw a runtime error if the operand is not a number.

For example, if `test.lox` contains the following:

```
-"hello world!"
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
Operand must be a number.
[line 1]
```

The tester will run multiple such tests with randomized expressions, for example:

| Input | Expected output |
| :---: | :-------------: |
| `-"foo"` | `Operand must be a number.` |
| `-true` | `Operand must be a number.` |
| `-("foo" + "bar")` | `Operand must be a number.` |
| `-false` | `Operand must be a number. `|

The tester will assert that the exit code is 70, signifying a runtime error. Note that this is different from the expected exit code for a syntax error, which is 65.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- Error messages should be printed to `stderr`, not `stdout`.
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 70.