In this stage you'll implement support for the `parse` command and handle parsing `true`, `false`, and `nil` literals.

### Book reference

Before starting this stage, make sure you've read the [Representing Code](https://craftinginterpreters.com/representing-code.html) chapter (chapter 5). The
code covered in that chapter (`AstPrinter`) will be required to generate the output tested in this stage.

The code for this stage is implemented in [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).

### The `parse` command

In the previous stages, the tester used the `tokenize` command to test your scanner implementation. In this extension, the tester will need to test
your parser implementation, so it'll use a different command instead: `parse`.

The `parse` command accepts a path to a file (`test.lox` for example) and prints out the AST representation of the file to stdout.

For example, if `test.lox` contains the following:

```
2 + 3
```

The `parse` command will return the following:

```
$ ./your_program.sh parse test.lox
(+ 2.0 3.0)
```

This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox).

For the same file, here's what the output from `tokenize` would've been:

```
$ ./your_program.sh tokenize test.lox
NUMBER 2 2.0
PLUS + null
NUMBER 3 3.0
EOF  null
```

### Tests

The tester will run a series of tests with `test.lox` files that contain the boolean values `true` & `false`, and the `nil` literal.

For example, if `test.lox` contains the following:

```
true
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
true
```

The tester will assert that the stdout of your program matches the format above.

Here's a list of the tokens you'll need to parse in this stage:

| Input | Expected output |
| :---: | :-------------: |
| `true` | `true` |
| `false` | `false` |
| `nil` | `nil` |

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)