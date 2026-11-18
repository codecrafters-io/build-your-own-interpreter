In this stage, you'll report a runtime error when an expression reads a name
with no existing binding.

### Undefined variables

A later declaration cannot supply a value to an earlier read.

Stop at the first failed lookup, send a diagnostic to stderr, and exit with
code 70. Preserve output from statements that already ran, and do not run later
statements. The same rule applies when the missing name occurs inside an
initializer or a larger expression.

### Tests

The tester will run a series of tests with `test.lox` files that access
variables that haven't been declared yet.

For example, if `test.lox` contains the following

```
print a;
```

The tester will run your program like this. This example has empty stdout, with
the shown diagnostic on stderr:

```
$ ./your_program.sh run test.lox
Undefined variable 'a'.
[line 1]
```

The tester varies the values and expressions. These examples show the required
behavior:

Output before the error is preserved:

Input:

```
print 22;
print x;
```

Stdout:

```
22
```

Example stderr:

```
Undefined variable 'x'.
[line 2]
```

An error inside an initializer:

Input:

```
var hello = 85;
var result = (hello + bar) / world;
print result;
```

Stdout is empty.

Example stderr:

```
Undefined variable 'bar'.
[line 2]
```

The tester checks for exit code 70 and the stdout produced before the error.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)
- The exact error message is not checked in this stage.
- For the book's explanation, see
  [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).
