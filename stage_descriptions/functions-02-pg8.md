In this stage, you'll add support for declaring, defining and interpreting user defined functions with no arguments in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.3: Function declarations](https://craftinginterpreters.com/functions.html#function-declarations).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with user defined functions with no arguments.

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

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
fun foo() {
  print 7;
}
foo();
```

Expected Output:

```
7
```

Test Case 2:

Input:

```
fun f() {}
f();
```

Expected Output:

```

```

Test Case 3:

Input:

```
fun foo() {}
print foo;
```

Expected Output:

```
<fn foo>
```

Test Case 4:

Input:

```
fun cumulative_sum() {
    var n = 10;  // Fixed value
    var total = 0;
    var i = 1;
    while (i <= n) {
        total = total + i;
        i = i + 1;
    }
    print "The cumulative sum from 1 to 10 is: ";
    print total;
}

cumulative_sum();
```

Expected Output:

```
The cumulative sum from 1 to 10 is:
55
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/print.lox)