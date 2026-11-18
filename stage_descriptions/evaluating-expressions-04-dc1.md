In this stage, you'll evaluate the unary operators `-` and `!`.

### Negation and truthiness

Each operator acts on the value produced by its operand, which can itself be a
grouped or unary expression.

The `-` operator negates a number. The `!` operator returns a boolean based on
**truthiness**, the rule for treating a value as true or false. In Lox, only
`false` and `nil` are falsy. Every number and string is truthy, including `0`
and `""`. Thus `!nil` is `true`, and `!0` is `false`.

Invalid operands for `-` are covered in the runtime-error stages.

### Tests

The tester will run a series of tests with `test.lox` files that contain
expressions with unary operators.

For example, if `test.lox` contains the following:

```
-(73)
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
-73
```

The tester will run multiple such tests with randomized expressions, for
example:

|    Input     | Expected output |
| :----------: | :-------------: |
|    `-73`     |      `-73`      |
|   `!true`    |     `false`     |
|   `!10.40`   |     `false`     |
| `!((false))` |     `true`      |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- For the book's explanation, see
  [Section 7.2.3: Evaluating unary expressions](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-unary-expressions).
