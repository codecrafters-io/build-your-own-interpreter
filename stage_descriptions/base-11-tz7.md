Your scanner already ignores whitespace and reports lexical errors. In this
stage, you'll give each error its actual source line number so a programmer can
find the invalid character.

### Source line numbers

Lines start at 1. Each newline advances the line number, including a newline
after a comment. Spaces and tabs leave it unchanged. Keep reporting all invalid
characters and emitting the valid tokens.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid
characters on different lines.

For example, the following display uses `<|SPACE|>` and `<|TAB|>` to show actual
space and tab characters in `test.lox`:

```
#<|SPACE|>(
)<|TAB|>@
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
[line 1] Error: Unexpected character: #
[line 2] Error: Unexpected character: @
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

Errors should be printed to the stderr stream, starting with the `[line N]`
prefix. If lexical errors were present, your program must exit with exit
code 65.

The tester will assert that:

- The stderr stream contains one line for each lexical error (if present)
  - Each line must match the format
    `[line N] Error: Unexpected character: <character>`
- The stdout stream contains one line for each valid token (even if other
  lexical errors are present)
- Your program exits with exit code 65 if lexical errors are present, and exit
  code 0 if not

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Since stdout and stderr are separate streams, the relative order of errors vs.
  valid tokens doesn't matter. You're free to print errors first, errors last,
  or errors interleaved with valid tokens.
- Keep debugging messages on stderr and omit any `[line N]` marker from them, so
  the tester can distinguish them from errors.
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.5.1: Lexical Errors](https://craftinginterpreters.com/scanning.html#lexical-errors).
