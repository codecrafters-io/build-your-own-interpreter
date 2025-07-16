In this stage, you'll add support for return statements in functions in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.5: Return Statements](https://craftinginterpreters.com/functions.html#return-statements).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with return statements in functions.

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

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
fun fib(n) {
  if (n < 2) return n;
  return fib(n - 2) + fib(n - 1);
}

var start = clock();
print fib(32) == 2178309;
print (clock() - start) < 5; // 5 seconds
```

Expected Output:

```
true
true
```

Test Case 2:

Input:

```
fun f() {
  if (false) return "no"; else return "ok";
}

print f();
```

Expected Output:

```
ok
```

Test Case 3:

Input:

```
fun f() {
  while (!true) return "ok";
}

print f();
```

Expected Output:

```
nil
```

Test Case 4:

Input:

```
fun f() {
  return;
  print "bad";
}

print f();
```

Expected Output:

```
nil
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/local_recursion.lox)