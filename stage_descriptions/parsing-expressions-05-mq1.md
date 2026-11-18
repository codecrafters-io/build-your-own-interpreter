In this stage, you'll parse numeric negation (`-`) and logical not (`!`).

### Unary expressions

These are **unary operators**: each has one operand, the expression it acts on.

Print a unary expression as `(<operator> <operand>)`. The operand can itself be
a unary expression, so `!!true` prints as `(! (! true))`. Parenthesized operands
retain their grouping nodes. Parsing records these operations without performing
them.

### Tests

The tester will run a series of tests with `test.lox` files that contain unary
operators, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
!true
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(! true)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
