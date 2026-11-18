In this stage, you'll support **overriding**: a subclass declares a method with
the same name as an inherited method.

### Overriding methods

Ordinary lookup selects the first definition found, starting at the instance's
own class and following its superclass chain.

The superclass's method remains available to superclass instances. An override
does not automatically call it. Even inside an inherited method, a call through
`this` starts lookup at the actual receiver's class. That is why the inherited
`communicate` method below uses `Puppy.speak` and `Dog.makeSound` for a puppy.

A subclass can also override `init` with a different parameter list. Its
initializer determines the constructor's arity and runs instead of the
superclass initializer. Explicit superclass calls come in later stages.

### Tests

The tester will run a series of tests with `test.lox` files that contain method
overriding.

For example, if `test.lox` contains the following:

```
class A {
  method() {
    print "A method";
  }
}

// B inherits method `method` from A
// and overrides it with a new implementation
class B < A {
  method() {
    print "B method";
  }
}

var b = B();
b.method();  // expect: B method
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
B method
```

The tester varies values and contexts. These examples show the required
behavior:

An initializer can have a different signature:

Input:

```
class Base {
  init(a) {
    this.a = a;
  }
}

// Constructors can also be overridden
class Derived < Base {
  init(a, b) {
    this.a = a;
    this.b = b;
  }
}

var derived = Derived(89, 32);
print derived.a;
print derived.b;
```

Stdout:

```
89
32
```

An inherited method calls the receiver's overrides:

Input:

```
class Animal {
  speak() {
    return "Animal speaks";
  }

  makeSound() {
    return "Generic sound";
  }

  communicate() {
    return this.speak() + " : " + this.makeSound();
  }
}

class Dog < Animal {
  speak() {
    return "Dog speaks";
  }

  makeSound() {
    return "Woof";
  }
}

class Puppy < Dog {
  speak() {
    return "Puppy speaks";
  }
}

var animal = Animal();
var dog = Dog();
var puppy = Puppy();

print animal.communicate();
print dog.communicate();
print puppy.communicate();
```

Stdout:

```
Animal speaks : Generic sound
Dog speaks : Woof
Puppy speaks : Woof
```

The tester checks stdout and exit code 0 for overrides, including constructor
signatures and calls from inherited methods.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/inheritance/inherit_methods.lox)
- For the book's explanation, see
  [Section 13.2: Inheriting Methods](https://craftinginterpreters.com/inheritance.html#inheriting-methods).
