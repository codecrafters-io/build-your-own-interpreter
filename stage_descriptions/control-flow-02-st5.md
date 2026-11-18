In this stage, you'll add an optional `else` branch to `if`.

### Choosing an else-branch

The syntax is `if (<condition>) <then-statement> else <else-statement>`.

Evaluate the condition once. Run the then-branch for a truthy value or the
else-branch for a falsy value. Exactly one branch runs, so an expression in the
other branch has no effects. Each branch can be a single statement or a block.
`else` belongs to an `if` and cannot stand alone.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with `if` statements.

For example, if `test.lox` contains the following

```
if (true) print "if branch"; else print "else branch";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
if branch
```

The tester varies the values and expressions. These examples show the required
behavior:

Mixing statements and block bodies:

Input:

```
if (false) {
  print "if block";
} else print "else statement";

if (false) print "if statement"; else {
  print "else block";
}
```

Stdout:

```
else statement
else block
```

Updating state in the selected branch:

Input:

```
var celsius = 67;
var fahrenheit = 0;
var isHot = false;

{
  fahrenheit = celsius * 9 / 5 + 32;
  print celsius; print fahrenheit;

  if (celsius > 30) {
    isHot = true;
    print "It's a hot day. Stay hydrated!";
  } else {
    print "It's cold today. Wear a jacket!";
  }

  if (isHot) { print "Remember to use sunscreen!"; }
}
```

Stdout:

```
67
152.6
It's a hot day. Stay hydrated!
Remember to use sunscreen!
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/if/else.lox)
- For the book's explanation, see
  [Section 9.2: Conditional execution](https://craftinginterpreters.com/control-flow.html#conditional-execution).
