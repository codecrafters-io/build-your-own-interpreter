In this stage, you'll apply runtime type checks to `*` and `/`.

### Numeric operand requirements

Both operands must evaluate to numbers. Strings, booleans, and `nil` are
invalid, even if your implementation language can convert them to numbers or
repeat a string with `*`.

On a type error, stop evaluation, report the error on stderr, leave stdout
empty, and exit with code 70. Keep successful numeric operations unchanged.

### Tests

The tester will use expressions with invalid operand types, including values
produced by nested expressions.

For example, if `test.lox` contains the following:

```
"foo" / 42
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

|       Input       |     Example diagnostic      |
| :---------------: | :-------------------------: |
|   `"foo" * 42`    | `Operands must be numbers.` |
|    `true / 2`     | `Operands must be numbers.` |
| `("foo" * "bar")` | `Operands must be numbers.` |
|  `false / true`   | `Operands must be numbers.` |

The tester checks for exit code 70 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- The exact diagnostic wording is not checked in this stage. The examples use
  the book's messages.
- For the book's explanation, see
  [Section 7.3: Runtime Errors](https://craftinginterpreters.com/evaluating-expressions.html#runtime-errors).
