In this stage, you'll evaluate number and string literal nodes by producing the
values they contain.

### Runtime number and string values

Keep the values' types distinct. The number `42` and the string `"42"` may print
the same way, but later operators treat them differently.

Print strings without their surrounding quotes. Print numbers with no
unnecessary trailing fractional zeros, omitting `.0` for whole numbers. This
differs from the number format used by `tokenize` and `parse`: evaluating `10.0`
prints `10`.

### Tests

The tester will run a series of tests with `test.lox` files that contain number
literals and string literals.

For example, if `test.lox` contains the following:

```
"hello world!"
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
hello world!
```

The tester will run multiple such tests with randomized expressions, for
example:

|      Input       | Expected output |
| :--------------: | :-------------: |
| `"hello world!"` | `hello world!`  |
|     `10.40`      |     `10.4`      |
|       `10`       |      `10`       |

The tester will assert that the stdout of your program matches the format above.

### Notes

- The formatting for numbers differs slightly from the scanning and parsing
  stages, but it aligns with the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- For the book's explanation, see
  [Section 7.2.1: Evaluating Literals](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-literals).
