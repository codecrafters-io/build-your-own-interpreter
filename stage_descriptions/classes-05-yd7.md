In this stage, you'll let a method refer to its bound instance through `this`.

### The method receiver

That instance is the method's **receiver**. Use `this.memory` to read a field
and `this.memory = value` to update it.

The receiver is fixed when the method is obtained from an instance. If
`dog.makeSound` is stored in a field on `cat`, the stored method still has `dog`
as its receiver. Calling it through `cat` must not replace that binding.

A function declared inside the method can capture `this` through the same
closure mechanism as other outer bindings. The captured receiver remains
available after the method returns.

### Tests

The tester will run a series of tests with `test.lox` files that use the `this`
keyword in various contexts.

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

The tester varies values and contexts. These examples show the required
behavior:

Reading a receiver's field:

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

Stdout:

```
175
```

Moving a bound method preserves its receiver:

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

Stdout:

```
Woof
Cat
```

A nested function captures this:

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

Stdout:

```
Wizard instance
Casting spell as Merlin
```

The tester checks stdout and exit code 0, including the retained receiver after
a method is moved or captured.

### Notes

- The output formats in this stage match those in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/benchmark/binary_trees.lox)
- For the book's explanation, see
  [Section 12.6: This](https://craftinginterpreters.com/classes.html#this).
