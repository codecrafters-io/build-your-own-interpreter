In this stage, you'll parse the comparison operators `>`, `<`, `>=`, and `<=`
using binary-expression nodes.

### Comparison expressions

All four have equal precedence, below addition and subtraction, and associate to
the left. Lox treats `1 < 2 < 3` as `(1 < 2) < 3`. Each comparison becomes a
separate nested operation. Evaluating whether its operands have suitable types
comes in a later extension.

### Tests

The tester will run a series of tests with `test.lox` files that contain
comparison operators, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
83 < 99 < 115
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(< (< 83.0 99.0) 115.0)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
