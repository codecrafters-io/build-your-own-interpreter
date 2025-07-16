In this stage, you'll add support for the `if` statement in your interpreter. The `if` statement is used to conditionally execute statements based on a boolean condition.

### Book reference

The code for this stage is implemented in [Section 9.2: Conditional execution](https://craftinginterpreters.com/control-flow.html#conditional-execution).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with `if` statements.

For example, if `test.lox` contains the following

```
if (true) print "good";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
good
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
if (true) print "bar";
```

Expected Output:

```
bar
```

Test Case 2:

Input:

```
if (true) {
  print "block body";
}
```

Expected Output:

```
block body
```

Test Case 3:

Input:

```
var a = false;
if (a = true) {
  print (a == true);
}
```

Expected Output:

```
true
```

Test Case 4:

Input:

```
var stage = "unknown";
var age = 50;
if (age < 18) { stage = "child"; }
if (age >= 18) { stage = "adult"; }
print stage;

var isAdult = age >= 18;
if (isAdult) { print "eligible for voting: true"; }
if (!isAdult) { print "eligible for voting: false"; }
```

Expected Output:

```
adult
eligible for voting: true
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/if.lox)