In this stage, you'll add support for the `super` keyword in your Lox interpreter. The `super` keyword allows methods to call overridden methods from their superclass.

### Book reference

The code for this stage is implemented in [Section 13.3: Calling Superclass Methods](https://craftinginterpreters.com/inheritance.html#calling-superclass-methods).

### Tests

The tester will run a series of tests with `test.lox` files that use the `super` keyword.

For example, if `test.lox` contains the following:

```
class Doughnut {
  cook() {
    print "Fry until golden brown.";
  }
}

// Super can be used to call the overridden method
// of the parent class
class BostonCream < Doughnut {
  cook() {
    super.cook();
  }
}

BostonCream().cook();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Fry until golden brown.
```

The tester will run multiple such tests with `super` in different contexts, for example:

Test Case 1:

Input:
```
class Base {
  method() {
    print "Base.method()";
  }
}

class Parent < Base {
  method() {
    super.method();
  }
}

class Child < Parent {
  method() {
    super.method();
  }
}

var parent = Parent();
parent.method();
var child = Child();
child.method();
```

Expected Output:
```
Base.method()
Base.method()
```

The tester will assert that your program correctly handles the `super` keyword, including:
- Calling superclass methods through multiple levels of inheritance
- Maintaining correct method resolution in complex inheritance chains
- Proper binding of `super` in various contexts

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/super/call_other_method.lox#L1)