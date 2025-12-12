In this stage, you'll add support for higher order functions in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.6: Local functions and Closures](https://craftinginterpreters.com/functions.html#local-functions-and-closures).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with higher order functions.

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

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

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

Expected Output:

```
Hello Bob
```

Test Case 2:

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

Expected Output:

```
foo
```

Test Case 3:

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

Expected Output:

```
36
1296
1679616
```

Test Case 4:

Input:

```
fun makeFilter() {
  fun filter(n) {
    if (n < 42) {
      return false;
    }
    return true;
  }
  return filter;
}

// This function applies a function to a list of numbers
fun applyToNumbers(f, count) {
  var n = 0;
  while (n < count) {
    if (f(n)) {
      print n;
    }
    n = n + 1;
  }
}

var greaterThanX = makeFilter();

print "Numbers >= 42:";
applyToNumbers(greaterThanX, 42 + 5);
```

Expected Output:

```
Numbers >= 42:
42
43
44
45
46
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/local_recursion.lox)
