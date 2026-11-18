In this stage, you'll extend `parse` to represent number literals.

### Number literal nodes

Your scanner already provides a number's value. The parser now represents that
value as a literal node in the AST.

Print the numeric value using the same format as the scanner's literal field:
whole numbers include `.0`, so `42` prints as `42.0`. The `parse` output
contains just the AST representation, without token types, lexemes, or an `EOF`
line.

### Tests

The tester will run a series of tests with `test.lox` files that contain
whole-number and fractional number literals.

For example, if `test.lox` contains the following:

```
42.47
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
42.47
```

The tester will run multiple such tests with randomized expressions, for
example:

|  Input  | Expected output |
| :-----: | :-------------: |
|  `42`   |     `42.0`      |
|  `0.0`  |      `0.0`      |
| `12.34` |     `12.34`     |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
