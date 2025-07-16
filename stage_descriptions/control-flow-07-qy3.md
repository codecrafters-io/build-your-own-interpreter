In this stage, you'll add support for `while` statements in your interpreter. `while` statements are used to execute a block of code repeatedly while a condition is true.

### Book reference

The code for this stage is implemented in [Section 9.4: While loops](https://craftinginterpreters.com/control-flow.html#while-loops).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with `while` statements.

For example, if `test.lox` contains the following

```
var foo = 0;
while (foo < 3) print foo = foo + 1;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
1
2
3
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var foo = 0;
while (foo < 3) print foo = foo + 1;
```

Expected Output:

```
1
2
3
```

Test Case 2:

Input:

```
var quz = 0;
while (quz < 3) {
  print quz;
  quz = quz + 1;
}
```

Expected Output:

```
0
1
2
```

Test Case 3:

Input:

```
while (false) {
  print "should not print";
}

var product = 1;
var i = 1;

while (i <= 5) {
  product = product * i;
  i = i + 1;
}

print "Product of numbers 1 to 5: "; print product;
```

Expected Output:

```
Product of numbers 1 to 5:
120
```

Test Case 4:

Input:

```
var n = 10;
var fm = 0;
var fn = 1;
var index = 0;

while (index < n) {
  print fm;
  var temp = fm;
  fm = fn;
  fn = temp + fn;
  index = index + 1;
}
```

Expected Output:

```
0
1
1
2
3
5
8
13
21
34
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/while/syntax.lox)