In this stage, you'll add support for scanning the division operator & comments.
Comments start with `//`, and the division operator is `/`.

### Book reference

The code for this stage is implemented in [Section 4.6: Longer Lexemes](https://craftinginterpreters.com/scanning.html#longer-lexemes).

### Tests

The tester will run a series of tests with `test.lox` files that contain `/` & `//` mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
()// Comment
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

Similarly, if `test.lox` contains the following:

```
/()
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
SLASH / null
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- There's no token type for comments, your scanner just needs to ignore any characters after `//`.
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.