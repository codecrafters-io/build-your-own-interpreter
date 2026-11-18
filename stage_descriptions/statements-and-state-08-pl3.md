In this stage, you'll add assignment expressions with `=`.

### Assignment values and associativity

Assignment updates an existing variable's value and also produces the assigned
value. That result lets assignment appear inside `print` or another assignment.

Assignment has lower precedence than the operators already supported and is
right-associative. Thus `a = b = 1` means `a = (b = 1)`, and both variables
receive `1`. Unlike a `var` declaration, assignment does not introduce a new
name. This stage uses previously declared variables on the left side.

### Tests

The tester will run a series of tests with `test.lox` files that contain the
assignment operation.

For example, if `test.lox` contains the following

```
var a;
var b = 2;
var a = b = 1;
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
1
```

The tester varies the values and expressions. These examples show the required
behavior:

Assignment has a value:

Input:

```
var quz;
quz = 1;
print quz;
print quz = 2;
print quz;
```

Stdout:

```
1
2
2
```

Chained assignment:

Input:

```
var quz;
var hello;

quz = hello = 16 + 34 * 92;
print quz;
print hello;
```

Stdout:

```
3144
3144
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- For the book's explanation, see
  [Section 8.4: Assignment](https://craftinginterpreters.com/statements-and-state.html#assignment).
