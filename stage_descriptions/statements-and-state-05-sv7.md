In this stage, you'll add support for handling runtime errors while accessing variables that haven't been declared yet.

### Book reference

The code for this stage is implemented in [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).

### Tests

The tester will run a series of tests with `test.lox` files that access variables that haven't been declared yet.

For example, if `test.lox` contains the following

```
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Undefined variable 'a'.
[line 1]
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
print 22;
print x;
```

Expected Output:

```
22
Undefined variable 'x'.
[line 2]
```

Test Case 2:

Input:

```
var baz = 96;
print hello;
```

Expected Output:

```
Undefined variable 'hello'.
[line 2]
```

Test Case 3:

Input:

```
var hello = 85;
var result = (hello + bar) / world;
print result;
```

Expected Output:

```
Undefined variable 'bar'.
[line 2]
```

Test Case 4:

Input:

```
var quz = 20;
var world = 51;
var hello = 56;
print quz + world + he
```

Expected Output:

```
Undefined variable 'he'.
[line 4]
```

The tester will assert that the exit code is 70, signifying a runtime error. Note that this is different from the expected exit code for a syntax error, which is 65.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)
- Error messages should be printed to `stderr`, not `stdout`.
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 70.