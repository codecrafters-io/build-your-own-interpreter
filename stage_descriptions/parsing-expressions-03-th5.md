In this stage, you'll extend `parse` to represent string literals.

### String literal nodes

A string becomes a literal node whose value is the text between the source
quotes.

Print that value without the surrounding quotes. Preserve its contents,
including spaces, digits, and text such as `//` that would have a different
meaning outside a string.

### Tests

The tester will run a series of tests with `test.lox` files that contain string
literals whose contents can include whitespace and digits.

For example, if `test.lox` contains the following:

```
"hello"
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
hello
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
