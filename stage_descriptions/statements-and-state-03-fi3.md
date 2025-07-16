In this stage, you'll add support for handling expression statements. An expression statement lets you place an expression where a statement is expected. They exist to evaluate expressions that have side effects.

### Book reference

The code for this stage is implemented in [Section 8.1: Statements](https://craftinginterpreters.com/statements-and-state.html#statements).

### Tests

The tester will run a series of tests with `test.lox` files that contain expressions that have side effects, combined with the `print` statement.

For example, if `test.lox` contains the following

```
"foo" + "bar";
print "baz";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
baz
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
(37 + 42 - 21) > (76 - 37) * 2;
print !false;
"baz" + "hello" + "quz" + "bar" == "bazhelloquzbar";
print !false;
```

Expected Output:

```
true
true
```

Test Case 2:

Input:

```
27 - 60 >= -99 * 2 / 99 + 76;
true == true;
("world" == "bar") == ("baz" != "hello");
print true;
```

Expected Output:

```
true
```

Test Case 3:

Input:

```
print "the expression below is invalid";
49 + "baz";
print "this should not be printed";
```

Expected Output:

```
the expression below is invalid
Operands must be two numbers or two strings.
[line 2]
```

Test Case 4:

Input:

```
print "79" + "baz";
print false * (18 + 84);
```

Expected Output:

```
79baz
Operands must be numbers.
[line 2]
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 70.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)