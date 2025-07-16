In this stage, you'll add support for evaluating expressions inside parentheses.

### Book reference

The code for this stage is implemented in [Section 7.2.2: Evaluating parentheses](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-parentheses).

### Tests

The tester will test your program using a `test.lox` file that contains an expression with parentheses.

For example, if `test.lox` contains the following:

```
("hello world!")
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
hello world!
```

The tester will run multiple such tests with randomized expressions, for example:

| Input | Expected output |
| :---: | :-------------: |
| `("hello world!")` | `hello world!` |
| `(true)` | `true` |
| `(10.40)` | `10.4` |
| `((false))` | `false` |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- String literals & number literals must be formatted using the same rules as the previous stage.