In this stage, you'll let a program store a value under a variable name and read
it in later expressions.

### Variable declarations and bindings

Support declarations of the form `var <name> = <expression>;`.

The expression after `=` is the **initializer**. Its evaluated value becomes the
variable's initial value. A **binding** associates the name with that value. The
current collection of bindings is often called an **environment**.

A variable expression, such as `a` in `print a;`, reads the bound value.
Declarations themselves print nothing. At this point the variables are global,
meaning they belong to the program's outermost level. Declarations without
initializers come later.

### Tests

The tester will run a series of tests with `test.lox` files that contain the
`var` statement.

For example, if `test.lox` contains the following

```
var a = "foo";
print a;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
foo
```

The tester varies the values and expressions. These examples show the required
behavior:

An initializer can read an earlier variable:

Input:

```
var quz = 76;
var baz = quz;
print baz + quz;
```

Stdout:

```
152
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/variable/in_nested_block.lox)
- For the book's explanation, see
  [Section 8.2: Global Variables](https://craftinginterpreters.com/statements-and-state.html#global-variables).
