In this stage, you'll add support for native functions in your lox interpreter.

You can just define a single native function for now, we will go with `clock()` which returns the number of seconds elapsed since midnight January 1, 1970 UTC.

The return type for `clock()` can be a floating point number or an integer, the tester will cast it to an integer and then check if it is in a reasonable range.

### Book reference

The code for this stage is implemented in [Section 10.2: Native Functions](https://craftinginterpreters.com/functions.html#native-functions).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with native functions.

For example, if `test.lox` contains the following

```
print clock();
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
1731411035
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
print clock() + 75;
```

Expected Output:

```
1731411035
```

Test Case 2:

Input:

```
print clock() / 1000;
```

Expected Output:

```
1731410
```

Test Case 3:

Input:

```
var startTime = clock();
var timeoutSeconds = 2;

// Check if less than 2 seconds have elapsed
if ((clock() >= startTime) and (clock() <= (startTime + timeoutSeconds))) {
  print "Operation in progress...";
} else {
  print "Operation timed out!";
}
```

Expected Output:

```
Operation in progress...
```

Test Case 4:

Input:

```
// Countdown from 3 seconds
var startTime = clock();
var totalDuration = 3; // 3 seconds countdown
var lastCheck = startTime;
var completed = false;

while (!completed) {
  var currentTime = clock();
  var elapsedTime = currentTime - startTime;
  var remainingTime = totalDuration - elapsedTime;

  // Update progress every second
  if (currentTime >= lastCheck + 1) {
    if (remainingTime >= 2) {
      print "Plenty of time remaining: ";
      print remainingTime;
    } else if (remainingTime >= 1) {
      print "Getting closer: ";
      print remainingTime;
    } else if (remainingTime > 0) {
      print "Almost there: ";
      print remainingTime;
    }
    lastCheck = currentTime;
  }

  // Check for completion
  if (elapsedTime >= totalDuration) {
    completed = true;
    print "Countdown complete!";
  } else if (elapsedTime < 0) {
    // Handle clock overflow or system time changes
    print "Time error detected!";
    completed = true;
  }
}
```

Expected Output:

```
Plenty of time remaining:
2
Getting closer:
1
Countdown complete!
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/print.lox)