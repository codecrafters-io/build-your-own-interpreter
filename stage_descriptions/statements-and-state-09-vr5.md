In this stage, you'll add support for block syntax in your interpreter. Blocks are enclosed in curly braces `{}` and are used to group statements together. They are also used to create local scopes. We will test scopes in the next stage, in this stage you just need to handle the block syntax.

### Book reference

The code for this stage is implemented in [Section 8.5.2: Block syntax and semantics](https://craftinginterpreters.com/statements-and-state.html#block-syntax-and-semantics).

### Tests

The tester will run a series of tests with `test.lox` files that contain the assignment operation.

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

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
{
    var hello = "baz";
    print hello;
}
```

Expected Output:

```
baz
```

Test Case 2:

Input:

```
{
    var world = "before";
    print world;
}
{
    var world = "after";
    print world;
}
```

Expected Output:

```
before
after
```

Test Case 3:

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

Expected Output:

```
88
88
```

Test Case 4:

Input:

```
{
    var bar = 11;
    var world = 11;
    {
        print bar + world;
}
```

Expected Output:

```
[line 6] Error at end: Expect '}' .
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0. If there is any blocks that are opened but not closed, it should throw a syntax error, the exit code in that case should be 65.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)