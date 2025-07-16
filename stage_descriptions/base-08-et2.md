In this stage, you'll add support for scanning relational operators, which are: `<`, `>`, `<=`, `>=`.

### Book reference

The code for this stage is implemented in [Section 4.5.2: Operators](https://craftinginterpreters.com/scanning.html#operators).

### Tests

The tester will run a series of tests with `test.lox` files that contain relational operators mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
<<=>>=
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LESS < null
LESS_EQUAL <= null
GREATER > null
GREATER_EQUAL >= null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.