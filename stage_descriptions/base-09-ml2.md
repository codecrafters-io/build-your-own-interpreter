In this stage, you'll distinguish the division operator `/` from a line comment
beginning with `//`.

### Division and line comments

Comments let a programmer include text that the interpreter ignores.

A single `/` produces `SLASH / null`. For `//`, ignore everything through the
end of that line or the end of the file. Emit no token for the comment, even if
its text contains otherwise invalid characters. The tests here use single-line
inputs.

### Tests

The tester will run a series of tests with `test.lox` files that contain `/` &
`//` mixed with previously introduced tokens.

For example, if `test.lox` contains the following:

```
()// Comment
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

Similarly, if `test.lox` contains the following:

```
/()
```

The tester will run your program like this:

```
$ ./your_program.sh tokenize test.lox
SLASH / null
LEFT_PAREN ( null
RIGHT_PAREN ) null
EOF  null
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/tree/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/scanning)
- Scanning does not check whether parentheses or braces are balanced. That
  requires parsing the program's structure.
- For the book's explanation, see
  [Section 4.6: Longer Lexemes](https://craftinginterpreters.com/scanning.html#longer-lexemes).
