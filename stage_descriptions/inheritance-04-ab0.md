In this stage, you'll add validation for class inheritance to ensure valid class hierarchies. This involves detecting and reporting errors for invalid inheritance patterns.

### Book reference

The code for this stage is implemented in [Section 13.1: Superclasses and Subclasses](https://craftinginterpreters.com/inheritance.html#superclasses-and-subclasses), specifically the error handling parts.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid inheritance patterns.

For example, if `test.lox` contains the following:

```
// A class can't inherit from itself.
class Foo < Foo {} // expect compile error
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 2] Error at 'Foo': A class can't inherit from itself.
```

The tester will run multiple tests with invalid inheritance patterns, for example:

Test Case 1:

Input:
```
fun A() {}

// A class can only inherit from a class.
class B < A {} // expect runtime error

print A();
print B();
```

Expected Output:
```
Superclass must be a class.
[line 4]
```

Test Case 2:

Input:
```
var A = "class";

// A class can only inherit from a class
class B < A {} // expect runtime error

print B();
```

Expected Output:
```
Superclass must be a class.
[line 4]
```

The tester will assert that for valid class hierarchies, the exit code is 0. For invalid class hierarchies which can be detected at compile time, the program should exit with code 65 (compile error), for invalid class instantiation which can only be detected at runtime, the program should exit with code 70 (runtime error) and print an appropriate error message.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/class/local_inherit_self.lox)
- Error messages should be written to stderr, but the exact error messages are not checked.