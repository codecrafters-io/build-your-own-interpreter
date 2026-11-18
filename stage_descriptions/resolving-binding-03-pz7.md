In this stage, you'll reject two declarations of the same name in one local
scope.

### Duplicate local declarations

Function parameters belong to the function body's local scope, so duplicate
parameter names and redeclaring a parameter in that body are also invalid.

Keep global redeclaration and shadowing in a nested block valid. Those are
different cases: shadowing introduces a binding in another scope.

Detect local duplicates during resolution. If any occur, execute none of the
program, even statements before the invalid declaration. Send a diagnostic to
stderr and exit with code 65, with empty stdout.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with variable redeclarations.

For example, if `test.lox` contains the following:

```
{
  var a = "value";
  var a = "other";
}
```

The tester will run your program like this. The shown diagnostic is on stderr,
and stdout is empty:

```
$ ./your_program.sh run test.lox
[line 3] Error at 'a': Already a variable with this name in this scope.
```

The tester varies the values and expressions. These examples show the required
behavior:

A parameter and a local declaration share a scope:

Input:

```
fun foo(a) {
  var a;
}
```

Example stderr:

```
[line 2] Error at 'a': Already a variable with this name in this scope.
```

Parameter names must be unique:

Input:

```
fun foo(arg, arg) {
  "body";
}
```

Example stderr:

```
[line 1] Error at 'arg': Already a variable with this name in this scope.
```

An error prevents earlier statements from running:

Input:

```
var a = "1";
print a;

var a;
print a;

var a = "2";
print a;

{
  var a = "1";
  var a = "2";
  print a;
}
```

Example stderr:

```
[line 12] Error at 'a': Already a variable with this name in this scope.
```

Valid global redeclarations exit with code 0. The invalid local examples produce
no stdout and exit with code 65.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/variable/duplicate_local.lox)
- The exact diagnostic wording is not checked. The tester checks stdout and the
  exit code.
- For the book's explanation, see
  [Section 11.3: A Resolver Class](https://craftinginterpreters.com/resolving-and-binding.html#a-resolver-class).
