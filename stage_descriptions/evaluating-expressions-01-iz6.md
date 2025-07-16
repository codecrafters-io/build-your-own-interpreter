In this stage you'll implement support for the `evaluate` command and handle evaluating the `true`, `false`, and `nil` literals.

### Book reference

The code for this stage is implemented in [Section 7.2.1: Evaluating Literals](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-literals).

### The `evaluate` command

In the previous stages, the tester used the `parse` command to test your parser implementation. In this extension, the tester will need to test
your evaluator implementation, so it'll use a different command instead: `evaluate`.

The `evaluate` command accepts a path to a file (`test.lox` for example) and prints out the result of evaluating the file to stdout.

For example, if `test.lox` contains the following:

```
2 + 3
```

The `evaluate` command will return the following:

```
$ ./your_program.sh evaluate test.lox
5
```

This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox).

For the same file, here's what the output from `parse` would've been:

```
$ ./your_program.sh parse test.lox
(+ 2.0 3.0)
```

### Tests

The tester will run a series of tests with `test.lox` files that contain the boolean values `true` & `false`, and the `nil` literal.

For example, if `test.lox` contains the following:

```
true
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
true
```

The tester will run multiple such tests with randomized expressions, for example:

| Input | Expected output |
| :---: | :-------------: |
| `true` | `true` |
| `false` | `false` |
| `nil` | `nil` |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- For the `nil` literal, the tester will check that the program prints `nil`.