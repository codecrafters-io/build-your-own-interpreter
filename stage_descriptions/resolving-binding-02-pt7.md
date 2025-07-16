In this stage, you'll add support for detecting invalid self-initialization of variables. This means catching cases where a variable tries to use itself in its own initializer before it has been fully defined.

### Book reference

The code for this stage is implemented in [Section 11.5: Resolution Errors](https://craftinginterpreters.com/resolving-and-binding.html#resolution-errors).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with variable self-initialization.

For example, if `test.lox` contains the following:

```
var a = "value";
var a = a;      // This is allowed in global scope
print a;        // Should print "value"
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
value
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var a = "outer";
{
  var a = a;    // Error: Can't read local variable in its own initializer
}
```

Expected Output:

```
[line 3] Error at 'a': Can't read local variable in its own initializer.
```

Test Case 2:

Input:

```
fun returnArg(arg) {
  return arg;
}

var b = "global";
{
  var a = "first";
  var b = returnArg(b);    // Error: Can't read local variable in its own initializer
  print b;
}

var b = b + " updated";
print b;
```

Expected Output:

```
[line 8] Error at 'b': Can't read local variable in its own initializer.
```

Test Case 3:

Input:

```
fun outer() {
  var a = "outer";

  fun inner() {
    var a = a;    // Error: Can't read local variable in its own initializer
    print a;
  }

  inner();
}

outer();
```

Expected Output:

```
[line 5] Error at 'a': Can't read local variable in its own initializer.
```

The tester will assert that for valid global self-initialization, the exit code should be 0. For invalid local self-initialization, the program should exit with code 65 and print an appropriate error message.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/variable/use_local_in_initializer.lox)
- Self-initialization is allowed in global scope but not in local scopes
- The error should be detected at compile time, not runtime
- Error messages should be written to stderr, but the exact error message is not checked.