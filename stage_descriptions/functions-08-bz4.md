In this stage, you'll add support for global and local scope in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.6: Local functions & Closures](https://craftinginterpreters.com/functions.html#local-functions-and-closures).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with global and local scope.

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

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

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

Expected Output:

```
38
68
95
```

Test Case 2:

Input:

```
var count = 3;

fun tick() {
  if (count > 0) {
    print count;
    count = count - 1;
    return false;
  }
  print "Blast off!";
  return true;
}

while (!tick()) {}
```

Expected Output:

```
3
2
1
Blast off!
```

Test Case 3:

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

Expected Output:

```
89
89
89
```

Test Case 4:

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
      print "Local x: ";
      print x;
      print "Local y: ";
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

Expected Output:

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

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/closure/open_closure_in_function.lox)