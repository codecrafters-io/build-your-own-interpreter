In this stage, you'll add support for the `run` command and handle running the `print` statement. For this, you'll need to update your AST generator, parser & interpreter.

### Book reference

The code for this stage is implemented in [Section 8.1: Statements](https://craftinginterpreters.com/statements-and-state.html#statements).

### Tests

The tester will run a series of tests with `test.lox` files that contain the `print` statement.

For example, if `test.lox` contains the following

```
print "Hello, World!";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Hello, World!
```

The tester will run multiple such tests with randomized expressions, for example:

| Input | Expected output |
| :---: | :-------------: |
| `print "Hello, World!";` | `Hello, World!` |
| `print 42;` | `42` |
| `print true;` | `true` |
| `print 12 + 24;` | `36` |

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

The tester will also verify that your program correctly handles invalid print statements. For example:

```
print;
```

The tester will assert that the exit code is 65, signifying a syntax error.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- The `run` command expects each statement to end with a semicolon. In contrast, the `evaluate` command is intended for single expressions and does not require a semicolon. Your implementation should support both modes of execution.