This extension turns expression evaluation into programs that produce output and
remember values. It builds on your scanner, parser, and evaluator from the
earlier extensions. In this stage, you'll add `run` and execute a single `print`
statement.

### Print statements and the `run` command

A **statement** performs an action. An expression produces a value, and `print`
uses that value to produce output. Its syntax is `print <expression>;`,
including the final semicolon.

The `run` command executes statements from the file. For `print`, evaluate its
expression and write the value followed by a newline to stdout, using the
formatting from `evaluate`. Print no token listing or AST. Keep `evaluate`
available for a single expression without a semicolon.

### Tests

The tester will run a series of tests with `test.lox` files that contain the
`print` statement.

For example, if `test.lox` contains the following

```
print "Hello, World!";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Hello, World!
```

The tester varies the values and expressions. These examples show the required
behavior:

|          Input           | Expected output |
| :----------------------: | :-------------: |
| `print "Hello, World!";` | `Hello, World!` |
|       `print 42;`        |      `42`       |
|      `print true;`       |     `true`      |
|     `print 12 + 24;`     |      `36`       |

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

The tester will also verify that your program correctly handles invalid print
statements. For example:

```
print;
```

The tester will assert that the exit code is 65, signifying a syntax error.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- `print;` is invalid because it has no expression. A missing final semicolon is
  also a syntax error.
- For the book's explanation, see
  [Section 8.1: Statements](https://craftinginterpreters.com/statements-and-state.html#statements).
