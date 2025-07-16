In this stage, you'll add support for the logical OR operator in your interpreter. The logical OR operator combines two conditions and returns the first value that is truthy.

### Book reference

The code for this stage is implemented in [Section 9.3: Logical Operators](https://craftinginterpreters.com/control-flow.html#logical-operators).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with the logical OR operator.

For example, if `test.lox` contains the following

```
print nil or "ok";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
ok
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
if (false or "ok") print "baz";
if (nil or "ok") print "baz";

if (false or false) print "world";
if (true or "world") print "world";

if (24 or "bar") print "bar";
if ("bar" or "bar") print "bar";
```

Expected Output:

```
baz
baz
world
bar
bar
```

Test Case 2:

Input:

```
print 41 or true;
print false or 41;
print false or false or true;

print false or false;
print false or false or false;
print true or true or true or true;
```

Expected Output:

```
41
41
true
false
false
true
```

Test Case 3:

Input:

```
var a = "hello";
var b = "hello";
(a = false) or (b = true) or (a = "hello");
print a;
print b;
```

Expected Output:

```
false
true
```

Test Case 4:

Input:

```
var stage = "unknown";
var age = 23;
if (age < 18) { stage = "child"; }
if (age >= 18) { stage = "adult"; }
print stage;

var isAdult = age >= 18;
if (isAdult) { print "eligible for voting: true"; }
if (!isAdult) { print "eligible for voting: false"; }
```

Expected Output:

```
adult
eligible for voting: true
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/logical_operator/or.lox)