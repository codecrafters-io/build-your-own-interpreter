In this stage, you'll let an instance use methods from its class's superclasses.

### Inherited method lookup

If its class does not define the requested method, continue looking in its
superclass, then further up the chain. A missing method still produces the
existing undefined-property runtime error.

An inherited method is bound to the actual instance being accessed. Its `this`
therefore refers to the subclass instance and can read or update that instance's
fields. Each instance keeps its own field values.

Initializers are inherited too. If a subclass has no `init`, calling the
subclass uses the inherited initializer and returns the new subclass instance.
Keep instance fields ahead of method lookup as before.

### Tests

The tester will run a series of tests with `test.lox` files that contain method
inheritance.

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

The tester varies values and contexts. These examples show the required
behavior:

Methods inherited through several levels:

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

Stdout:

```
Root class
Root class
Root class
Method defined in Parent
Method defined in Parent
Method defined in Child
```

The tester checks stdout and exit code 0 for inherited methods, including
initializers inherited through multiple levels.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/class/inherited_method.lox)
- For the book's explanation, see
  [Section 13.2: Inheriting Methods](https://craftinginterpreters.com/inheritance.html#inheriting-methods).
