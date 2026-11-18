In this stage, you'll add `for` loops, which put a loop's setup, condition, and
update into one header:
`for (<initializer>; <condition>; <increment>) <statement>`.

### The parts of a `for` loop

The initializer runs once. Before each iteration, evaluate the condition and
stop if it is falsy. After each completed body execution, evaluate the
increment, then check the condition again. Each clause can be omitted. An
omitted condition behaves as `true`, while an omitted initializer or increment
does nothing.

The initializer can be a `var` declaration or an expression. The condition and
increment are expressions. Keep both semicolon separators even when clauses are
omitted. A variable declared in the initializer is local to the loop, including
its clauses and body, and is unavailable afterward. The body can be a single
statement or a block.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with `for` statements.

For example, if `test.lox` contains the following

```
for (var baz = 0; baz < 3;) print baz = baz + 1;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
1
2
3
```

The tester varies the values and expressions. These examples show the required
behavior:

Omitting clauses:

Input:

```
var world = 0;
for (; world < 2; world = world + 1) print world;

for (var foo = 0; foo < 2;) {
  print foo;
  foo = foo + 1;
}
```

Stdout:

```
0
1
0
1
```

Loop-local bindings and shadowing:

Input:

```
var quz = "after";
{
  var quz = "before";

  for (var quz = 0; quz < 1; quz = quz + 1) {
    print quz;
    var quz = -1;
    print quz;
  }
}

{
  for (var quz = 0; quz > 0; quz = quz + 1) {}

  var quz = "after";
  print quz;

  for (quz = 0; quz < 1; quz = quz + 1) {
    print quz;
  }
}
```

Stdout:

```
0
-1
after
0
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/for/syntax.lox)
- For the book's explanation, see
  [Section 9.5: For Loops](https://craftinginterpreters.com/control-flow.html#for-loops).
