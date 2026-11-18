In this stage, you'll add the relational operators, which compare whether values
are smaller or larger.

### Relational operator tokens

Recognize `<`, `>`, `<=`, and `>=` as `LESS`, `GREATER`, `LESS_EQUAL`, and
`GREATER_EQUAL` respectively.

As with `!=`, an adjacent `=` belongs to the two-character token. Keep the
original operator as the lexeme and `null` as the literal.

### Tests

The tester will run a series of tests with `test.lox` files that contain
relational operators mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
<<=>>=
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LESS < null
LESS_EQUAL <= null
GREATER > null
GREATER_EQUAL >= null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.5.2: Operators](https://craftinginterpreters.com/scanning.html#operators).
