In this stage, you'll add `super.method` so a subclass method can access
superclass behavior, including a method it overrides.

### Lexical superclass lookup

The lookup starts at the superclass of the class where the current method was
declared. The receiver may belong to a deeper subclass. For example, if `B < A`
defines a method using `super`, inheriting that method in `C < B` still makes
its `super` lookup start at `A`.

The resulting method is bound to the current `this`. Reading `super.method`
produces that callable value, and `super.method()` invokes it. If the method is
absent from the whole superclass chain, report an undefined-property runtime
error.

A nested function can capture both the lexical superclass and the receiver.
Those bindings must remain available if the nested function is returned and
called later.

### Tests

The tester will run a series of tests with `test.lox` files that use the `super`
keyword.

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

The tester varies values and contexts. These examples show the required
behavior:

Each super lookup uses its declaring class:

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

Stdout:

```
Base.method()
Base.method()
```

The tester checks stdout and exit code 0, including `super` in inherited methods
and returned closures.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/super/call_other_method.lox#L1)
- For the book's explanation, see
  [Section 13.3: Calling Superclass Methods](https://craftinginterpreters.com/inheritance.html#calling-superclass-methods).
