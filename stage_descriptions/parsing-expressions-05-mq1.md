In this stage, you'll add support for parsing the negation operator (`-`) & the logical not operator (`!`).

### Book reference

The code for this stage is implemented in [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).

### Tests

The tester will run a series of tests with `test.lox` files that contain unary operators, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
!true
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(! true)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)