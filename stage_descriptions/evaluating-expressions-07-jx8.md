In this stage, you'll give `+` a second behavior: when both operands are
strings, concatenate them by joining their contents in order.

### String concatenation

Numeric addition continues to work.

Choosing an operator's behavior from its operand types is called **operator
overloading**. The strings `"42"` and `"24"` concatenate to `"4224"`. Do not
interpret their contents as numbers. Chains and grouped concatenations use the
existing binary-expression rules.

### Tests

The tester will run a series of tests with `test.lox` files that contain
expressions with the operator `+`.

For example, if `test.lox` contains the following:

```
"hello" + " world!"
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
hello world!
```

The tester will run multiple such tests with randomized expressions, for
example:

|         Input         | Expected output |
| :-------------------: | :-------------: |
| `"hello" + " world!"` | `hello world!`  |
|     `"42" + "24"`     |     `4224`      |
|    `"foo" + "bar"`    |    `foobar`     |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- In this stage, you can assume we will not test for error cases. Runtime errors
  will be introduced in later stages. Each new `+` operation will have two
  string operands, including within chained or grouped concatenations.
- For the book's explanation, see
  [Section 7.2.5: Evaluating binary operators](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-binary-operators).
