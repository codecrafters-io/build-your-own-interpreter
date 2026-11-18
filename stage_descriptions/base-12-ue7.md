In this stage, you'll recognize string literals.

### String tokens

A **literal** writes a value directly in source code, such as `"foo baz"`. The
surrounding double quotes mark where a string starts and ends.

Produce a `STRING` token whose lexeme includes both quotes and whose literal
field contains the text between them. Spaces, operator characters, and `//`
inside those quotes are part of the string.

Lox strings can span lines. Count their newlines for later diagnostics. If the
file ends before a closing quote, report `[line N] Error: Unterminated string.`
on stderr, using the line where the file ended. Emit no `STRING` token for that
unfinished string, keep the final `EOF`, and exit with code 65.

### Tests

The tester will run a series of tests with `test.lox` files that contain string
literals inside double quotes, mixed with previously introduced tokens.

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

As mentioned in the book, the
[format for printing out tokens](https://craftinginterpreters.com/scanning.html#location-information)
is `<TOKEN_TYPE> <LEXEME> <LITERAL>`. Up until now, the `<LITERAL>` field was
always `null`. For strings, the `<LITERAL>` field will contain the string's
contents.

An unterminated string produces a lexical error. In this example, `test.lox`
ends immediately after `bar`, with no newline:

```
"bar
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
[line 1] Error: Unterminated string.
EOF  null
```

The tester will assert that a lexical error is raised, the error message matches
the expected format, and the program exits with status code 65.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Lox doesn't support escape sequences within strings, so you can't include a
  `"` inside a string.
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.6.1: String literals](https://craftinginterpreters.com/scanning.html#string-literals).
