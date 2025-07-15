In this stage, you'll add support for constructors in your Lox interpreter. In Lox, a constructor is a method named `init()` that is automatically called when a class instance is created.

### Book reference

The code for this stage is implemented in [Section 12.7: Constructors and Initializers](https://craftinginterpreters.com/classes.html#constructors-and-initializers).

### Tests

The tester will run a series of tests with `test.lox` files that contain constructor definitions and calls.

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

The tester will run multiple such tests with constructors in different contexts, for example:

Test Case 1:

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

Expected Output:
```
R2-D2
```

Test Case 2:

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

Expected Output:
```
startValue can't be negative
0
52
```

Test Case 3:

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

Expected Output:
```
Generic Generic
Toyota Corolla with four wheels
```

The tester will assert that your program correctly handles constructors, including:
- Calling the `init()` method automatically when a class is instantiated
- Passing constructor arguments correctly
- Setting instance properties in the constructor

### Notes

- The `init()` method can be called explicitly like any other method
- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/constructor/call_init_early_return.lox)