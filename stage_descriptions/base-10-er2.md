In this stage, you'll let `tokenize` accept spaces, tabs, and newlines between
tokens.

### Whitespace and token boundaries

Whitespace separates source text without producing tokens of its own.

Whitespace still marks a boundary: `= =` produces two `EQUAL` tokens, while `==`
produces one `EQUAL_EQUAL`. A newline also ends a `//` comment, allowing
scanning to resume on the next line.

### Tests

The tester will run a series of tests with `test.lox` files that contain
whitespace (tabs, spaces, and newlines) mixed with previously introduced tokens.

In this illustration, `<|TAB|>` and `<|SPACE|>` stand for actual tab and space
characters in `test.lox`:

```
(<|TAB|>
<|SPACE|>)
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- In the logs, the spaces will be replaced with `<|SPACE|>` and tabs will be
  replaced with `<|TAB|>` for readability. The `test.lox` file will contain
  actual space/tab characters.
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.6: Longer Lexemes](https://craftinginterpreters.com/scanning.html#longer-lexemes).
