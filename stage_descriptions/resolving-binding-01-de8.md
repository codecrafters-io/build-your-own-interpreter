In this stage, you'll add support for identifier resolution and binding at compile time.

You will have to implement a resolver that will traverse the AST and resolve identifiers to their corresponding bindings, and execute the resolver in a separate pass over the AST.

We say identifier resolution because in this stage you'll resolve variable declarations, variable assignments, function declarations and all other AST nodes.

### Book reference

The code for this stage is implemented in [Section 11.3: A Resolver Class](https://craftinginterpreters.com/resolving-and-binding.html#a-resolver-class).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with identifier resolution and binding.

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

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

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

Expected Output:

```
global
global
```

Test Case 2:

Input:

```
var x = "global";

fun outer() {
  var x = "outer";

  fun middle() {
    fun inner() {
      print x;
    }

    inner();

    var x = "middle";

    inner();
  }

  middle();
}

outer();
```

Expected Output:

```
outer
outer
```

Test Case 3:

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

Expected Output:

```
1
2
3
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/closure/open_closure_in_function.lox)
- The resolver should ensure that variables are resolved to their correct scopes at compile time