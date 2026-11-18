In this stage, you'll reject invalid control-flow syntax.

### Declarations and statement bodies

Your parser already reports malformed expressions. It must now also enforce
where declarations and statements are allowed.

The body of `if`, `else`, `while`, or `for` must be a statement. A bare `var`
declaration cannot occupy that position. A block is a statement and can contain
declarations, so `if (true) { var foo; }` is valid.

In a `for` header, the initializer can be a variable declaration, an expression,
or empty. The condition and increment can be expressions or empty. A block such
as `{}` cannot replace any clause.

Report a diagnostic on stderr and exit with code 65. These invalid programs
produce no stdout. The tester does not require a particular diagnostic message.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with syntactic errors.

For example, if `test.lox` contains the following

```
for (;;) var foo;
```

The tester will run your program like this. The shown diagnostic is on stderr:

```
$ ./your_program.sh run test.lox
[line 1] Error at 'var': Expect expression.
```

The tester varies the values and expressions. These examples show the required
behavior:

A bare declaration cannot be an else-branch:

Input:

```
if (true) "ok"; else var foo;
```

Example stderr:

```
[line 1] Error at 'var': Expect expression.
```

A block cannot be the loop condition:

Input:

```
for (var a = 1; {}; a = a + 1) {}
```

Example stderr:

```
[line 1] Error at '{': Expect expression.
[line 1] Error at ')': Expect ';' after expression.
```

A block cannot be the increment:

Input:

```
for (var a = 1; a < 2; {}) {}
```

Example stderr:

```
[line 1] Error at '{': Expect expression.
```

A block cannot be the initializer:

Input:

```
for ({}; a < 2; a = a + 1) {}
```

Example stderr:

```
[line 1] Error at '{': Expect expression.
[line 1] Error at ')': Expect ';' after expression.
```

The tester checks for exit code 65 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/dangling_else.lox)
- The diagnostics above illustrate possible messages. Reporting additional
  syntax errors during recovery is optional.
- For the book's explanation, see
  [Section 9.5: For Loops](https://craftinginterpreters.com/control-flow.html#for-loops).
