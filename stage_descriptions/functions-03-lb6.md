In this stage, you'll add support for declaring, defining and interpreting user defined functions with arguments in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.3: Function declarations](https://craftinginterpreters.com/functions.html#function-declarations).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with user defined functions with arguments.

For example, if `test.lox` contains the following

```
fun foo(a) { print a; }
foo(10);
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
fun f1(a) {
  print a;
}
f1(76);
```

Expected Output:

```
76
```

Test Case 2:

Input:

```
fun f3(a, b, c) { print a + b + c; }
f3(24, 24, 24);
```

Expected Output:

```
72
```

Test Case 3:

Input:

```
fun f8(a, b, c, d, e, f, g, h) { print a - b + c * d + e - f + g - h; }
f8(51, 51, 51, 51, 51, 51, 51, 51);
```

Expected Output:

```
2601
```

Test Case 4:

Input:

```
fun calculateGrade(score, bonus) {
  var finalScore = score + bonus;

  if (finalScore >= 90) {
    print "A";
  } else if (finalScore >= 80) {
    print "B";
  } else if (finalScore >= 70) {
    print "C";
  } else if (finalScore >= 60) {
    print "D";
  } else {
    print "F";
  }
}

var score = 81;
var bonus = 3;
print "Grade for given score is: ";
calculateGrade(score, bonus);
```

Expected Output:

```
Grade for given score is:
B
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/parameters.lox)