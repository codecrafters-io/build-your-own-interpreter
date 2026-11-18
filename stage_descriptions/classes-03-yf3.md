In this stage, you'll give instances named fields that can hold any Lox value.

### Fields and property access

Reading `object.name` gets a field, and `object.name = value` adds or replaces
it. The name after the dot is the property's name, so it is not looked up as a
variable.

Fields belong to individual instances. Two instances of one class can have
different fields and values. Passing an instance to a function preserves access
to that same object, so mutations through the parameter remain visible to the
caller.

A property assignment is an expression that produces the assigned value. Reading
an absent property causes a runtime error. A present field whose value is `nil`
is still a valid property. Property access requires an instance, and invalid
access reports a diagnostic on stderr with exit code 70.

### Tests

The tester will run a series of tests with `test.lox` files that contain
property access and modification.

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

The tester varies values and contexts. These examples show the required
behavior:

A skipped branch produces no output:

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

Stdout is empty because the condition is false.

Fields belong to each instance:

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

print "Times " + superman.name + " was called:";
print superman.called;
print "Times " + batman.name + " was called:";
print batman.called;
```

Stdout:

```
Times Superman was called:
66
Times Batman was called:
18
```

A function can mutate the same instance:

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

Stdout:

```
Grey
White
100
```

The tester checks the resulting stdout and successful exit code 0 for these
examples.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/benchmark/binary_trees.lox)
- For the book's explanation, see
  [Section 12.4: Properties on Instances](https://craftinginterpreters.com/classes.html#properties-on-instances).
