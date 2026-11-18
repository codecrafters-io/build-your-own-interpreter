Before your interpreter can run Lox code, it needs to recognize the pieces of
text that form the program. In this stage, you'll add the `tokenize` command and
make it handle an empty `.lox` source file.

### The `tokenize` command

**Scanning**, also called **tokenization**, divides source text into meaningful
units called tokens. A token can represent a name, a number, or a punctuation
mark. The `tokenize` command prints those tokens to stdout, the program's normal
output stream. We'll use it throughout the
[Scanning](https://craftinginterpreters.com/scanning.html) chapter.

Each token has this output format:

```
<token_type> <lexeme> <literal>
```

- The **token type** names its category, such as `STRING` or `NUMBER`.
- The **lexeme** is the exact text that formed the token. For the string
  `"lox"`, it includes the quotes.
- The **literal** field holds a string or number token's value, such as `lox`
  without quotes. Other token types use `null` in this field.

Every token sequence ends with `EOF`, an end-of-file marker. It has an empty
lexeme and a `null` literal, so its output is `EOF  null` with two spaces. Even
an empty source file produces this marker.

For context, a completed scanner will recognize this program:

```
var language = "lox";
```

It will produce the following tokens. You only need the empty-file case in this
stage:

```
$ ./your_program.sh tokenize test.lox
VAR var null
IDENTIFIER language null
EQUAL = null
STRING "lox" lox
SEMICOLON ; null
EOF  null
```

This output format matches the spec in the
[book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning).

The book illustrates how source text becomes tokens in
[Section 4.2: Lexemes & Tokens](https://craftinginterpreters.com/scanning.html#lexemes-and-tokens):

![Source text grouped into lexemes](https://craftinginterpreters.com/image/scanning/lexemes.png)

### Tests

The tester will write an empty file to `test.lox`. It'll then run your program
like this:

```
$ ./your_program.sh tokenize test.lox
EOF  null
```

Print exactly `EOF  null` followed by a newline to stdout and exit with code 0.
The `$` line above shows the command being run, and is not part of your
program's output.

### Notes

- Keep debugging output off stdout so it does not become part of the token
  output. Use stderr for diagnostics.
- Handling nonempty source files comes in later stages.
