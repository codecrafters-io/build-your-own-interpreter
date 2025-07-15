In this stage, you'll add support for detecting invalid variable redeclarations in the same scope. This means catching cases where a variable is declared multiple times in the same local scope.

### Book reference

The code for this stage is implemented in [Section 11.3: A Resolver Class](https://craftinginterpreters.com/resolving-and-binding.html#a-resolver-class).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with variable redeclarations.

For example, if `test.lox` contains the following:

```
{
  var a = "value";
  var a = "other";
}
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 3] Error at 'a': Already a variable with this name in this scope.
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
fun foo(a) {
  var a;
}
```

Expected Output:

```
[line 2] Error at 'a': Already a variable with this name in this scope.
```

Test Case 2:

Input:

```
fun foo(arg, arg) {
  "body";
}
```

Expected Output:

```
[line 1] Error at 'arg': Already a variable with this name in this scope.
```

Test Case 3:

Input:

```
var a = "1";
print a;

var a;
print a;

var a = "2";
print a;

{
  var a = "1";
  var a = "2";
  print a;
}
```

Expected Output:

```
[line 12] Error at 'a': Already a variable with this name in this scope.
```

The tester will assert that for valid global redeclarations, the exit code should be 0. For invalid local redeclarations, the program should exit with code 65 and print an appropriate error message.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/variable/duplicate_local.lox)
- Variable redeclaration is allowed in global scope but not in local scopes
- The error should be detected at compile time, not runtime
- Error messages should be written to stderr, but the exact error message is not checked.