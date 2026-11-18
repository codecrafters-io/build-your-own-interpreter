In this stage, you'll enforce the operand types for binary `+` and `-`.

### Operand types for addition and subtraction

- `+` accepts two numbers for addition or two strings for concatenation. Every
  other combination is a runtime error.
- `-` accepts only two numbers. Two strings are invalid for subtraction.

Apply these rules to the evaluated operands, including nested expressions. On a
type error, report a diagnostic on stderr, leave stdout empty, and exit with
code 70. Do not convert mixed types to make an operation succeed.

### Tests

The tester will use expressions with invalid operand types, including values
produced by nested expressions.

For example, if `test.lox` contains the following:

```
17 + "bar"
```

The tester will run your program like this. The lines after the command
illustrate a diagnostic on stderr:

```
$ ./your_program.sh evaluate test.lox
Operands must be two numbers or two strings.
[line 1]
```

The tester will run multiple such tests with randomized expressions, for
example:

|      Input      |               Example diagnostic               |
| :-------------: | :--------------------------------------------: |
| `"foo" + true`  | `Operands must be two numbers or two strings.` |
|   `42 - true`   |          `Operands must be numbers.`           |
| `true + false`  | `Operands must be two numbers or two strings.` |
| `"foo" - "bar"` |          `Operands must be numbers.`           |

The tester checks for exit code 70 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- The exact diagnostic wording is not checked in this stage. The examples use
  the book's messages.
- For the book's explanation, see
  [Section 7.3: Runtime Errors](https://craftinginterpreters.com/evaluating-expressions.html#runtime-errors).
