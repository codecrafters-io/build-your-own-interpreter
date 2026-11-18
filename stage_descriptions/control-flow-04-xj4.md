In this stage, you'll support an `if` statement inside another conditional's
body.

### Nested conditionals

Blocks can group nested statements, but a single nested `if` needs no braces.

Without braces, an `else` belongs to the nearest preceding `if` that does not
already have an `else`. This is often called the **dangling-else rule**. In
`if (true) if (false) print "world"; else print "baz";`, the `else` belongs to
the inner `if`, so the program prints `baz`.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with `if` statements.

For example, if `test.lox` contains the following

```
if (true) if (true) print "nested true";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
nested true
```

The tester varies the values and expressions. These examples show the required
behavior:

Combining nested conditions:

Input:

```
var stage = "unknown";
var age = 29;
if (age < 18) {
    if (age < 13) { stage = "child"; }
    else if (age < 16) { stage = "young teenager"; }
    else { stage = "teenager"; }
}
else if (age < 65) {
    if (age < 30) { stage = "young adult"; }
    else if (age < 50) { stage = "adult"; }
    else { stage = "middle-aged adult"; }
}
else { stage = "senior"; }
print stage;

var isAdult = age >= 18;
if (isAdult) {
    print "eligible for voting: true";
    if (age < 25) {
        print "first-time voter: likely";
    }
    else { print "first-time voter: unlikely"; }
}
else { print "eligible for voting: false"; }

if (age < 16) { print "eligible for driving: false"; }
else if (age < 18) {
    print "eligible for driving: learner's permit";
    if (age < 17) { print "supervised driving required"; }
    else { print "unsupervised driving allowed with restrictions"; }
}
else { print "eligible for driving: full license"; }

if (age < 21) { print "eligible for drinking (US): false"; }
else {
    print "eligible for drinking (US): true";
    if (age < 25) { print "remember: drink responsibly!"; }
}
```

Stdout:

```
young adult
eligible for voting: true
first-time voter: unlikely
eligible for driving: full license
eligible for drinking (US): true
```

An else binds to the inner if:

Input:

```
if (true) if (false) print "world"; else print "baz";
```

Stdout:

```
baz
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/dangling_else.lox)
- For the book's explanation, see
  [Section 9.2: Conditional execution](https://craftinginterpreters.com/control-flow.html#conditional-execution).
