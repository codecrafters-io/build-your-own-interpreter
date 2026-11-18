In this stage, you'll extend `tokenize` to recognize `(` and `)`.

### Parenthesis tokens

These are the first tokens read from source text, so their order in the output
must match their order in the file.

Use `LEFT_PAREN` for `(` and `RIGHT_PAREN` for `)`. Each lexeme is the original
character, and each literal field is `null`. Keep the final `EOF` token.

### Tests

The tester will run a series of tests with `test.lox` files that contain
parentheses.

For example, if `test.lox` contains the following:

```
(()
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_PAREN ( null
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.5: Recognizing Lexemes](https://craftinginterpreters.com/scanning.html#recognizing-lexemes).
