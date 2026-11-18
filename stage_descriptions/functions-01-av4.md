This extension adds functions to your interpreter, building on expression
evaluation, variables, and Control Flow. In this stage, you'll introduce
function calls through one built-in function, `clock()`.

### Calling the native `clock` function

A **native function** is implemented in the language you're using to write the
interpreter and exposed to Lox code. It lets a Lox program use capabilities such
as reading the system clock. A function value is **callable**, meaning that the
program can invoke it with parentheses.

Make `clock` available as a global function. Calling `clock()` takes no
arguments and returns the current number of seconds since midnight on January 1,
1970 UTC, also called Unix time. It may return a whole number or a fractional
number.

A call is an expression, so its result can participate in arithmetic or
comparisons. The expression before the call's parentheses is the **callee**, the
value to invoke. The parentheses request the call. They bind more tightly than
unary or binary operators, so `-clock()` negates the returned number.

### Tests

The tester runs programs through:

```
$ ./your_program.sh run test.lox
```

For example, `test.lox` can contain:

```
print clock();
```

Print the current timestamp to stdout and exit with code 0. A value such as
`1731411035` is illustrative. The value changes with the time, so it must not be
hardcoded.

The tester also uses the returned value in expressions such as `clock() + 75`
and `clock() / 1000`. It accepts integer or fractional output, converts it to an
integer for comparison, and allows a small timing tolerance.

Repeated calls must observe the current time. For example:

```
var startTime = clock();
var timeoutSeconds = 2;

if ((clock() >= startTime) and (clock() <= (startTime + timeoutSeconds))) {
  print "Operation in progress...";
} else {
  print "Operation timed out!";
}
```

When the check runs within the two-second window, stdout is:

```
Operation in progress...
```

The tester also uses a loop that waits for the clock to advance. A fixed return
value would never let that loop finish.

### Notes

- Only `clock` is required as a native function. Functions declared in Lox
  source come next.
- For the book's explanation, see
  [Section 10.2: Native Functions](https://craftinginterpreters.com/functions.html#native-functions).
- Function output examples also appear in the
  [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/function/print.lox).
