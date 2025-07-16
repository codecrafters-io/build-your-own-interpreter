In this stage, you'll add support for redeclaring variables using the `var` statement.

### Book reference

The code for this stage is implemented in [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).

### Tests

The tester will run a series of tests with `test.lox` files that contain the `var` statement.

For example, if `test.lox` contains the following

```
var a = 1;
var a = 2;
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
2
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var baz = "before";
print baz;
var baz = "after";
print baz;
```

Expected Output:

```
before
after
```

Test Case 2:

Input:

```
var hello = "after";
var hello = "before";
var hello = hello;
print hello;
```

Expected Output:

```
before
```

Test Case 3:

Input:

```
var world = 2;
print world;
var world = 3;
print world;
var hello = 5;
print hello;
var world = hello;
print world;
```

Expected Output:

```
2
3
5
5
```

Test Case 4:

Input:

```
var baz = bar;
```

Expected Output:

```
Undefined variable 'bar'.
[line 1]
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)