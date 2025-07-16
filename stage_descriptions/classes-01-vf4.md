In this stage, you'll add support for class declarations in your Lox interpreter. This will allow users to define classes using the `class` keyword, which can later be instantiated and used.

### Book reference

The code for this stage is implemented in [Section 12.2: Class Declarations](https://craftinginterpreters.com/classes.html#class-declarations).

### Tests

The tester will run a series of tests with `test.lox` files that contain class declarations in various contexts.

For example, if `test.lox` contains the following:

```
class Spaceship {}
print Spaceship;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Spaceship
```

The tester will run multiple such tests with class declarations in different contexts, for example:

Test Case 1:

Input:

```
// Multiple class declarations with empty body
class Robot {}
class Wizard {}
print Robot;
print Wizard;
print "Both classes successfully printed";
```

Expected Output:

```
Robot
Wizard
Both classes successfully printed
```

Test Case 2:

Input:

```
{
  // Class declaration inside blocks should work
  class Dinosaur {}
  print "Inside block: Dinosaur exists";
  print Dinosaur;
}
print "Accessing out-of-scope class:";
print Dinosaur; // expect runtime error
```

Expected Output:

```
Inside block: Dinosaur exists
Dinosaur
Accessing out-of-scope class:
Undefined variable 'Dinosaur'.
[line 8]
```

Test Case 3:

Input:

```
// Class declaration inside function should work
fun foo() {
  class Superhero {}
  print "Class declared inside function";
  print Superhero;
}

foo();
print "Function called successfully";
```

Expected Output:

```
Class declared inside function
Superhero
Function called successfully
```

The tester will assert that your program correctly handles class declarations and follows the scoping rules for classes.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/class/empty.lox)
- Classes should follow the same scoping rules as variables
- When a class is printed, it should display its name
- The tester won't check the exact error message in this stage, it will only check that the program exits with code 70.