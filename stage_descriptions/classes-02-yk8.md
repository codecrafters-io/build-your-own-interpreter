In this stage, you'll add support for class instances in your Lox interpreter. This will allow users to instantiate classes using the class name followed by parentheses, e.g., `ClassName()`.

### Book reference

The code for this stage is implemented in [Section 12.3: Creating Instances](https://craftinginterpreters.com/classes.html#creating-instances).

### Tests

The tester will run a series of tests with `test.lox` files that contain class instantiation in various contexts.

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

The tester will run multiple such tests with class instantiation in different contexts, for example:

Test Case 1:

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

Expected Output:

```
Created multiple robots:
Robot instance
Robot instance
```

Test Case 2:

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

Expected Output:

```
Characters created in fantasy world:
Wizard instance
Dragon instance
The main character is:
Wizard instance
```

Test Case 3:

Input:

```
class Superhero {}

var count = 0;
while (count < 3) {
  var hero = Superhero();
  print "Hero created:";
  print hero;
  count = count + 1;
}

print "All heroes created!";
```

Expected Output:

```
Hero created:
Superhero instance
Hero created:
Superhero instance
Hero created:
Superhero instance
All heroes created!
```

The tester will assert that your program correctly handles class instantiation and that instances are printed with the format "ClassName instance".

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/call/object.lox)
- Class instances should be truthy when used in conditional expressions
- When an instance is printed, it should display its class name followed by the word "instance"