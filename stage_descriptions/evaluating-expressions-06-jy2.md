In this stage, you'll extend binary evaluation to numeric addition (`+`) and
subtraction (`-`).

### Addition and subtraction

Use the same left-to-right operand evaluation and runtime number formatting as
multiplication and division.

Your parsed tree already distinguishes subtraction from unary negation and gives
`*` and `/` higher precedence. Evaluating that structure must preserve both
rules, including when operators appear inside parentheses.

### Tests

The tester will run a series of tests with `test.lox` files that contain
expressions with the arithmetic operators `+` and `-`.

For example, if `test.lox` contains the following:

```
20 + 74 - (-(14 - 33))
```

The tester will run your program like this:

```
$ ./your_program.sh evaluate test.lox
75
```

The tester will run multiple such tests with randomized expressions, for
example:

|          Input           | Expected output |
| :----------------------: | :-------------: |
|        `70 - 65`         |       `5`       |
|        `69 - 93`         |      `-24`      |
|       `10.40 - 2`        |      `8.4`      |
| `23 + 28 - (-(61 - 99))` |      `13`       |

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- In this stage, you can assume we will not test for error cases. Runtime errors
  will be introduced in later stages. Each operation will have two numeric
  operands.
- For the book's explanation, see
  [Section 7.2.5: Evaluating binary operators](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-binary-operators).
