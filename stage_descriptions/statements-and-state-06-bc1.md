In this stage, you'll add support for initializing variables with the value passed to the `var` statement, or initializing them with `nil` if no value is passed.

### Book reference

The code for this stage is implemented in [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).

### Tests

The tester will run a series of tests with `test.lox` files that contain the `var` statement.

For example, if `test.lox` contains the following

```
var a;
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
nil
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var foo;
print foo;
```

Expected Output:

```
nil
```

Test Case 2:

Input:

```
var baz = "foo";
var bar;
print bar;
```

Expected Output:

```
nil
```

Test Case 3:

Input:

```
var baz = 69;
var world;
var quz;
print world;
```

Expected Output:

```
nil
```

Test Case 4:

Input:

```
var quz = 73 + 26 * 20;
print quz;
var hello = 26 * 20;
print quz + hello;
var foo;
print foo;
```

Expected Output:

```
593
1113
nil
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)