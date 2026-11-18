In this stage, you'll evaluate the logical operator `or`.

### Short-circuit evaluation with `or`

It can select between any Lox values using the truthiness rule you already
implemented.

Evaluate the left operand first. If it is truthy, return that value and skip the
right operand. Otherwise, evaluate and return the right operand, even if it is
falsy. The result is an operand's value and can be a string or number.

Skipping an operand is called **short-circuit evaluation**. Skipped assignments
have no effect, and skipped expressions cannot raise runtime errors. `or` has
lower precedence than equality and higher precedence than assignment. Chains
associate to the left.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with the logical OR operator.

For example, if `test.lox` contains the following

```
print nil or "ok";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
ok
```

The tester varies the values and expressions. These examples show the required
behavior:

The result preserves an operand's value:

Input:

```
print 41 or true;
print false or 41;
print false or false or true;

print false or false;
print false or false or false;
print true or true or true or true;
```

Stdout:

```
41
41
true
false
false
true
```

Short-circuiting skips later assignments:

Input:

```
var a = "hello";
var b = "hello";
(a = false) or (b = true) or (a = "hello");
print a;
print b;
```

Stdout:

```
false
true
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/logical_operator/or.lox)
- For the book's explanation, see
  [Section 9.3: Logical Operators](https://craftinginterpreters.com/control-flow.html#logical-operators).
