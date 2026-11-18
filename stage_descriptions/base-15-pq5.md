In this stage, you'll distinguish reserved words from ordinary identifiers.

### Recognizing keywords

A reserved word, also called a **keyword**, has a fixed role in the language,
such as `var` introducing a variable declaration.

The keywords are `and`, `class`, `else`, `false`, `for`, `fun`, `if`, `nil`,
`or`, `print`, `return`, `super`, `this`, `true`, `var`, and `while`. Their
token types are the corresponding uppercase names, such as `AND` and `CLASS`,
and their literal field is `null`.

Match a complete identifier exactly and case-sensitively. `and` is a keyword,
but `android` and `AND` remain identifiers.

### Tests

The tester will run a series of tests with `test.lox` files that contain
reserved words mixed with other previously introduced token types.

For example, if `test.lox` contains the following:

```
and
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
AND and null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.7: Reserved Words and Identifiers](https://craftinginterpreters.com/scanning.html#reserved-words-and-identifiers).
