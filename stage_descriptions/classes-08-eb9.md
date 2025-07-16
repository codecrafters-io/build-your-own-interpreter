In this stage, you'll handle special return behavior for constructors. In Lox, constructors (`init()` methods) have special rules for return statements: they can contain an empty return, but cannot return a value.

### Book reference

The code for this stage is implemented in [Section 12.7: Constructors](https://craftinginterpreters.com/classes.html#constructors), specifically the parts about return statements in initializers.

### Tests

The tester will run a series of tests with `test.lox` files that contain return statements within constructors.

For example, if `test.lox` contains the following:

```
class Person {
  init() {
    print "world";
    return;
  }
}

Person();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
world
```

The tester will run multiple such tests with different return patterns in constructors, for example:

Test Case 1:

Input:
```
class ThingDefault {
  init() {
    this.x = "foo";
    this.y = 42;
    return this;
  }
}
var out = ThingDefault();
print out;
```

Expected Output:
```
[line 5] Error at 'return': Can't return a value from an initializer.
```

Test Case 2:

Input:
```
class Foo {
  init() {
    return "something else";
  }
}

Foo();
```

Expected Output:
```
[line 3] Error at 'return': Can't return a value from an initializer.
```

Test Case 3:

Input:
```
class Foo {
  init() {
    return this.callback();
  }

  callback() {
    return "callback";
  }
}

Foo();
```

Expected Output:
```
[line 3] Error at 'return': Can't return a value from an initializer.
```

The tester will assert that for valid returns, the exit code should be 0. For invalid returns, the program should exit with code 65 (compile error) and print an appropriate error message.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/master/test/constructor/return_in_nested_function.lox)
- Error messages should be written to stderr, but the exact error message is not checked.