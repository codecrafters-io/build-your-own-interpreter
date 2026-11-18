In this stage, you'll reject a non-number operand for unary `-`.

### Runtime errors

A **runtime error** occurs while evaluating an expression whose syntax is valid.
For example, `-"hello"` has a valid unary-expression shape, but a string cannot
be numerically negated.

Check the operand's evaluated value, including results of nested expressions.
Booleans and `nil` are also invalid for `-`. Stop evaluation, report a
diagnostic on stderr, leave stdout empty, and exit with code 70. Syntax errors
continue to use code 65.

### Tests

The tester will use expressions with invalid operand types, including values
produced by nested expressions.

For example, if `test.lox` contains the following:

```
-"hello world!"
```

The tester will run your program like this. The lines after the command
illustrate a diagnostic on stderr:

```
$ ./your_program.sh evaluate test.lox
Operand must be a number.
[line 1]
```

The tester will run multiple such tests with randomized expressions, for
example:

|       Input        |     Example diagnostic      |
| :----------------: | :-------------------------: |
|      `-"foo"`      | `Operand must be a number.` |
|      `-true`       | `Operand must be a number.` |
| `-("foo" + "bar")` | `Operand must be a number.` |
|      `-false`      | `Operand must be a number.` |

The tester checks for exit code 70 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- The exact diagnostic wording is not checked in this stage. The examples use
  the book's messages.
- For the book's explanation, see
  [Section 7.3: Runtime Errors](https://craftinginterpreters.com/evaluating-expressions.html#runtime-errors).
