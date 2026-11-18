In this stage, you'll make `run` execute a sequence of statements in source
order.

### Executing statement sequences

Each `print` adds its own output line.

A semicolon ends a print statement. Newlines and indentation are whitespace, so
several statements can share a line or one statement can span lines. Newlines
inside a string remain part of that string and appear in its printed value.

### Tests

The tester will run a series of tests with `test.lox` files that contain
multiple statements.

For example, if `test.lox` contains the following

```
print "Hello, World!";
print 42;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Hello, World!
42
```

The tester varies the values and expressions. These examples show the required
behavior:

Several statements on one line:

Input:

```
print "hello"; print true;
print false;
print "bar"; print 43;
```

Stdout:

```
hello
true
false
bar
43
```

A multiline string:

Input:

```
print true != true;

print "36
10
78
";

print "There should be an empty line above this.";
```

Stdout:

```
false
36
10
78

There should be an empty line above this.
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- For the book's explanation, see
  [Section 8.1: Statements](https://craftinginterpreters.com/statements-and-state.html#statements).
