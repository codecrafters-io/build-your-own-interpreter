In this stage, you'll parse multiplication (`*`) and division (`/`).

### Binary expressions

These are **binary operators**, with a left operand and a right operand. Print
each binary expression as `(<operator> <left> <right>)`.

The AST must record which operation belongs inside another. **Precedence**
determines which operators bind more tightly. Unary `-` and `!` bind more
tightly than `*` and `/`, so `-2 * 3` prints as `(* (- 2.0) 3.0)`.

Operators with equal precedence also need an **associativity** rule.
Multiplication and division associate to the left: `8 / 4 / 2` groups as
`(8 / 4) / 2`. Explicit parentheses can change that grouping.

### Tests

The tester will run a series of tests with `test.lox` files that contain
multiplication and division, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
16 * 38 / 58
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(/ (* 16.0 38.0) 58.0)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's explanation, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
