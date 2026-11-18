In this stage, you'll reject a read of a local variable inside its own
initializer.

### Local variable initialization

The local name has been declared, but its initial value is not yet available. An
outer variable with the same name does not supply that value.

For example, `{ var a = a; }` is invalid even if a global `a` exists. The rule
also applies when the read is nested inside another expression, such as a
function argument.

Global redeclaration keeps its earlier behavior: `var a = a;` can read an
existing global `a`. If no such global exists, that read remains a runtime
error. A local self-initialization error must be found by the resolver before
any statements run. Report it on stderr, leave stdout empty, and exit with
code 65.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with variable self-initialization.

For example, if `test.lox` contains the following:

```
var a = "value";
var a = a;      // This is allowed in global scope
print a;        // Should print "value"
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
value
```

The tester varies the values and expressions. These examples show the required
behavior:

An outer binding does not make local self-initialization valid:

Input:

```
var a = "outer";
{
  var a = a;    // Error: Can't read local variable in its own initializer
}
```

Example stderr:

```
[line 3] Error at 'a': Can't read local variable in its own initializer.
```

A read inside an argument is still part of the initializer:

Input:

```
fun returnArg(arg) {
  return arg;
}

var b = "global";
{
  var a = "first";
  var b = returnArg(b);    // Error: Can't read local variable in its own initializer
  print b;
}

var b = b + " updated";
print b;
```

Example stderr:

```
[line 8] Error at 'b': Can't read local variable in its own initializer.
```

The global redeclaration example prints `value` and exits with code 0. The
invalid local examples produce no stdout and exit with code 65.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/variable/use_local_in_initializer.lox)
- The exact diagnostic wording is not checked. The tester checks stdout and the
  exit code.
- For the book's explanation, see
  [Section 11.5: Resolution Errors](https://craftinginterpreters.com/resolving-and-binding.html#resolution-errors).
