In this stage, you'll recognize number literals.

### Number tokens

Like a string token, a `NUMBER` token keeps both the original spelling and the
value it represents.

A number starts with one or more digits and may have a decimal point followed by
one or more digits. The point belongs to the number only when a digit follows
it. Thus `123.` is a `NUMBER` followed by `DOT`, and `.123` is `DOT` followed by
`NUMBER`. A leading `-` remains a separate `MINUS` token.

Keep the source spelling in the lexeme. Format the literal as a decimal number,
removing unnecessary trailing fractional zeros but keeping `.0` for whole
numbers. For example, `42.0000` has lexeme `42.0000` and literal `42.0`.

### Tests

The tester will run a series of tests with `test.lox` files that contain number
literals mixed with previously introduced tokens.

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

Just like strings, number literals have a "literal value" attached. Note that
the literal value for an integer is represented as "42.0" (with a decimal
point). This matches the
[book's format](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning/numbers.lox).

You'll also need to handle numbers with a decimal point, for example if
`test.lox` contains the following:

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

|    Input    |       Expected output        |
| :---------: | :--------------------------: |
|     `1`     |        `NUMBER 1 1.0`        |
| `2345.6789` | `NUMBER 2345.6789 2345.6789` |
|  `42.0000`  |    `NUMBER 42.0000 42.0`     |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning/numbers.lox)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.6.2: Number literals](https://craftinginterpreters.com/scanning.html#number-literals).
