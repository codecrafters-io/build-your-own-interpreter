In this stage, you'll add support for scanning whitespace characters (tabs, spaces and newlines).

### Book reference

The code for this stage is implemented in [Section 4.6: Longer Lexemes](https://craftinginterpreters.com/scanning.html#longer-lexemes).

### Tests

The tester will run a series of tests with `test.lox` files that contain whitespaces (tabs, spaces and newlines) mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

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

Note that the tab, space and newline characters are ignored, so they don't appear as tokens in the output.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- In the logs, the spaces will be replaced with `<|SPACE|>` and tabs will be replaced with `<|TAB|>` for readability. The `test.lox` file will contain actual space/tab characters.
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.