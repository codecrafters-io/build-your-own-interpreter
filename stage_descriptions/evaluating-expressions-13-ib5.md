In this stage, you'll enforce numeric operands for `<`, `>`, `<=`, and `>=`.

### Operand types for ordering

Lox's ordering comparisons accept only two numbers. Equality can compare
different types, but that does not make those types valid for ordering.

On an invalid operand, stop evaluation, report a diagnostic on stderr, leave
stdout empty, and exit with code 70. For example, a left-associated chain such
as `1 < 2 < 3` parses successfully but fails at runtime: its second comparison
receives the boolean result of `1 < 2`.

### Tests

The tester will use expressions with invalid operand types, including values
produced by nested expressions.

For example, if `test.lox` contains the following:

```
17 > "bar"
```

The tester will run your program like this. The lines after the command
illustrate a diagnostic on stderr:

```
$ ./your_program.sh evaluate test.lox
Operands must be numbers.
[line 1]
```

The tester will run multiple such tests with randomized expressions, for
example:

|         Input          |     Example diagnostic      |
| :--------------------: | :-------------------------: |
|    `"foo" < false`     | `Operands must be numbers.` |
|       `true < 2`       | `Operands must be numbers.` |
| `("foo" + "bar") < 42` | `Operands must be numbers.` |
|     `false > true`     | `Operands must be numbers.` |

The tester checks for exit code 70 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- The exact diagnostic wording is not checked in this stage. The examples use
  the book's messages.
- For the book's explanation, see
  [Section 7.3: Runtime Errors](https://craftinginterpreters.com/evaluating-expressions.html#runtime-errors).
