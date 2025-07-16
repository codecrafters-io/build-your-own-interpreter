In this stage, you'll add support for scanning other single-character tokens, namely `,`, `.`, `-`, `+`, `;` and `*`.
`/` is not covered here, it's covered in later stages.

### Book reference

The code for this stage is implemented in [Section 4.5: Recognizing Lexemes](https://craftinginterpreters.com/scanning.html#recognizing-lexemes).

### Tests

The tester will run a series of tests with `test.lox` files that contain parentheses, braces combined with all the new single-character tokens.

For example, if `test.lox` contains the following:

```
({*.,+*})
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_PAREN ( null
LEFT_BRACE { null
STAR * null
DOT . null
COMMA , null
PLUS + null
STAR * null
RIGHT_BRACE } null
RIGHT_PAREN ) null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

Here's a list of all the single-character tokens along with their types:

| Token | Token Type |
| :---: | :-----------: |
| `,` | `COMMA` |
| `.` | `DOT` |
| `-` | `MINUS` |
| `+` | `PLUS` |
| `;` | `SEMICOLON` |
| `/` | `SLASH` |
| `*` | `STAR` |
| `(` | `LEFT_PAREN` |
| `)` | `RIGHT_PAREN` |
| `{` | `LEFT_BRACE` |
| `}` | `RIGHT_BRACE` |

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- When scanning for tokens, it's valid to have "unbalanced" parentheses or braces. When we get to parsing expressions in later stages, these cases will be highlighted as errors.