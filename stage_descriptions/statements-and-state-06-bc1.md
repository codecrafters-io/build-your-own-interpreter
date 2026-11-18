Your interpreter already evaluates explicit initializers. In this stage, you'll
also accept `var <name>;` and give the new variable the value `nil`.

### Default variable values

This declaration creates a binding even though it omits an initializer. Reading
that variable succeeds and produces `nil`. Reading a name with no declaration
still causes an undefined-variable runtime error.

### Tests

The tester will run a series of tests with `test.lox` files that contain the
`var` statement.

For example, if `test.lox` contains the following

```
var a;
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
nil
```

The tester varies the values and expressions. These examples show the required
behavior:

Explicit and omitted initializers together:

Input:

```
var quz = 73 + 26 * 20;
print quz;
var hello = 26 * 20;
print quz + hello;
var foo;
print foo;
```

Stdout:

```
593
1113
nil
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)
- For the book's explanation, see
  [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).
