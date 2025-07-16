In this stage, you'll add support for evaluating equality operators `==` and `!=`.

### Book reference

The code for this stage is implemented in [Section 7.2.5: Evaluating binary operators](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-binary-operators).

### Tests

The tester will run a series of tests with `test.lox` files that contain expressions with the equality operators `==` and `!=`.

For example, if `test.lox` contains the following:

```
156 == (89 + 67)
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
true
```

The tester will run multiple such tests with randomized expressions, for example:

| Input | Expected output |
| :---: | :-------------: |
| `"hello" == "world"` | `false` |
| `"foo" != "bar"` | `true` |
| `"foo" == "foo"` | `true` |
| `61 == "61"` | `false` |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- In this stage, you can assume we will not test for error cases. Runtime errors will be introduced in later stages. For now, all equality operations will involve only numbers or strings.