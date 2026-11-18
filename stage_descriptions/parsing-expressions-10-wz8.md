In this stage, you'll make `parse` reject malformed expressions.

### Syntax errors

A **syntax error** means that tokens do not form a valid expression, even when
each token is individually recognizable. For example, `+` needs operands and an
opening parenthesis needs a matching closing parenthesis.

Report the error on stderr, print no AST or token output to stdout, and exit
with code 65. Lexical errors, such as an unterminated string, must also prevent
a successful parse. Valid expressions continue to exit with code 0.

### Tests

The tester will run a series of tests with `test.lox` files that contain syntax
errors.

For example, if `test.lox` contains the following:

```
(72 +)
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
[line 1] Error at ')': Expect expression.
```

The message above is an example of stderr output. The tester checks for exit
code 65 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- The tester does not check the exact error message in this stage.
- For the book's explanation, see
  [Section 6.3: Syntax Errors](https://craftinginterpreters.com/parsing-expressions.html#syntax-errors).
