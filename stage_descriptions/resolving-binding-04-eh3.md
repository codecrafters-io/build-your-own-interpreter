In this stage, you'll add support for detecting invalid return statements. Return statements are only allowed within function bodies and should be detected as errors when they appear in top-level code or blocks outside of functions.

### Book reference

The code for this stage is implemented in [Section 11.5.1: Invalid Return Errors](https://craftinginterpreters.com/resolving-and-binding.html#invalid-return-errors).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with return statements in various contexts.

For example, if `test.lox` contains the following:

```
fun foo() {
  return "at function scope is ok";
}

return;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 6] Error at 'return': Can't return from top-level code.
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
fun foo() {
  if (true) {
    return "early return";
  }

  for (var i = 0; i < 10; i = i + 1) {
    return "loop return";
  }
}

if (true) {
  return "conditional return";
}
```

Expected Output:

```
[line 12] Error at 'return': Can't return from top-level code.
```

Test Case 2:

Input:

```
{
  return "not allowed in a block either";
}

fun allowed() {
  if (true) {
    return "this is fine";
  }
  return;
}
```

Expected Output:

```
[line 3] Error at 'return': Can't return from top-level code.
```

Test Case 3:

Input:

```
fun outer() {
  fun inner() {
    return "ok";
  }

  return "also ok";
}

if (true) {
  fun nested() {
    return;
  }

  return "not ok";
}
```

Expected Output:

```
[line 15] Error at 'return': Can't return from top-level code.
```

The tester will assert that for return statements inside functions, the code should compile successfully. For return statements outside functions (in top-level code or blocks), the program should exit with code 65 and print an appropriate error message.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/return/at_top_level.lox)
- The error should be detected at compile time, not runtime
- Error messages should be written to stderr, but the exact error message is not checked.