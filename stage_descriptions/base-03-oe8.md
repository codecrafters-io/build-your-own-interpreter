In this stage, you'll recognize `{` and `}` alongside parentheses.

### Brace tokens

Lox uses braces to enclose blocks of code, but scanning only identifies the
characters.

Use `LEFT_BRACE` for `{` and `RIGHT_BRACE` for `}`. Both have a `null` literal
field. As with parentheses, emit a token for each brace in source order, even
when braces are unbalanced.

### Tests

The tester will run a series of tests with `test.lox` files that contain braces
combined with parentheses.

For example, if `test.lox` contains the following:

```{{=<~ ~>=}}
{{}}
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_BRACE { null
LEFT_BRACE { null
RIGHT_BRACE } null
RIGHT_BRACE } null
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
