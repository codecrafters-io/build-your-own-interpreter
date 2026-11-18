In this stage, you'll reject `return` outside a function body.

### Return context

A return inside a function may appear within nested blocks, conditionals, or
loops. A top-level block does not create a function context.

This is a static rule, so check every return while resolving the program,
including returns on paths that would never execute. A nested function's returns
belong to that function. Finishing its declaration does not make subsequent
outer code part of its body.

If any return is invalid, execute no statements, report a diagnostic on stderr,
and exit with code 65. Valid function returns keep their existing behavior.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with return statements in various contexts.

For example, if `test.lox` contains the following:

```
fun foo() {
  return "at function scope is ok";
}

return;
```

The tester will run your program like this. The shown diagnostic is on stderr,
and stdout is empty:

```
$ ./your_program.sh run test.lox
[line 5] Error at 'return': Can't return from top-level code.
```

The tester varies the values and expressions. These examples show the required
behavior:

A top-level block cannot return:

Input:

```
{
  return "not allowed in a block either";
}

fun allowed() {
  if (true) {
    return "this is fine";
  }
  return;
}
```

Example stderr:

```
[line 2] Error at 'return': Can't return from top-level code.
```

A nested declaration does not enclose later statements:

Input:

```
fun outer() {
  fun inner() {
    return "ok";
  }

  return "also ok";
}

if (true) {
  fun nested() {
    return;
  }

  return "not ok";
}
```

Example stderr:

```
[line 14] Error at 'return': Can't return from top-level code.
```

The invalid examples must produce no stdout and exit with code 65. Returns
inside functions must remain valid.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/return/at_top_level.lox)
- The exact diagnostic wording is not checked. The tester checks stdout and the
  exit code.
- For the book's explanation, see
  [Section 11.5.1: Invalid Return Errors](https://craftinginterpreters.com/resolving-and-binding.html#invalid-return-errors).
