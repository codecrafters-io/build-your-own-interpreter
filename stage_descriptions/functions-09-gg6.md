In this stage, you'll add support for closures in your lox interpreter.

### Book reference

The code for this stage is implemented in [Section 10.6: Local functions & Closures](https://craftinginterpreters.com/functions.html#local-functions-and-closures).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with closures.

For example, if `test.lox` contains the following

```
fun makeCounter() {
  var i = 0;
  fun count() {
    i = i + 1;
    print i;
  }

  return count;
}

var counter = makeCounter();
counter();
counter();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
1
2
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
fun makeCounter() {
  var i = 0;
  fun count() {
    i = i + 1;
    print i;
  }

  return count;
}

var counter = makeCounter();
counter();
counter();
```

Expected Output:

```
1
2
```

Test Case 2:

Input:

```
{
  var threshold = 50;

  fun isEven(n) {
    if (n == 0) return true;
    if (n > threshold) return false;
    return isOdd(n - 1);
  }

  fun isOdd(n) {
    if (n == 0) return false;
    if (n > threshold) return false;
    return isEven(n - 1);
  }

  print isEven(61);
}
```

Expected Output:

```
false
```

Test Case 3:

Input:

```
fun makeLogger(prefix) {
  var logCount = 0;

  fun log(message) {
    logCount = logCount + 1;
    print prefix + ": " + message;

    if (logCount > 6) {
      print prefix + ": Too many log lines!";
      logCount = 0;
    }
  }

  return log;
}

var debugLog = makeLogger("debug");
var errorLog = makeLogger("error");

debugLog("Starting");
debugLog("Processing");
debugLog("Finishing");
debugLog("Extra line");

errorLog("Failed!");
errorLog("Retrying...");
```

Expected Output:

```
debug: Starting
debug: Processing
debug: Finishing
debug: Extra line
error: Failed!
error: Retrying...
```

Test Case 4:

Input:

```
fun makeAccumulator(label) {
  var sum = 0;
  var count = 0;

  fun accumulate(value) {
    sum = sum + value;
    count = count + 1;

    print label;
    print count;
    print sum;
    print sum;

    if (count > 3) {
      print "reset";
      sum = 0;
      count = 0;
    }

    return sum;
  }

  return accumulate;
}

var acc1 = makeAccumulator("First:");
var acc2 = makeAccumulator("Second:");

acc1(2);
acc1(6);
acc1(3);
acc1(4);

acc2(6);
acc2(4);
```

Expected Output:

```
First:
1
2
2
First:
2
8
8
First:
3
11
11
First:
4
15
15
reset
Second:
1
6
6
Second:
2
10
10
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/closure/open_closure_in_function.lox)