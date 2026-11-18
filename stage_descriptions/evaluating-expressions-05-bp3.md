In this stage, you'll evaluate multiplication (`*`) and division (`/`).

### Multiplication and division

For each binary expression, evaluate the left operand, then the right operand,
and apply the operator to their values.

Follow the structure already recorded by your parser, including grouping,
precedence, and left associativity. Division can produce a fraction: `42 / 5` is
`8.4`. Each arithmetic operation in this stage has numeric operands, and an
expression can contain several operations.

### Tests

The tester will run a series of tests with `test.lox` files that contain
expressions with the arithmetic operators `*` and `/`.

For example, if `test.lox` contains the following:

```
(18 * 3 / (3 * 6))
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
3
```

The tester will run multiple such tests with randomized expressions, for
example:

|       Input        | Expected output |
| :----------------: | :-------------: |
|      `42 / 5`      |      `8.4`      |
| `18 * 3 / (3 * 6)` |       `3`       |
| `(10.40 * 2) / 2`  |     `10.4`      |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- In this stage, you can assume we will not test for error cases. Runtime errors
  will be introduced in later stages. Each operation will have two numeric
  operands.
- For the book's explanation, see
  [Section 7.2.5: Evaluating binary operators](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-binary-operators).
