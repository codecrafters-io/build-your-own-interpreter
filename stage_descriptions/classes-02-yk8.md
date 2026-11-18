In this stage, you'll make class values callable.

### Creating instances

Calling `ClassName()` creates a new **instance**, an object associated with that
class. Each call creates a separate instance.

Instances are runtime values, so they can be stored, passed to functions, and
returned. They are truthy under Lox's existing rule. Print an instance as its
class name followed by ` instance`, such as `Spaceship instance`.

The classes in this stage have empty bodies and take no constructor arguments.
Fields and initialization behavior come later.

### Tests

The tester will run a series of tests with `test.lox` files that contain class
instantiation in various contexts.

For example, if `test.lox` contains the following:

```
class Spaceship {}
var falcon = Spaceship();
print falcon;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Spaceship instance
```

The tester varies values and contexts. These examples show the required
behavior:

Multiple instances of one class:

Input:

```
// Creating multiple instances of the same class
class Robot {}
var r1 = Robot();
var r2 = Robot();

print "Created multiple robots:";
print r1;
print r2;
```

Stdout:

```
Created multiple robots:
Robot instance
Robot instance
```

Returning an instance from a function:

Input:

```
class Wizard {}
class Dragon {}

// Instantiating classes in a function should work
fun createCharacters() {
  var merlin = Wizard();
  var smaug = Dragon();
  print "Characters created in fantasy world:";
  print merlin;
  print smaug;
  return merlin;
}

var mainCharacter = createCharacters();
// An instance of a class should be truthy
if (mainCharacter) {
  print "The main character is:";
  print mainCharacter;
} else {
  print "Failed to create a main character.";
}
```

Stdout:

```
Characters created in fantasy world:
Wizard instance
Dragon instance
The main character is:
Wizard instance
```

The tester will assert that your program correctly handles class instantiation
and that instances are printed with the format "ClassName instance".

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/call/object.lox)
- Successful programs exit with code 0.
- For the book's explanation, see
  [Section 12.3: Creating Instances](https://craftinginterpreters.com/classes.html#creating-instances).
