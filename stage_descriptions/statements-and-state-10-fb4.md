In this stage, you'll give each block a **local scope**, the region where its
declared variables are visible.

### Scope and shadowing

Variables declared outside all blocks are global. A nested block can read
variables from enclosing scopes.

A read or assignment uses the nearest enclosing binding with that name. A local
declaration with an existing outer name **shadows** it: the new local binding is
separate, and the outer value remains unchanged. Assigning to an outer binding
from an inner block does update that outer value.

After a block ends, its local names are no longer visible. Looking up a name
that exists in no enclosing scope is a runtime error. Keep output produced
before that error and stop with exit code 70.

### Tests

The tester will run a series of tests with `test.lox` files that contain blocks
and variable references.

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

The tester varies the values and expressions. These examples show the required
behavior:

Lookup across nested scopes:

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

Stdout:

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

A local name is unavailable after its block:

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

Stdout:

```
inner hello
outer hello
```

Example stderr:

```
Undefined variable 'hello'.
[line 9]
```

Successful programs exit with code 0. An undefined-variable runtime error exits
with code 70. The tester checks stdout and exit status, without requiring the
exact diagnostic wording.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)
- For the book's explanation, see
  [Section 8.5: Scope](https://craftinginterpreters.com/statements-and-state.html#scope).
