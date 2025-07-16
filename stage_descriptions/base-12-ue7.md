In this stage, you'll add support for scanning string literals.

### Book reference

The code for this stage is implemented in [Section 4.6.1: String literals](https://craftinginterpreters.com/scanning.html#string-literals).

### Tests

The tester will run a series of tests with `test.lox` files that contain string literals inside double quotes, mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
"foo baz"
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
STRING "foo baz" foo baz
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

As mentioned in the book, the [format for printing out tokens](https://craftinginterpreters.com/scanning.html#location-information) is `<TOKEN_TYPE> <LEXEME> <LITERAL>`. Up until now,
the `<LITERAL>` field was always `null`. For strings, the `<LITERAL>` field will contain the string's contents.

If a string is unterminated, a lexical error should be raised.

For example, if `test.lox` contains the following:

```
"bar
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
[line 1] Error: Unterminated string.
EOF  null
```

The tester will assert that a lexical error is raised, the error message matches the expected format, and the program exits with status code 65.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- The `<LEXEME>` field will contain the string's contents including quotes, since it represents the actual characters that matched the token. The `<LITERAL>` field will
  contain the string's contents without quotes, since it represents the string's value.
- Lox doesn't support escape sequences within strings, so you can't include a `"` inside a string.
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.