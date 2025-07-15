In this stage, you'll add support for the `else` statement in your interpreter. The `else` statement is used to conditionally execute statements when the `if` condition is false.

### Book reference

The code for this stage is implemented in [Section 9.2: Conditional execution](https://craftinginterpreters.com/control-flow.html#conditional-execution).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with `if` statements.

For example, if `test.lox` contains the following

```
if (true) print "if branch"; else print "else branch";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
if branch
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
if (true) print "if branch"; else print "else branch";
```

Expected Output:

```
if branch
```

Test Case 2:

Input:

```
var age = 21;
if (age > 18) print "adult"; else print "child";
```

Expected Output:

```
adult
```

Test Case 3:

Input:

```
if (false) {
  print "if block";
} else print "else statement";

if (false) print "if statement"; else {
  print "else block";
}
```

Expected Output:

```
else statement
else block
```

Test Case 4:

Input:

```
var celsius = 67;
var fahrenheit = 0;
var isHot = false;

{
  fahrenheit = celsius * 9 / 5 + 32;
  print celsius; print fahrenheit;

  if (celsius > 30) {
    isHot = true;
    print "It's a hot day. Stay hydrated!";
  } else {
    print "It's cold today. Wear a jacket!";
  }

  if (isHot) { print "Remember to use sunscreen!"; }
}
```

Expected Output:

```
67
152.6
It's a hot day. Stay hydrated!
Remember to use sunscreen!
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/else.lox)