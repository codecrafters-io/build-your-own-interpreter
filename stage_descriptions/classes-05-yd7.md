In this stage, you'll add support for the `this` keyword in your Lox interpreter. The `this` keyword allows methods to access the instance they were called on, enabling full object-oriented programming.

### Book reference

The code for this stage is implemented in [Section 12.6: This](https://craftinginterpreters.com/classes.html#this).

### Tests

The tester will run a series of tests with `test.lox` files that use the `this` keyword in various contexts.

For example, if `test.lox` contains the following:

```
class Spaceship {
  identify() {
    print this;
  }
}

Spaceship().identify();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Spaceship instance
```

The tester will run multiple such tests with `this` in different contexts, for example:

Test Case 1:

Input:
```
class Calculator {
  add(a, b) {
    return a + b + this.memory;
  }
}

var calc = Calculator();
calc.memory = 82;
print calc.add(92, 1);
```

Expected Output:
```
175
```

Test Case 2:

Input:
```
class Animal {
  makeSound() {
    print this.sound;
  }
  identify() {
    print this.species;
  }
}

var dog = Animal();
dog.sound = "Woof";
dog.species = "Dog";

var cat = Animal();
cat.sound = "Meow";
cat.species = "Cat";

// Swap methods between instances
cat.makeSound = dog.makeSound;
dog.identify = cat.identify;

cat.makeSound();
dog.identify();
```

Expected Output:
```
Woof
Cat
```

Test Case 3:

Input:
```
class Wizard {
  getSpellCaster() {
    fun castSpell() {
      print this;
      print "Casting spell as " + this.name;
    }

    return castSpell;
  }
}

var wizard = Wizard();
wizard.name = "Merlin";
wizard.getSpellCaster()();
```

Expected Output:
```
Wizard instance
Casting spell as Merlin
```

The tester will assert that your program correctly handles the `this` keyword, including:
- Referring to the instance in methods
- Accessing instance properties through `this`
- Maintaining correct `this` binding when methods are passed around

### Notes

- When methods are called, `this` should be bound to the instance the method was called on
- The `this` binding should persist even when methods are passed around as first-class values
- The output formats in this stage match those in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/benchmark/binary_trees.lox)