In this stage, you'll add support for parsing comparison operators: `>`, `<`, `>=` & `<=`.

### Book reference

The code for this stage is implemented in [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).

### Tests

The tester will run a series of tests with `test.lox` files that contain comparison operators, combined with previously introduced tokens.

For example, if `test.lox` contains the following:

```
83 < 99 < 115
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
(< (< 83.0 99.0) 115.0)
```

The tester will assert that the stdout of your program matches the format above.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)