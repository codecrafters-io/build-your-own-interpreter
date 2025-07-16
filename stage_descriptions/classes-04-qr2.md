In this stage, you'll add support for instance methods in your Lox interpreter. Methods are functions defined within a class that can be called on instances of that class.

### Book reference

The code for this stage is implemented in [Section 12.5: Methods on Classes](https://craftinginterpreters.com/classes.html#methods-on-classes).

### Tests

The tester will run a series of tests with `test.lox` files that contain method definitions and calls.

For example, if `test.lox` contains the following:

```
class Robot {
  beep() {
    print "Beep boop!";
  }
}

var r2d2 = Robot();
r2d2.beep();

Robot().beep();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Beep boop!
Beep boop!
```

The tester will run multiple such tests with methods in different contexts, for example:

Test Case 1:

Input:
```
{
  class Foo {
    returnSelf() {
      return Foo;
    }
  }

  print Foo().returnSelf();  // expect: Foo
}
```

Expected Output:
```
Foo
```

Test Case 2:

Input:
```
class Wizard {
  castSpell(spell) {
    print "Casting a magical spell: " + spell;
  }
}

class Dragon {
  breatheFire(fire, intensity) {
    print "Breathing " + fire + " with intensity: "
    + intensity;
  }
}

// Methods on different class instances
var merlin = Wizard();
var smaug = Dragon();

// Conditional method calling
if (true) {
  var action = merlin.castSpell;
  action("Fireball");
} else {
  var action = smaug.breatheFire;
  action("Fire", "100");
}
```

Expected Output:
```
Casting a magical spell: Fireball
```

Test Case 3:

Input:
```
class Superhero {
  useSpecialPower(hero) {
    print "Using power: " + hero.specialPower;
  }

  hasSpecialPower(hero) {
    return hero.specialPower;
  }

  giveSpecialPower(hero, power) {
    hero.specialPower = power;
  }
}

// Methods in functions
fun performHeroics(hero, superheroClass) {
  if (superheroClass.hasSpecialPower(hero)) {
    superheroClass.useSpecialPower(hero);
  } else {
    print "No special power available";
  }
}

var superman = Superhero();
var heroClass = Superhero();

if (true) {
  heroClass.giveSpecialPower(superman, "Flight");
} else {
  heroClass.giveSpecialPower(superman, "Strength");
}

performHeroics(superman, heroClass);
```

Expected Output:
```
Using power: Flight
```

The tester will assert that your program correctly handles methods, including:
- Defining methods within classes
- Calling methods on instances

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/benchmark/method_call.lox)
- Methods are defined within the class body
- Methods can take parameters and return values
- Methods can be used to manipulate instance properties