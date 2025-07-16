In this stage, you'll add support for the `else-if` statement in your interpreter. The `else-if` statement is used to conditionally execute statements when the `if` condition is false.

### Book reference

The code for this stage is implemented in [Section 9.2: Conditional execution](https://craftinginterpreters.com/control-flow.html#conditional-execution).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with `if` statements.

For example, if `test.lox` contains the following

```
if (false) print "if branch"; else if (false) print "else-if branch";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
if (true) print "if branch"; else if (false) print "else-if branch";
```

Expected Output:

```
if branch
```

Test Case 2:

Input:

```
if (true) {
  print "hello";
} else if (true) print "hello";

if (true) print "hello"; else if (true) {
  print "hello";
}
```

Expected Output:

```
hello
hello
```

Test Case 3:

Input:

```
var age = 88;
var stage = "unknown";
if (age < 18) { stage = "child"; }
else if (age >= 18) { stage = "adult"; }
else if (age >= 65) { stage = "senior"; }
else if (age >= 100) { stage = "centenarian"; }
print stage;
```

Expected Output:

```
adult
```

Test Case 4:

Input:

```
var age = 67;

var isAdult = age >= 18;
if (isAdult) { print "eligible for voting: true"; }
else { print "eligible for voting: false"; }

if (age < 16) { print "eligible for driving: false"; }
else if (age < 18) { print "eligible for driving: learner's permit"; }
else { print "eligible for driving: full license"; }

if (age < 21) { print "eligible for drinking (US): false"; }
else { print "eligible for drinking (US): true"; }
```

Expected Output:

```
eligible for voting: true
eligible for driving: full license
eligible for drinking (US): true
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/else.lox)