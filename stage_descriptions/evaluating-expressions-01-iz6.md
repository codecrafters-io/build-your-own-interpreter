Your parser can describe an expression's structure. This extension makes the
interpreter evaluate that expression to obtain its value. In this stage, you'll
add `evaluate` for the literals `true`, `false`, and `nil`.

### Evaluating literal nodes

Build on your scanner and the parser from the Parsing Expressions extension. A
**tree-walk interpreter** evaluates an AST by following its nodes and carrying
out the operation each node represents. A literal node is the simplest case: its
result is the value it holds.

These are **runtime values**, the values the Lox program operates on as it runs.
Keep booleans and `nil` distinct from strings that happen to contain the same
text.

### The `evaluate` command

The `evaluate` command reads a file containing an expression and prints its
resulting value to stdout. Keep `parse` and `tokenize` available, but do not
print their AST or token output when running `evaluate`.

For context, arithmetic evaluation will eventually turn this source into a
number. Arithmetic is not required in this stage:

```
2 + 3
```

The `evaluate` command will return the following:

```
$ ./your_program.sh evaluate test.lox
5
```

This output format matches the spec in the
[book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox).

For the same file, here's what the output from `parse` would've been:

```
$ ./your_program.sh parse test.lox
(+ 2.0 3.0)
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
$ ./your_program.sh evaluate test.lox
true
```

The required outputs are:

|  Input  | Expected output |
| :-----: | :-------------: |
| `true`  |     `true`      |
| `false` |     `false`     |
|  `nil`  |      `nil`      |

Print the value as `true`, `false`, or `nil`, followed by a newline, and exit
with code 0. These spellings are required even if your implementation language
displays its corresponding values differently.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/expressions/evaluate.lox)
- For the book's explanation, see
  [Section 7.2.1: Evaluating Literals](https://craftinginterpreters.com/evaluating-expressions.html#evaluating-literals).
