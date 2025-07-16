In this stage, you'll add support for evaluating unary operators `-` and `!`.

### Book reference

The code for this stage is implemented in [Section 7.2.3: Evaluating unary expressions](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-unary-expressions).

### Tests

The tester will run a series of tests with `test.lox` files that contain expressions with unary operators.

For example, if `test.lox` contains the following:

```
-(73)
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
-73
```

The tester will run multiple such tests with randomized expressions, for example:

| Input | Expected output |
| :---: | :-------------: |
| `-73` | `-73` |
| `!true` | `false` |
| `!10.40` | `false` |
| `!((false))` | `true` |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- For truthyness and falsyness, we will follow the convention introduced in the book, where `false` and `nil` are falsy, and everything else is truthy.