In this stage, you'll execute **blocks**, groups of declarations and statements
enclosed in `{` and `}`.

### Block syntax

Execute their contents in order, including nested blocks. An empty block is also
valid.

A block ends with `}` and needs no following semicolon. Statements inside it
still follow their own syntax. A missing closing brace is a syntax error with
exit code 65. Blocks also delimit local scopes, whose visibility rules are
tested in later stages.

### Tests

The tester will run a series of tests with `test.lox` files that contain blocks
and variable references.

For example, if `test.lox` contains the following

```
{
    var foo = "before";
    print foo;
}
{
    var foo = "after";
    print foo;
}
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
before
after
```

The tester varies the values and expressions. These examples show the required
behavior:

Nested blocks:

Input:

```
{
    var hello = 88;
    {
        var foo = 88;
        print foo;
    }
    print hello;
}
```

Stdout:

```
88
88
```

An unclosed block:

Input:

```
{
    var bar = 11;
    var world = 11;
    {
        print bar + world;
}
```

Stdout is empty.

Example stderr:

```
[line 6] Error at end: Expect '}' .
```

Valid programs produce the shown stdout and exit with code 0. An unclosed block
produces a diagnostic on stderr and exit code 65. The exact diagnostic wording
is not checked.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- For the book's explanation, see
  [Section 8.5.2: Block syntax and semantics](https://craftinginterpreters.com/statements-and-state.html#block-syntax-and-semantics).
