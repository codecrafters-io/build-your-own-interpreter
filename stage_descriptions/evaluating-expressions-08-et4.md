In this stage, you'll evaluate the relational operators `>`, `<`, `>=`, and
`<=`.

### Ordering numbers

Compare the numeric values of the operands and produce the boolean `true` or
`false`.

Unlike arithmetic's numeric result, the comparison result is a boolean. Evaluate
each operand expression before comparing it, while preserving the precedence
already represented in the AST. Type errors are covered later.

### Tests

The tester will run a series of tests with `test.lox` files that contain
expressions with the relational operators `>`, `<`, `>=` & `<=`.

For example, if `test.lox` contains the following:

```
10 > 5
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
true
```

The tester will run multiple such tests with randomized expressions, for
example:

|              Input              | Expected output |
| :-----------------------------: | :-------------: |
|           `57 > -65`            |     `true`      |
|           `11 >= 11`            |     `true`      |
| `(54 - 67) >= -(114 / 57 + 11)` |     `true`      |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- In this stage, you can assume we will not test for error cases. Runtime errors
  will be introduced in later stages. For now, all relational operations will
  involve only two numbers.
- For the book's explanation, see
  [Section 7.2.5: Evaluating binary operators](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-binary-operators).
