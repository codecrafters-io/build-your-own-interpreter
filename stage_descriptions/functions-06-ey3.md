In this stage, you'll treat functions as values that can be stored in variables,
passed as arguments, and returned from other functions.

### First-class functions

This is called **first-class function** support. A **higher-order function**
takes a function as an argument or returns one.

The callee can now be any expression that produces a function, including another
call: `makeGreeter()` returns a function, and `makeGreeter()("Bob")` immediately
calls that returned function.

Returning `greet` returns the function itself. Writing `greet(...)` calls it and
returns the call's result. Capturing variables from an enclosing call is covered
in the closures stage.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with higher-order functions.

For example, if `test.lox` contains the following

```
fun makeGreeter() {
  fun greet(name) {
    print "Hello " + name;
  }
  return greet;
}

var sayHello = makeGreeter();
sayHello("Bob");
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Hello Bob
```

The tester varies the values and expressions. These examples show the required
behavior:

Calling a function returned by another call:

Input:

```
fun returnArg(arg) {
  return arg;
}

fun returnFunCallWithArg(func, arg) {
  return returnArg(func)(arg);
}

fun printArg(arg) {
  print arg;
}

returnFunCallWithArg(printArg, "foo");
```

Stdout:

```
foo
```

Passing a function as an argument:

Input:

```
fun square(x) {
  return x * x;
}

// This higher-order function applies a
// function N times to a starting value x.
fun applyTimesN(N, f, x) {
  var i = 0;
  while (i < N) {
    x = f(x);
    i = i + 1;
  }
  return x;
}

// 6 is squared once
print applyTimesN(1, square, 6);
// 6 is squared twice
print applyTimesN(2, square, 6);
// 6 is squared thrice
print applyTimesN(3, square, 6);
```

Stdout:

```
36
1296
1679616
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/local_recursion.lox)
- For the book's explanation, see
  [Section 10.6: Local functions and Closures](https://craftinginterpreters.com/functions.html#local-functions-and-closures).
