In this stage, you'll allow a global variable to be declared again with `var`.

### Redeclaring global variables

The new declaration replaces its value, even when the value's type changes.

Evaluate the initializer before replacing the existing value. This lets
`var a = a;` reuse the old global `a`. If that old name does not exist, the
initializer produces an undefined-variable runtime error. Local redeclaration
rules are introduced in the Resolving & Binding extension.

### Tests

The tester will run a series of tests with `test.lox` files that contain the
`var` statement.

For example, if `test.lox` contains the following

```
var a = 1;
var a = 2;
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
2
```

The tester varies the values and expressions. These examples show the required
behavior:

A redeclaration can read the previous value:

Input:

```
var hello = "after";
var hello = "before";
var hello = hello;
print hello;
```

Stdout:

```
before
```

An initializer still needs a declared name:

Input:

```
var baz = bar;
```

Stdout is empty.

Example stderr:

```
Undefined variable 'bar'.
[line 1]
```

Successful programs exit with code 0. An undefined name in an initializer
produces a runtime error and exit code 70. The tester checks stdout and exit
status, without requiring the exact diagnostic wording.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)
- For the book's explanation, see
  [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).
