In this stage, you'll add support for scanning braces.

### Book reference

The code for this stage is implemented in [Section 4.5: Recognizing Lexemes](https://craftinginterpreters.com/scanning.html#recognizing-lexemes).

### Tests

The tester will run a series of tests with `test.lox` files that contain braces combined with parentheses.

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

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- When scanning for tokens, it's valid to have "unbalanced" braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.