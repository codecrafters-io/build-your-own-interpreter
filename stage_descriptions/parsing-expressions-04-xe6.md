In this stage, you'll parse parenthesized expressions.

### Grouping nodes

Parentheses group an expression so it can be used as one part of a larger
expression.

Represent each pair as a grouping node containing the enclosed expression. Its
printed form is `(group <expression>)`, where `<expression>` is the enclosed
AST's printed form. Nested parentheses create nested groups: `((true))` prints
as `(group (group true))`.

Only correctly closed parentheses are required in this stage. Syntax errors come
later.

### Tests

The tester will run a series of tests with `test.lox` files that contain
parentheses, combined with number literals, string literals and booleans.

For example, if `test.lox` contains the following:

```
("foo")
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(group foo)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
