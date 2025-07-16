In this stage, you'll add support for scanning lexical errors, which span multiple lines.

### Book reference

The code for this stage is implemented in [Section 4.5.1: Lexical Errors](https://craftinginterpreters.com/scanning.html#lexical-errors).

### Tests

The tester will run a series of tests with `test.lox` files that contain lexical errors spanning multiple lines.

For example, if `test.lox` contains the following:

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

Errors should be printed to the stderr stream, starting with the `[line N]` prefix. If lexical errors were present,
your program must exit with exit code 65.

The tester will assert that:

- The stderr stream contains one line for each lexical error (if present)
  - Each line must match the format `[line N] Error: Unexpected character: <character>`
- The stdout stream contains one line for each valid token (even if other lexical errors are present)
- Your program exits with exit code 65 if lexical errors are present, and exit code 0 if not

Line numbers should start at 1.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Since stdout and stderr are separate streams, the relative order of errors vs. valid tokens doesn't matter. You're free to print
  errors first, errors last, or errors interleaved with valid tokens.
- Only lines that start with `[line N]` are considered errors, so you can still print other lines to stderr for debugging purposes.
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.