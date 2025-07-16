In this stage, you'll add support for assigning values to variables using the `=` operator. You need to only support variables that have already been declared on the left side of the assignment.
Note that assignment is right associative, so `a = b = 1` is equivalent to `a = (b = 1)`.

### Book reference

The code for this stage is implemented in [Section 8.4: Assignment](https://craftinginterpreters.com/statements-and-state.html#assignment).

### Tests

The tester will run a series of tests with `test.lox` files that contain the assignment operation.

For example, if `test.lox` contains the following

```
var a;
var b = 2;
var a = b = 1;
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
1
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var quz;
quz = 1;
print quz;
print quz = 2;
print quz;
```

Expected Output:

```
1
2
2
```

Test Case 2:

Input:

```
var hello = 93;
var bar = 93;
bar = hello;
hello = bar;
print hello + bar;
```

Expected Output:

```
186
```

Test Case 3:

Input:

```
var quz;
var hello;

quz = hello = 16 + 34 * 92;
print quz;
print hello;
```

Expected Output:

```
3144
3144
```

Test Case 4:

Input:

```
var hello = 65;
var baz;
var quz;

hello = baz = quz = hello * 2;
print hello;
print baz;
print baz;
```

Expected Output:

```
130
130
130
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)