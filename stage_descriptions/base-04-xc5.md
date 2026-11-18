In this stage, you'll recognize the single-character tokens `,`, `.`, `-`, `+`,
`;`, and `*` alongside parentheses and braces.

### Single-character tokens

These punctuation marks will later separate or combine parts of a Lox program.
For now, classify each character without executing it.

Use the token types in the table below, with the original character as the
lexeme and `null` as the literal. The `/` token is shown for reference and comes
in later stages.

### Tests

The tester will run a series of tests with `test.lox` files that contain
parentheses, braces combined with all the new single-character tokens.

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

Here's a list of the single-character tokens and their types:

|       Token        |  Token type   |
| :----------------: | :-----------: |
|        `,`         |    `COMMA`    |
|        `.`         |     `DOT`     |
|        `-`         |    `MINUS`    |
|        `+`         |    `PLUS`     |
|        `;`         |  `SEMICOLON`  |
| `/` (later stages) |    `SLASH`    |
|        `*`         |    `STAR`     |
|        `(`         | `LEFT_PAREN`  |
|        `)`         | `RIGHT_PAREN` |
|        `{`         | `LEFT_BRACE`  |
|        `}`         | `RIGHT_BRACE` |

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.5: Recognizing Lexemes](https://craftinginterpreters.com/scanning.html#recognizing-lexemes).
