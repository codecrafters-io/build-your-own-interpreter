In this stage, you'll add support for declaring variables using the `var` statement. For this, you'll need to add support for the `var` declaration in your AST generator, parser & interpreter.

### Book reference

The code for this stage is implemented in [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).

### Tests

The tester will run a series of tests with `test.lox` files that contain the `var` statement.

For example, if `test.lox` contains the following

```
var a = "foo";
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
foo
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var world = 10;
print world;
```

Expected Output:

```
10
```

Test Case 2:

Input:

```
var bar = 99;
var foo = 99;
print bar + foo;
var quz = 99;
print bar + foo + quz;
```

Expected Output:

```
198
297
```

Test Case 3:

Input:

```
var foo = (8 * (62 + 62)) / 4 + 62;
print foo;
```

Expected Output:

```
310
```

Test Case 4:

Input:

```
var quz = 76;
var baz = quz;
print baz + quz;
```

Expected Output:

```
152
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)