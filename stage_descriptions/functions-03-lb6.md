In this stage, you'll add parameters and arguments to user-defined functions.

### Binding arguments to parameters

**Parameters** are names listed in a declaration, such as `a` in `fun foo(a)`.
**Arguments** are expressions supplied at a call, such as `10` in `foo(10)`.

Use commas between parameters and between arguments. Evaluate argument
expressions from left to right in the caller's scope. Their values become the
corresponding parameter bindings for that call. Parameters are local to the
function call, and changing a parameter does not reassign a caller's variable.

This stage uses matching argument counts. Handling too many or too few arguments
comes later.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with user-defined functions with arguments.

For example, if `test.lox` contains the following

```
fun foo(a) { print a; }
foo(10);
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
10
```

The tester varies the values and expressions. These examples show the required
behavior:

Multiple parameters:

Input:

```
fun f3(a, b, c) { print a + b + c; }
f3(24, 24, 24);
```

Stdout:

```
72
```

A longer parameter list:

Input:

```
fun f8(a, b, c, d, e, f, g, h) { print a - b + c * d + e - f + g - h; }
f8(51, 51, 51, 51, 51, 51, 51, 51);
```

Stdout:

```
2601
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/parameters.lox)
- For the book's explanation, see
  [Section 10.3: Function declarations](https://craftinginterpreters.com/functions.html#function-declarations).
