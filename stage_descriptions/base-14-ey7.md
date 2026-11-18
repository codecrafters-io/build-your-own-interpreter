In this stage, you'll recognize identifiers, the names that Lox programs use for
variables and functions.

### Identifier tokens

An identifier starts with an ASCII letter (`a`–`z` or `A`–`Z`) or underscore.
Later characters can also be digits. Consume the complete name and emit
`IDENTIFIER` with that name as the lexeme and `null` as the literal. For
example, `foo12` is one identifier, while `12foo` is a number followed by an
identifier.

Reserved words get their own token types in later stages. Treat word-shaped
tokens as identifiers for now.

### Tests

The tester will run a series of tests with `test.lox` files that contain
identifiers mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
foo bar _hello
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
IDENTIFIER foo null
IDENTIFIER bar null
IDENTIFIER _hello null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.7: Reserved Words and Identifiers](https://craftinginterpreters.com/scanning.html#reserved-words-and-identifiers).
