In this stage, you'll add support for method overriding in your Lox interpreter. This allows subclasses to provide their own implementation of methods defined in their superclass.

### Book reference

The code for this stage is implemented in [Section 13.2: Inheriting Methods](https://craftinginterpreters.com/inheritance.html#inheriting-methods).

### Tests

The tester will run a series of tests with `test.lox` files that contain method overriding.

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

The tester will run multiple such tests with method overriding in different contexts, for example:

Test Case 1:

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

Expected Output:
```
89
32
```

Test Case 2:

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

Expected Output:
```
Animal speaks : Generic sound
Dog speaks : Woof
Puppy speaks : Woof
```

The tester will assert that your program correctly handles method overriding, including:
- Methods being correctly overridden in subclasses
- Constructors being overridden with new signatures
- Multiple levels of method overriding working correctly

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/inheritance/inherit_methods.lox)
- Overridden methods should completely replace the superclass implementation
- Method overriding should work through multiple levels of inheritance