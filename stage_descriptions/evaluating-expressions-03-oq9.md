In this stage, you'll evaluate grouping nodes, the nodes your parser creates for
parenthesized expressions.

### Evaluating grouped expressions

A group's value is the value of the expression it contains. This also applies to
nested groups. The `group` label and parentheses belong to the AST's printed
representation and do not appear in the evaluated result.

### Tests

The tester will test your program using a `test.lox` file that contains an
expression with parentheses.

For example, if `test.lox` contains the following:

```
("hello world!")
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
hello world!
```

The tester will run multiple such tests with randomized expressions, for
example:

|       Input        | Expected output |
| :----------------: | :-------------: |
| `("hello world!")` | `hello world!`  |
|      `(true)`      |     `true`      |
|     `(10.40)`      |     `10.4`      |
|    `((false))`     |     `false`     |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- String literals & number literals must be formatted using the existing
  runtime-value formatting rules.
- For the book's explanation, see
  [Section 7.2.2: Evaluating parentheses](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-parentheses).
