In this stage, you'll add functions defined in Lox source with
`fun <name>() { <body> }`.

### Function declarations and calls

This first form takes no arguments.

Executing the declaration binds the name to a function value without running the
body. Calling that value with `()` executes the body. Each call has its own
local variables, so repeated calls start with fresh local state. Reaching the
end of the body returns `nil`.

A function name by itself evaluates to the function value. Printing it uses
`<fn name>`, with the declared name in place of `name`. An empty body is valid,
and calling it as an expression statement prints nothing.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with user-defined functions with no arguments.

For example, if `test.lox` contains the following

```
fun bar() { print 10; }
bar();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
10
```

The tester varies the values and expressions. These examples show the required
behavior:

An empty function body:

Input:

```
fun f() {}
f();
```

Stdout is empty.

Printing the function value:

Input:

```
fun foo() {}
print foo;
```

Stdout:

```
<fn foo>
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/print.lox)
- For the book's explanation, see
  [Section 10.3: Function declarations](https://craftinginterpreters.com/functions.html#function-declarations).
