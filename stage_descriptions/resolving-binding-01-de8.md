The closures you added in the Functions extension retain access to outer
variables. This extension makes the choice of binding stable and catches invalid
uses before a program runs. In this stage, you'll resolve identifiers before
execution.

### Resolving names before execution

**Resolution** determines which declaration a name refers to. A local reference
uses the nearest enclosing declaration visible at that reference's source
position. A later local declaration must not change that choice, even when a
closure is called afterward. The binding's value can still change through
assignment.

Run a separate **resolver** pass over the AST between parsing and execution.
This is static analysis: it examines the program without executing its
statements. The book calls this work compile time even though your interpreter
need not generate machine code.

Apply resolution to reads and assignments, including function names, and examine
every supported expression and statement form. Names with no matching local
declaration use the global environment at runtime. In the example below, both
calls must use the global binding.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with identifier resolution and binding.

For example, if `test.lox` contains the following:

```
var variable = "global";

{
  fun f() {
    print variable;
  }

  f();

  var variable = "local";

  f();
}
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
global
global
```

The tester varies the values and expressions. These examples show the required
behavior:

Function names follow the same binding rule:

Input:

```
fun global() {
  print "global";
}

{
  fun f() {
    global();
  }

  f();

  fun global() {
    print "local";
  }

  f();
}
```

Stdout:

```
global
global
```

Assignment keeps its original target:

Input:

```
var count = 0;

{
  fun makeCounter() {
    fun counter() {
      count = count + 1;
      print count;
    }
    return counter;
  }

  var counter1 = makeCounter();
  counter1();
  counter1();

  var count = 0;

  counter1();
}
```

Stdout:

```
1
2
3
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/closure/open_closure_in_function.lox)
- For the book's explanation, see
  [Section 11.3: A Resolver Class](https://craftinginterpreters.com/resolving-and-binding.html#a-resolver-class).
