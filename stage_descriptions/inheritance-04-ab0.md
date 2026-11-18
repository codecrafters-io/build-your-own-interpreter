In this stage, you'll reject two invalid inheritance cases at the phase where
they can be detected.

### Inheritance error phases

A class cannot name itself as its superclass, as in `class Foo < Foo {}`. Detect
this during resolution, execute no statements, report a diagnostic on stderr,
and exit with code 65.

When a class declaration executes, its superclass name must evaluate to a class
value. A function, string, or other non-class value causes a runtime error with
exit code 70. This happens at the declaration, even if the program never creates
an instance. A previously declared class name may have been reassigned, so check
the value it currently holds. Preserve earlier stdout and stop execution on
failure.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid
inheritance patterns.

For example, if `test.lox` contains the following:

```
// A class can't inherit from itself.
class Foo < Foo {} // expect compile error
```

The tester will run your program like this. The shown diagnostic is on stderr:

```
$ ./your_program.sh run test.lox
[line 2] Error at 'Foo': A class can't inherit from itself.
```

The tester varies values and contexts. These examples show the required
behavior:

A function cannot be a superclass:

Input:

```
fun A() {}

// A class can only inherit from a class.
class B < A {} // expect runtime error

print A();
print B();
```

Example stderr:

```
Superclass must be a class.
[line 4]
```

A string cannot be a superclass:

Input:

```
var A = "class";

// A class can only inherit from a class
class B < A {} // expect runtime error

print B();
```

Example stderr:

```
Superclass must be a class.
[line 4]
```

Self-inheritance exits with code 65. A non-class superclass exits with code 70.
The shown invalid programs have empty stdout. Valid hierarchies continue to exit
with code 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/class/local_inherit_self.lox)
- The tester checks stdout and exit status. The exact diagnostic wording is not
  checked.
- For the book's explanation, see
  [Section 13.1: Superclasses and Subclasses](https://craftinginterpreters.com/inheritance.html#superclasses-and-subclasses),
  specifically the error handling parts.
