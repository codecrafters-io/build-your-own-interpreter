In this stage, you'll enforce the return rules for initializer methods.

### Returning from initializers

A bare `return;` ends `init` early, while the initializer's result remains its
bound instance. Reaching the end of `init` has the same result, including when
it is called explicitly.

An initializer cannot contain a return with a value, including `return this;` or
`return nil;`. Reject that program during resolution, before any statement
executes. Report the error on stderr, leave stdout empty, and exit with code 65.

A function declared inside an initializer has its own return rules and may
return a value. The restriction applies to returns from `init` itself.

### Tests

The tester will run a series of tests with `test.lox` files that contain return
statements within constructors.

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

The tester varies values and contexts. These examples show the required
behavior:

Returning this is still a value return:

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

Stdout is empty.

Example stderr:

```
[line 5] Error at 'return': Can't return a value from an initializer.
```

Returning another call's result is invalid:

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

Stdout is empty.

Example stderr:

```
[line 3] Error at 'return': Can't return a value from an initializer.
```

The valid bare-return program prints `world` and exits with code 0. The invalid
value-return programs produce empty stdout and exit with code 65.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/master/test/constructor/return_in_nested_function.lox)
- The tester checks stdout and exit status. The exact diagnostic wording is not
  checked.
- For the book's explanation, see
  [Section 12.7: Constructors](https://craftinginterpreters.com/classes.html#constructors),
  specifically the parts about return statements in initializers.
