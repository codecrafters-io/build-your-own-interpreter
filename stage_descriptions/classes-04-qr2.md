In this stage, you'll add methods, functions declared inside a class body.

### Methods and bound instances

Write a method as `name(parameters) { body }`, without the `fun` keyword. Its
parameters, local scope, and return behavior follow the function rules.

Reading `instance.method` produces a **bound method**, a function value that
remembers the instance it was read from. Adding `()` invokes it. A bound method
can also be stored in a variable and called later, as the `action` example
shows.

An instance field takes precedence over a method with the same name. If no field
exists, look for a method on the class. Referring to the bound instance inside a
method with `this` comes next.

### Tests

The tester will run a series of tests with `test.lox` files that contain method
definitions and calls.

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

The tester varies values and contexts. These examples show the required
behavior:

A method can refer to its class:

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

Stdout:

```
Foo
```

A method can be stored and called later:

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

Stdout:

```
Casting a magical spell: Fireball
```

Methods can pass and update instances:

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

Stdout:

```
Using power: Flight
```

The tester checks stdout and exit code 0 for successful method calls.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/benchmark/method_call.lox)
- For the book's explanation, see
  [Section 12.5: Methods on Classes](https://craftinginterpreters.com/classes.html#methods-on-classes).
