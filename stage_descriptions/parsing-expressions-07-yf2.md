In this stage, you'll parse addition (`+`) and subtraction (`-`) using the
binary-expression format.

### Precedence and associativity

These operators have lower precedence than `*` and `/`, so `2 + 3 * 4` prints as
`(+ 2.0 (* 3.0 4.0))`. Addition and subtraction have equal precedence and
associate to the left.

The same `-` token can be unary or binary. In `-2 - 3`, the first minus negates
one operand and the second separates two operands. The AST is `(- (- 2.0) 3.0)`.

### Tests

The tester will run a series of tests with `test.lox` files that contain
addition and subtraction, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
52 + 80 - 94
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(- (+ 52.0 80.0) 94.0)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
