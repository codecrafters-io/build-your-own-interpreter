In this stage, you'll parse equality (`==`) and inequality (`!=`).

### Equality expressions

Both use the existing binary-expression output format.

Equality has lower precedence than comparison, so `1 < 2 == true` prints as
`(== (< 1.0 2.0) true)`. The two equality operators have equal precedence and
associate to the left. Keep the established precedence of all earlier operators.

### Tests

The tester will run a series of tests with `test.lox` files that contain
equality operators, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
"baz" == "baz"
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(== baz baz)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
