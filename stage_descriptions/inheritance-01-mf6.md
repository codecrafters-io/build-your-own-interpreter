This extension lets classes reuse and specialize behavior from another class.
Build on the Classes extension, including instances, methods, initializers, and
resolution. In this stage, you'll support inheritance declarations with empty
class bodies.

### Superclasses and subclasses

In `class BostonCream < Doughnut {}`, `Doughnut` is the **superclass**, and
`BostonCream` is its **subclass**. The `<` token here declares that
relationship. It is not a numeric comparison. Lox allows one direct superclass,
whose name is resolved in the declaration's surrounding scope.

Several classes can inherit from one superclass, and a subclass can itself have
subclasses. Together these relationships form a class hierarchy. Keep the
existing instance output format: `print BostonCream();` prints
`BostonCream instance`. Looking up inherited methods comes next.

### Tests

The tester will run a series of tests with `test.lox` files that contain class
inheritance declarations.

For example, if `test.lox` contains the following:

```
class Doughnut {}

class BostonCream < Doughnut {}

print Doughnut();
print BostonCream();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Doughnut instance
BostonCream instance
```

The tester varies values and contexts. These examples show the required
behavior:

Sibling subclasses in a local scope:

Input:

```
{
  class A {}

  // B is a subclass of A
  class B < A {}

  // C is also a subclass of A
  class C < A {}

  print A();
  print B();
  print C();
}
```

Stdout:

```
A instance
B instance
C instance
```

A hierarchy with several levels:

Input:

```
class Vehicle {}

// Car is a subclass of Vehicle
class Car < Vehicle {}

// Sedan is a subclass of Car
class Sedan < Car {}

print Vehicle();
print Car();
print Sedan();

{
  // Truck is a subclass of Vehicle
  class Truck < Vehicle {}
  print Truck();
}
```

Stdout:

```
Vehicle instance
Car instance
Sedan instance
Truck instance
```

The tester checks the shown instance output and exit code 0, including
declarations in local scopes.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/class/local_inherit_other.lox)
- For the book's explanation, see
  [Section 13.1: Superclasses and Subclasses](https://craftinginterpreters.com/inheritance.html#superclasses-and-subclasses).
