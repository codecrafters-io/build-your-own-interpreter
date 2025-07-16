In this stage, you'll add validation for the `super` keyword to ensure it's only used in appropriate contexts. This involves detecting and reporting errors when `super` is used incorrectly.

### Book reference

The code for this stage is implemented in [Section 13.3: Calling Superclass Methods](https://craftinginterpreters.com/inheritance.html#calling-superclass-methods), specifically the error handling parts.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid usages of `super`.

For example, if `test.lox` contains the following:

```
class Foo {
  cook() {
    // Foo is not a subclass
    super.cook(); // expect compile error
  }
}
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 4] Error at 'super': Can't use 'super' in a class with no superclass.
```

The tester will run multiple tests with invalid `super` usage, for example:

Test Case 1:

Input:
```
// super can't be used outside of a class
super.notEvenInAClass(); // expect compile error
```

Expected Output:
```
[line 2] Error at 'super': Can't use 'super' outside of a class.
```

Test Case 2:

Input:
```
class A {}

class B < A {
  method() {
    // super must be followed by `.`
    // and an expression
    super; // expect compile error
  }
}
```

Expected Output:
```
[line 7] Error at ';': Expect '.' after 'super'.
```

The tester will assert that your program correctly detects and reports invalid uses of `super` with appropriate error messages and exit codes. For invalid uses of `super` the program should exit with code 65 (compile error).

### Notes

- The `super` keyword should only be used in subclasses.
- The `super` keyword should always be followed by `.` and an expression.
- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/inheritance/inherit_from_function.lox)
- Error messages should be written to stderr, but the exact error messages are not checked.