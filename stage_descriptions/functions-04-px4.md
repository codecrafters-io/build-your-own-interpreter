In this stage, you'll reject malformed function declarations and calls.

### Declaration and call syntax

Parameter lists contain comma-separated names, while argument lists contain
comma-separated expressions. Both lists need matching parentheses.

A function declaration's body must be a block in braces, even when it contains
only one statement. For example, `fun f() 74;` is invalid.

Report syntax errors on stderr and exit with code 65. The invalid programs in
this stage produce no stdout. Diagnostic wording is not checked.

### Tests

The tester will run a series of tests with `test.lox` files that contain
malformed function declarations and calls.

For example, if `test.lox` contains the following

```
clock(;
```

The tester will run your program like this. The shown diagnostic is on stderr:

```
$ ./your_program.sh run test.lox
[line 1] Error at ';': Expect expression.
```

The tester varies the values and expressions. These examples show the required
behavior:

An invalid call boundary:

Input:

```
print clock)));
```

Example stderr:

```
[line 1] Error at ')': Expect ';' after value.
```

A function body must be a block:

Input:

```
fun f() 74;
print f();
```

Example stderr:

```
[line 1] Error at '74': Expect '{' before function body.
```

Parameters need comma separators:

Input:

```
fun foo(a, b c, d, e, f) {}
foo();
```

Example stderr:

```
[line 1] Error at 'c': Expect ')' after parameters.
```

The tester checks for exit code 65 and empty stdout.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/body_must_be_block.lox)
- The examples show possible diagnostics. The exact wording is not checked.
- For the book's explanation, see
  [Section 10.3: Function Declarations](https://craftinginterpreters.com/functions.html#function-declarations).
