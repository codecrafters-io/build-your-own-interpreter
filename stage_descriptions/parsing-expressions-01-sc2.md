Your scanner identifies tokens, but a token list does not show how the pieces of
an expression fit together. This extension adds **parsing**, which groups tokens
according to the language's grammar, its rules for valid program structure.

In this stage, you'll add the `parse` command for the literals `true`, `false`,
and `nil`.

### Before you start

Before starting this stage, make sure you've read the
[Representing Code](https://craftinginterpreters.com/representing-code.html)
chapter (chapter 5). The chapter's `AstPrinter` demonstrates the output format
used here. You need your completed scanner. You can choose your own
representation and printing code.

### Representing an expression

An **expression** is a piece of code that produces a value, such as `true` or
`2 + 3`. An **abstract syntax tree (AST)** records its structure. Each node
represents a part of the expression. A literal node holds a value, and an
operation node connects to the expressions it operates on.

The literals `true`, `false`, and `nil` are the simplest expressions: each
consists of a single value. `true` and `false` are booleans, and `nil`
represents the absence of a value.

The printed AST puts an operator before its operands, the expressions that
supply its values. For example, `(+ 2.0 3.0)` describes adding two number
literals. It does not calculate their sum. Arithmetic is shown below to explain
the format and comes in later stages.

### The `parse` command

The `parse` command reads a file containing an expression and prints its AST
representation to stdout. Keep `tokenize` available with its existing behavior.
When running `parse`, omit the token listing and its `EOF` marker.

For example, if `test.lox` contains the following:

```
2 + 3
```

The `parse` command will return the following:

```
$ ./your_program.sh parse test.lox
(+ 2.0 3.0)
```

This output format matches the spec in the
[book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox).

For the same file, here's what the output from `tokenize` would've been:

```
$ ./your_program.sh tokenize test.lox
NUMBER 2 2.0
PLUS + null
NUMBER 3 3.0
EOF  null
```

### Tests

The tester will use files containing one of the literals `true`, `false`, or
`nil`.

For example, if `test.lox` contains the following:

```
true
```

The tester will run your program like this:

```
$ ./your_program.sh parse test.lox
true
```

Print the literal's spelling followed by a newline, and exit with code 0.

Here's a list of the tokens you'll need to parse in this stage:

|  Input  | Expected output |
| :-----: | :-------------: |
| `true`  |     `true`      |
| `false` |     `false`     |
|  `nil`  |      `nil`      |

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/parse.lox)
- For the book's parsing approach, see
  [Section 6.2: Recursive Descent Parsing](https://craftinginterpreters.com/parsing-expressions.html#recursive-descent-parsing).
