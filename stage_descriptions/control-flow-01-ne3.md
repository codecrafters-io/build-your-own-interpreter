Your interpreter can execute statements in order and retain values in variables.
Building on Statements & State, this extension adds **control flow**, rules that
choose which statements run or repeat. In this stage, you'll add `if` without
`else`.

### Conditional execution

The syntax is `if (<condition>) <statement>`. Evaluate the condition once and
apply the Lox truthiness rule from unary `!`: only `false` and `nil` are falsy.
Run the body only when the condition is truthy. A skipped body produces no
output or other effects.

The body can be one statement or a block containing several statements.
Execution then continues after the `if`.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with `if` statements.

For example, if `test.lox` contains the following

```
if (true) print "good";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
good
```

The tester varies the values and expressions. These examples show the required
behavior:

An assignment can supply the condition:

Input:

```
var a = false;
if (a = true) {
  print (a == true);
}
```

Stdout:

```
true
```

Choosing behavior from a variable:

Input:

```
var stage = "unknown";
var age = 50;
if (age < 18) { stage = "child"; }
if (age >= 18) { stage = "adult"; }
print stage;

var isAdult = age >= 18;
if (isAdult) { print "eligible for voting: true"; }
if (!isAdult) { print "eligible for voting: false"; }
```

Stdout:

```
adult
eligible for voting: true
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/if.lox)
- For the book's explanation, see
  [Section 9.2: Conditional execution](https://craftinginterpreters.com/control-flow.html#conditional-execution).
