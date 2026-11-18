In this stage, you'll validate the context and syntax of `super` expressions.

### Valid and invalid uses of `super`

`super.method` is allowed only within the lexical context of a subclass method,
including functions nested inside that method.

Reject `super` outside a class or inside a class with no superclass. Also
require `super` to be followed directly by `.` and a method-name identifier. It
is not a standalone value, so both `super;` and `(super).method()` are invalid.

These are syntax or resolution errors. Report a diagnostic on stderr, execute no
statements, leave stdout empty, and exit with code 65. A valid `super.method`
whose method does not exist remains an undefined-property runtime error.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid
usages of `super`.

For example, if `test.lox` contains the following:

```
class Foo {
  cook() {
    // Foo is not a subclass
    super.cook(); // expect compile error
  }
}
```

The tester will run your program like this. The shown diagnostic is on stderr:

```
$ ./your_program.sh run test.lox
[line 4] Error at 'super': Can't use 'super' in a class with no superclass.
```

The tester varies values and contexts. These examples show the required
behavior:

Super requires a class context:

Input:

```
// super can't be used outside of a class
super.notEvenInAClass(); // expect compile error
```

Example stderr:

```
[line 2] Error at 'super': Can't use 'super' outside of a class.
```

Super requires a dot and method name:

Input:

```
class A {}

class B < A {
  method() {
    // super must be followed by `.`
    // and a method name
    super; // expect compile error
  }
}
```

Example stderr:

```
[line 7] Error at ';': Expect '.' after 'super'.
```

The tester checks exit code 65 and empty stdout for invalid syntax or context.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/inheritance/inherit_from_function.lox)
- The tester checks stdout and exit status. The exact diagnostic wording is not
  checked.
- For the book's explanation, see
  [Section 13.3: Calling Superclass Methods](https://craftinginterpreters.com/inheritance.html#calling-superclass-methods),
  specifically the error handling parts.
