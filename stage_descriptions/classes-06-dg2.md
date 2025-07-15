In this stage, you'll add validation for the `this` keyword to ensure it's only used in appropriate contexts. This involves detecting and reporting errors when `this` is used incorrectly.

### Book reference

The code for this stage is implemented in [Section 12.6: The 'this' Keyword](https://craftinginterpreters.com/classes.html#the-this-keyword), specifically the error handling parts.

### Tests

The tester will run a series of tests with `test.lox` files that contain invalid usages of `this`.

For example, if `test.lox` contains the following:

```
print this;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
[line 1] Error at 'this': Can't use 'this' outside of a class.
```

The tester will run multiple tests with invalid `this` usage, for example:

Test Case 1:

Input:
```
fun notAMethod() {
  print this;
}
```

Expected Output:
```
[line 2] Error at 'this': Can't use 'this' outside of a class.
```

Test Case 2:

Input:
```
class Person {
  sayName() {
    print this();
  }
}
Person().sayName();
```

Expected Output:
```
Can only call functions and classes.
[line 3]
```

Test Case 3:

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

Expected Output:
```
Undefined property 'feeling'.
[line 5]
```

The tester will assert that for valid usages of this, the exit code should be 0. For invalid returns, the program should exit with code 65 (compile error) and print an appropriate error message.

### Notes

- These error formats match those in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/this/this_in_top_level_function.lox)
- Error messages should be written to stderr, but the exact error message is not checked.