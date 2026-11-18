In this stage, you'll add the logical operator `and`, using the same
short-circuit model as `or`.

### Short-circuit evaluation with `and`

Evaluate the left operand first. If it is falsy, return that value and skip the
right operand. Otherwise, evaluate and return the right operand. A chain returns
its first falsy value, or its last value when all operands are truthy.

`and` binds more tightly than `or` and less tightly than equality. Thus
`a or b and c` groups as `a or (b and c)`. Equal-precedence `and` operations
associate to the left. Keep the result's original type.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with the logical AND operator.

For example, if `test.lox` contains the following

```
print false and "ok";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
false
```

The tester varies the values and expressions. These examples show the required
behavior:

Truthiness applies to all operand types:

Input:

```
if (false and "bad") print "foo";
if (nil and "bad") print "foo";

if (true and "hello") print "hello";
if (97 and "baz") print "baz";
if ("baz" and "baz") print "baz";
if ("" and "bar") print "bar";
```

Stdout:

```
hello
baz
baz
bar
```

Short-circuiting skips later assignments:

Input:

```
var a = "quz";
var b = "quz";
(a = true) and (b = false) and (a = "bad");
print a;
print b;
```

Stdout:

```
true
false
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/logical_operator/and.lox)
- For the book's explanation, see
  [Section 9.3: Logical Operators](https://craftinginterpreters.com/control-flow.html#logical-operators).
