In this stage, you'll support `return <expression>;` inside a function.

### Returning a value

It evaluates the expression, ends the current function call, and makes that
value the result of the call.

A return exits the function even when it occurs inside a nested block,
conditional, or loop. No later statement in that call runs. A bare `return;`
produces `nil`, as does reaching the end of a function without returning a
value.

Functions can call themselves, a behavior called **recursion**. Each call has
its own parameters and locals, and a return ends only that call. The Fibonacci
example below relies on those independent calls.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with return statements in functions.

For example, if `test.lox` contains the following

```
fun foo() { return 10; }
print foo();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
10
```

The tester varies the values and expressions. These examples show the required
behavior:

Recursive calls return independent results:

Input:

```
fun fib(n) {
  if (n < 2) return n;
  return fib(n - 2) + fib(n - 1);
}

var start = clock();
print fib(10) == 55;
print (clock() - start) < 5; // 5 seconds
```

Stdout:

```
true
true
```

Falling through returns nil:

Input:

```
fun f() {
  while (!true) return "ok";
}

print f();
```

Stdout:

```
nil
```

A bare return skips the remaining body:

Input:

```
fun f() {
  return;
  print "bad";
}

print f();
```

Stdout:

```
nil
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/local_recursion.lox)
- For the book's explanation, see
  [Section 10.5: Return Statements](https://craftinginterpreters.com/functions.html#return-statements).
