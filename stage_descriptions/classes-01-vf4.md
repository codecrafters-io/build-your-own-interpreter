This extension adds classes and instances to your interpreter. Build on
Functions and Resolving & Binding, including closures and lexical scope. In this
stage, you'll support empty declarations of the form `class Name {}`.

### Class declarations and values

Executing a class declaration creates a class value and binds it to its name in
the current scope. Printing that value prints the declared name. A local class
follows the same visibility rules as a local variable.

A class will describe methods shared by its instances, while each instance holds
its own fields. Creating instances and adding methods come in later stages. For
now, declaring a class does not create an instance or execute a method.

### Tests

The tester will run a series of tests with `test.lox` files that contain class
declarations in various contexts.

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

The tester varies values and contexts. These examples show the required
behavior:

Class names obey block scope:

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

Stdout:

```
Inside block: Dinosaur exists
Dinosaur
Accessing out-of-scope class:
```

Example stderr:

```
Undefined variable 'Dinosaur'.
[line 8]
```

A function can declare a local class:

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

Stdout:

```
Class declared inside function
Superhero
Function called successfully
```

Successful programs produce the shown stdout and exit with code 0. Reading an
out-of-scope class name preserves earlier stdout, reports an error on stderr,
and exits with code 70.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/class/empty.lox)
- The tester checks stdout and exit status. The exact error message is not
  checked.
- For the book's explanation, see
  [Section 12.2: Class Declarations](https://craftinginterpreters.com/classes.html#class-declarations).
