In this stage, you'll initialize new instances with a method named `init`.

### Constructors and initializers

Calling a class creates an instance, binds `this` to it, and invokes `init` when
that method exists. The class call then returns the instance.

The initializer's parameters determine the class call's arity, and the call's
arguments become those parameter values. A class with no initializer still takes
zero arguments.

An initializer can also be called explicitly, such as `instance.init(52)`. This
operates on the existing instance and returns that same instance, even when its
body reaches the end without a return. Explicit return statements inside
initializers come in later stages.

### Tests

The tester will run a series of tests with `test.lox` files that contain
constructor definitions and calls.

For example, if `test.lox` contains the following:

```
class Default {
  init() {
    this.x = "bar";
    this.y = 91;
  }
}
print Default().x;
print Default().y;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
bar
91
```

The tester varies values and contexts. These examples show the required
behavior:

Constructor arguments become initializer parameters:

Input:

```
class Robot {
  init(model, function) {
    this.model = model;
    this.function = function;
  }
}
print Robot("R2-D2", "Astromech").model;
```

Stdout:

```
R2-D2
```

Calling init explicitly returns the existing instance:

Input:

```
class Counter {
  init(startValue) {
    if (startValue < 0) {
      print "startValue can't be negative";
      this.count = 0;
    } else {
      this.count = startValue;
    }
  }
}

var instance = Counter(-52);
print instance.count;
print instance.init(52).count;
```

Stdout:

```
startValue can't be negative
0
52
```

Initialized fields are available to other methods:

Input:

```
class Vehicle {
  init(type) {
    this.type = type;
  }
}

class Car {
  init(make, model) {
    this.make = make;
    this.model = model;
    this.wheels = "four";
  }

  describe() {
    print this.make + " " + this.model +
    " with " + this.wheels + " wheels";
  }
}

var vehicle = Vehicle("Generic");
print "Generic " + vehicle.type;

var myCar = Car("Toyota", "Corolla");
myCar.describe();
```

Stdout:

```
Generic Generic
Toyota Corolla with four wheels
```

The tester checks stdout and exit code 0, including automatic initialization,
argument binding, and explicit calls to `init`.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/constructor/call_init_early_return.lox)
- For the book's explanation, see
  [Section 12.7: Constructors and Initializers](https://craftinginterpreters.com/classes.html#constructors-and-initializers).
