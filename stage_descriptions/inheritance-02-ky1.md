In this stage, you'll add support for method inheritance in your Lox interpreter. This allows subclasses to inherit and use methods defined in their superclass.

### Book reference

The code for this stage is implemented in [Section 13.2: Inheriting Methods](https://craftinginterpreters.com/inheritance.html#inheriting-methods).

### Tests

The tester will run a series of tests with `test.lox` files that contain method inheritance.

For example, if `test.lox` contains the following:

```
class Doughnut {
  cook() {
    print "Fry until golden brown.";
  }
}

// BostonCream is a subclass of Doughnut
class BostonCream < Doughnut {}

// BostonCream class should inherit the cook
// method from Doughnut class
BostonCream().cook();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Fry until golden brown.
```

The tester will run multiple such tests with method inheritance in different contexts, for example:

Test Case 1:

Input:
```
class Root {
  getName() {
    print "Root class";
  }
}

class Parent < Root {
  parentMethod() {
    print "Method defined in Parent";
  }
}

class Child < Parent {
  childMethod() {
    print "Method defined in Child";
  }
}

var root = Root();
var parent = Parent();
var child = Child();

// Root methods are available to all
root.getName();
parent.getName();
child.getName();

// Parent methods are available to Parent and Child
parent.parentMethod();
child.parentMethod();

// Child methods are only available to Child
child.childMethod();
```

Expected Output:
```
Root class
Root class
Root class
Method defined in Parent
Method defined in Parent
Method defined in Child
```

The tester will assert that your program correctly handles method inheritance, including:
- Methods being inherited through multiple levels of inheritance
- Constructors being inherited from parent classes

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/class/inherited_method.lox)
- Methods should be inherited through the entire inheritance chain
- Inherited methods should have access to instance properties
- Constructors (init methods) should also be inherited