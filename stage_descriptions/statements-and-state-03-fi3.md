In this stage, you'll support **expression statements**: an expression followed
by a semicolon.

### Values and side effects

Evaluate the expression and discard its resulting value, producing no automatic
output.

Such statements will be useful for **side effects**, changes such as updating a
variable or calling a function that prints. The expressions used here do not
need side effects to be valid.

Discarding a result must not skip evaluation. A runtime error still stops the
program with exit code 70. Output from earlier successful `print` statements
remains on stdout, and the error diagnostic goes to stderr. Later statements
must not run.

### Tests

The tester will run a series of tests with `test.lox` files that contain
expression statements combined with `print` statements.

For example, if `test.lox` contains the following

```
"foo" + "bar";
print "baz";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
baz
```

The tester varies the values and expressions. These examples show the required
behavior:

Evaluation still detects errors:

Input:

```
print "the expression below is invalid";
49 + "baz";
print "this should not be printed";
```

Stdout:

```
the expression below is invalid
```

Example stderr:

```
Operands must be two numbers or two strings.
[line 2]
```

Successful programs exit with code 0. Programs with a runtime error exit with
code 70. The tester checks stdout and the exit code. Diagnostic wording is not
checked.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- For the book's explanation, see
  [Section 8.1: Statements](https://craftinginterpreters.com/statements-and-state.html#statements).
