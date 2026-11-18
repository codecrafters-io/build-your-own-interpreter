In this stage, you'll apply the scope rules to function calls.

### Lexical scope for functions

Lox uses **lexical scope**: a function's surrounding scopes are determined by
where it was declared. Calling it from another block does not make that block's
local variables visible to the function.

Each call has fresh parameter and local bindings. Reads of outer variables use
their current values, and assignments to those bindings remain visible after the
call. A local declaration shadows an outer name from that declaration onward. An
earlier reference in the function can still use the outer name.

In the first example, `printAndModify` reads the current global `a` before
declaring its separate local `a`.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with global and local scope.

For example, if `test.lox` contains the following

```
var a = 38;

fun printAndModify() {
  print a;
  var a = 95;
  print a;
}

print a;
a = 68;
printAndModify();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
38
68
95
```

The tester varies the values and expressions. These examples show the required
behavior:

A function can update an outer binding:

Input:

```
var counter = 89;

fun incrementCounter(amount) {
  counter = counter + amount;
  print counter;
}

{
  counter = 83;
  incrementCounter(6);
  print counter;
}
print counter;
```

Stdout:

```
89
89
89
```

Caller-local variables do not replace globals:

Input:

```
var x = 1;
var y = 2;

fun printBoth() {
  if (x < y) {
    print "x is less than y:";
    print x;
    print y;
  } else {
    print "x is not less than y:";
    print x;
    print y;
  }
}

{
  var x = 10;
  {
    var y = 20;

    var i = 0;
    while (i < 3) {
      x = x + 1;
      y = y - 1;
      print "Local x:";
      print x;
      print "Local y:";
      print y;
      i = i + 1;
    }

    if (x > y) {
      print "Local x > y";
    }

    printBoth();
  }
}
```

Stdout:

```
Local x:
11
Local y:
19
Local x:
12
Local y:
18
Local x:
13
Local y:
17
x is less than y:
1
2
```

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/closure/open_closure_in_function.lox)
- For the book's explanation, see
  [Section 10.6: Local functions & Closures](https://craftinginterpreters.com/functions.html#local-functions-and-closures).
