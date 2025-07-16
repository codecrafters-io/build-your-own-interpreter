In this stage, you'll add support for scopes in your interpreter. Scopes are created by blocks, and they are used to group variables together. We will test variables in local scopes, nested scopes, shadowing of variables, and accessing variables outside of the scope where they are defined.

### Book reference

The code for this stage is implemented in [Section 8.5: Scope](https://craftinginterpreters.com/statements-and-state.html#scope).

### Tests

The tester will run a series of tests with `test.lox` files that contain the assignment operation.

For example, if `test.lox` contains the following

```
{
    var world = "before";
    {
        var world = "after";
        print world;
    }
    print world;
}
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
after
before
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
var baz = (91 * 16) - 61;
{
    var world = "quz" + "89";
    print world;
}
print baz;
```

Expected Output:

```
quz89
1395
```

Test Case 2:

Input:

```
{
    var quz = "before";
    {
        var quz = "after";
        print quz;
    }
    print quz;
}
```

Expected Output:

```
after
before
```

Test Case 3:

Input:

```
var bar = "global bar";
var world = "global world";
var hello = "global hello";
{
  var bar = "outer bar";
  var world = "outer world";
  {
    var bar = "inner bar";
    print bar;
    print world;
    print hello;
  }
  print bar;
  print world;
  print hello;
}
print bar;
print world;
print hello;
```

Expected Output:

```
inner bar
outer world
global hello
outer bar
outer world
global hello
global bar
global world
global hello
```

Test Case 4:

Input:

```
{
  var hello = "outer hello";
  {
    var hello = "inner hello";
    print hello;
  }
  print hello;
}
print hello;
```

Expected Output:

```
inner hello
outer hello
Undefined variable 'hello'.
[line 9]
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0. Accessing a variable outside of its scope should throw a runtime error, the exit code in that case should be 70.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)