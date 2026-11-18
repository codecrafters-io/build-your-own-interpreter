In this stage, you'll keep an enclosing function's local bindings available to a
returned nested function.

### Closures and retained bindings

A **closure** is a function together with access to the environment where it was
declared.

In `makeCounter`, the returned `count` function can still read and update `i`
after `makeCounter` has returned. It retains access to the same binding on every
call, so the outputs are `1`, then `2`. Capturing a frozen copy of the value
would lose those updates.

Each call to the outer function creates separate local bindings. Functions
created during the same call can share those bindings, while functions from
separate calls keep independent state. The accumulator example checks this
distinction.

### Tests

The tester will run a series of tests with `test.lox` files that contain
programs with closures.

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

The tester varies the values and expressions. These examples show the required
behavior:

Separate calls retain separate state:

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

Stdout:

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

The tester will assert that the stdout of your program matches the format above,
and that the exit code is 0.

### Notes

- This output format matches the spec in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/closure/open_closure_in_function.lox)
- For the book's explanation, see
  [Section 10.6: Local functions & Closures](https://craftinginterpreters.com/functions.html#local-functions-and-closures).
