In this stage, you'll add support for scanning number literals.

### Book reference

The code for this stage is implemented in [Section 4.6.2: Number literals](https://craftinginterpreters.com/scanning.html#number-literals).

### Tests

The tester will run a series of tests with `test.lox` files that contain number literals mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
42
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
NUMBER 42 42.0
EOF  null
```

Just like strings, number literals have a "literal value" attached. Note that the literal value for an integer is represented as "42.0" (with a decimal point). This
matches the [book's format](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning/numbers.lox).

You'll also need to handle numbers with a decimal point, for example if `test.lox` contains the following:

```
1234.1234
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
NUMBER 1234.1234 1234.1234
EOF  null
```

The tester will run multiple such tests with randomized tokens, for example:

| Input | Expected output |
| :---: | :-------------: |
| `1` | `NUMBER 1 1.0` |
| `2345.6789` | `NUMBER 2345.6789 2345.6789` |
| `42.0000` | `NUMBER 42.0000 42.0` |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning/numbers.lox)
- Although the `<LITERAL>` field for an integer is represented as "42.0" (with a decimal point), the `<LEXEME>` field will contain the integer's value without the decimal point since
  it represents the actual characters that matched the token.
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.