In this stage, you'll add support for scanning reserved words, which are: `and`, `class`, `else`, `false`, `for`, `fun`, `if`, `nil`, `or`, `print`, `return`, `super`, `this`, `true`, `var`, `while`.

### Book reference

The code for this stage is implemented in [Section 4.7: Reserved Words and Identifiers](https://craftinginterpreters.com/scanning.html#reserved-words-and-identifiers).

### Tests

The tester will run a series of tests with `test.lox` files that contain reserved words mixed with other previously introduced token types.

For example, if `test.lox` contains the following:

```
and
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
AND and null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.