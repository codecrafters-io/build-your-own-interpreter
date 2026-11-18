In this stage, you'll distinguish invalid uses of `this` from runtime errors
involving a valid receiver.

### Valid and invalid uses of `this`

Using `this` outside a class method's lexical context is a resolution error,
including inside a top-level function. Reject the whole program before
execution, report the error on stderr, and exit with code 65. A nested function
inside a method may still capture `this`, under the existing closure rules.

When `this` is valid, its value is an instance. Instances are not callable, so
`this()` is a runtime error. Reading a missing field through `this` is also a
runtime error. Both use stderr and exit code 70. A local variable named
`feeling` does not create a field named `feeling`.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid
usages of `this`.

For example, if `test.lox` contains the following:

```
print this;
```

The tester will run your program like this. The shown diagnostic is on stderr,
and stdout is empty:

```
$ ./your_program.sh run test.lox
[line 1] Error at 'this': Can't use 'this' outside of a class.
```

The tester varies values and contexts. These examples show the required
behavior:

A top-level function has no receiver:

Input:

```
fun notAMethod() {
  print this;
}
```

Stdout is empty.

Example stderr:

```
[line 2] Error at 'this': Can't use 'this' outside of a class.
```

A valid receiver is not callable:

Input:

```
class Person {
  sayName() {
    print this();
  }
}
Person().sayName();
```

Stdout is empty.

Example stderr:

```
Can only call functions and classes.
[line 3]
```

A local variable does not create an instance field:

Input:

```
class Confused {
  method() {
    fun inner(instance) {
      var feeling = "confused";
      print this.feeling;
    }
    return inner;
  }
}

var instance = Confused();
var m = instance.method();
m(instance);
```

Stdout is empty.

Example stderr:

```
Undefined property 'feeling'.
[line 5]
```

The first two examples fail during resolution with exit code 65. The `this()`
and missing-field examples fail at runtime with code 70. Each shown program has
empty stdout. Valid uses of `this` must still work.

### Notes

- These error formats match those in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/this/this_in_top_level_function.lox)
- The tester checks stdout and exit status. The exact diagnostic wording is not
  checked.
- For the book's explanation, see
  [Section 12.6: The 'this' Keyword](https://craftinginterpreters.com/classes.html#the-this-keyword),
  specifically the error handling parts.
