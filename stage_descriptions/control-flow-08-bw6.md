In this stage, you'll add support for the `for` statement in your interpreter. The `for` statement executes a block of code repeatedly using a "initializer" clause, a "condition" clause and an "increment" clause.

### Book reference

The code for this stage is implemented in [Section 9.5: For Loops](https://craftinginterpreters.com/control-flow.html#for-loops).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with `if` statements.

For example, if `test.lox` contains the following

```
for (var baz = 0; baz < 3;) print baz = baz + 1;
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
for (var baz = 0; baz < 3;) print baz = baz + 1;
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
for (var world = 0; world < 3; world = world + 1) {
  print world;
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
var world = 0;
for (; world < 2; world = world + 1) print world;

for (var foo = 0; foo < 2;) {
  print foo;
  foo = foo + 1;
}
```

Expected Output:

```
0
1
0
1
```

Test Case 4:

Input:

```
var quz = "after";
{
  var quz = "before";

  for (var quz = 0; quz < 1; quz = quz + 1) {
    print quz;
    var quz = -1;
    print quz;
  }
}

{
  for (var quz = 0; quz > 0; quz = quz + 1) {}

  var quz = "after";
  print quz;

  for (quz = 0; quz < 1; quz = quz + 1) {
    print quz;
  }
}
```

Expected Output:

```
0
-1
after
0
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/for/syntax.lox)