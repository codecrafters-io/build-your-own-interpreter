In this stage, you'll add `while (<condition>) <statement>`.

### Repeating a statement

A loop repeatedly executes its body while its condition is truthy.

Evaluate the condition before every iteration, including the first. A falsy
initial condition skips the body entirely. After the body finishes, evaluate the
condition again using the current variable values. The body can be a single
statement or a block, with the usual scope rules.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with `while` statements.

For example, if `test.lox` contains the following

```
var foo = 0;
while (foo < 3) print foo = foo + 1;
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

A block can print and update state:

Input:

```
var quz = 0;
while (quz < 3) {
  print quz;
  quz = quz + 1;
}
```

Stdout:

```
0
1
2
```

Repeated updates generate a sequence:

Input:

```
var n = 10;
var fm = 0;
var fn = 1;
var index = 0;

while (index < n) {
  print fm;
  var temp = fm;
  fm = fn;
  fn = temp + fn;
  index = index + 1;
}
```

Stdout:

```
0
1
1
2
3
5
8
13
21
34
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/while/syntax.lox)
- For the book's explanation, see
  [Section 9.4: While loops](https://craftinginterpreters.com/control-flow.html#while-loops).
