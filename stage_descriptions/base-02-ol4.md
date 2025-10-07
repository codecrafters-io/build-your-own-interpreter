In this stage, you'll add support for scanning parentheses.

### Book reference

The code for this stage is implemented in [Section 4.5: Recognizing Lexemes](https://craftinginterpreters.com/scanning.html#recognizing-lexemes).

### The `tokenize` command

The `tokenize` command tokenizes a Lox program and prints the tokens to stdout. We'll use this for testing
all stages in the [Scanning](https://craftinginterpreters.com/scanning.html) chapter.

If there's a file named `test.lox` with the following contents:

```
var language = "lox";
```

The `tokenize` command will return the following:

```
$ ./your_program.sh tokenize test.lox
VAR var null
IDENTIFIER language null
EQUAL = null
STRING "lox" lox
SEMICOLON ; null
EOF  null
```

This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning).

Each line corresponds to a token in the file (Image from [Section 4.2: Lexemes & Tokens](https://craftinginterpreters.com/scanning.html#lexemes-and-tokens)):

![img](https://craftinginterpreters.com/image/scanning/lexemes.png)

This is the format for each line:

```
<token_type> <lexeme> <literal>
```

- `<token_type>`: The type of the token.
  - Examples: `VAR`, `IDENTIFIER`, `STRING`, `EOF` etc.
- `<lexeme>`: The actual sequence of characters that formed the token.
  - Examples: `var`, `breakfast`, `"bagels"` etc.
  - For an `EOF` token, the lexeme is an empty string.
- `<literal>`: The literal value of the token.
  - For most tokens this is `null`.
  - For `STRING`/`NUMBER` tokens, it holds the value of the string/number.

The `EOF` token is a special token that represents the end of the file. All calls to `tokenize` will include an `EOF` token at the end.

### Tests

The tester will run a series of tests with `test.lox` files that contain parentheses.

For example, if `test.lox` contains the following:

```
(()
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_PAREN ( null
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- When scanning for tokens, it's valid to have "unbalanced" parentheses. When we get to parsing expressions in later stages, these cases will be highlighted as errors.