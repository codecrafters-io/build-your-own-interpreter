In this stage, you'll add support for class inheritance in your Lox interpreter. This will allow users to define class hierarchies using the `<` operator to specify a superclass.

### Book reference

The code for this stage is implemented in [Section 13.1: Superclasses and Subclasses](https://craftinginterpreters.com/inheritance.html#superclasses-and-subclasses).

### Tests

The tester will run a series of tests with `test.lox` files that contain class inheritance declarations.

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

The tester will run multiple such tests with inheritance in different contexts, for example:

Test Case 1:

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

Expected Output:
```
A instance
B instance
C instance
```

Test Case 2:

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

Expected Output:
```
Vehicle instance
Car instance
Sedan instance
Truck instance
```

The tester will assert that your program correctly handles class inheritance declarations and follows the same instance printing rules as regular classes.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/class/local_inherit_other.lox)
- Subclasses should print their instances in the same format as regular classes
- Inheritance declarations should work in any scope where class declarations are valid