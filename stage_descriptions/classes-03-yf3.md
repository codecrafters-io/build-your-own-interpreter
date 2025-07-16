In this stage, you'll add support for getting and setting properties on class instances. Properties can be dynamically added to instances after creation and can hold any type of value.

### Book reference

The code for this stage is implemented in [Section 12.4: Properties on Instances](https://craftinginterpreters.com/classes.html#properties-on-instances).

### Tests

The tester will run a series of tests with `test.lox` files that contain property access and modification.

For example, if `test.lox` contains the following:

```
// Basic property setting and getting
class Spaceship {}
var falcon = Spaceship();

falcon.name = "Millennium Falcon";
falcon.speed = 75.5;

print "Ship details:";
print falcon.name;
print falcon.speed;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Ship details:
Millennium Falcon
75.5
```

The tester will run multiple such tests with property access in different contexts, for example:

Test Case 1:

Input:
```
// Multiple properties and conditional access
class Robot {}
var r2d2 = Robot();

r2d2.model = "Astromech";
r2d2.operational = false;

if (r2d2.operational) {
  print r2d2.model;
  r2d2.mission = "Navigate hyperspace";
  print r2d2.mission;
}
```

Expected Output:
```
(No output because the condition is false)
```

Test Case 2:

Input:
```
// Multiple instances with properties
class Superhero {}
var batman = Superhero();
var superman = Superhero();

batman.name = "Batman";
batman.called = 18;

superman.name = "Superman";
superman.called = 66;

print "Times " + superman.name + " was called: ";
print superman.called;
print "Times " + batman.name + " was called: ";
print batman.called;
```

Expected Output:
```
Times Superman was called:
66
Times Batman was called:
18
```

Test Case 3:

Input:
```
// Property manipulation in functions
class Wizard {}
var gandalf = Wizard();

gandalf.color = "Grey";
gandalf.power = nil;
print gandalf.color;

fun promote(wizard) {
  wizard.color = "White";
  if (true) {
    wizard.power = 100;
  } else {
    wizard.power = 0;
  }
}

promote(gandalf);
print gandalf.color;
print gandalf.power;
```

Expected Output:
```
Grey
White
100
```

The tester will assert that your program correctly handles property access and modification, including:
- Setting properties with different types of values
- Reading property values

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/benchmark/binary_trees.lox)
- Properties can be dynamically added to instances at any time
- Properties can hold any valid Lox value (strings, numbers, nil, etc.)
- Accessing undefined properties should result in a runtime error