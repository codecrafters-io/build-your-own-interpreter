Before starting this stage, make sure you've read the "Welcome" section of the book that contains these chapters:

- [Introduction](https://craftinginterpreters.com/introduction.html) (chapter 1)
- [A Map of the Territory](https://craftinginterpreters.com/a-map-of-the-territory.html) (chapter 2)
- [The Lox Language](https://craftinginterpreters.com/the-lox-language.html) (chapter 3)

These chapters don't involve writing code, so they won't be covered in this challenge. This challenge will start
from chapter 4, [Scanning](https://craftinginterpreters.com/scanning.html).

---

In this stage, you'll implement the `tokenize` command to handle empty .lox files.

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

The tester will write an empty file to `test.lox`. It'll then run your program like this:

```
$ ./your_program.sh tokenize test.lox
EOF  null
```

Since the file is empty, only one token is expected in the output: `EOF`. The tester will verify that `EOF<space><space>null` is printed to stdout.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- There are two spaces between `EOF` and `null`. This is because the `<lexeme>` part is an empty string for the `EOF` token.
- In this stage, your scanner only needs to handle empty files. You’ll gradually expand its functionality in the upcoming stages.