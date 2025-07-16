In this stage, you'll add support for the logical AND operator in your interpreter. The logical AND operator combines two conditions and returns the first falsy value. If all values are truthy, it returns the last value.

### Book reference

The code for this stage is implemented in [Section 9.3: Logical Operators](https://craftinginterpreters.com/control-flow.html#logical-operators).

### Tests

The tester will run a series of tests with `test.lox` files that contain programs with the logical AND operator.

For example, if `test.lox` contains the following

```
print false and "ok";
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
false
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
if (false and "bad") print "foo";
if (nil and "bad") print "foo";

if (true and "hello") print "hello";
if (97 and "baz") print "baz";
if ("baz" and "baz") print "baz";
if ("" and "bar") print "bar";
```

Expected Output:

```
hello
baz
baz
bar
```

Test Case 2:

Input:

```
print false and 1;
print true and 1;
print 23 and "hello" and false;

print 23 and true;
print 23 and "hello" and 23;
```

Expected Output:

```
false
1
false
true
23
```

Test Case 3:

Input:

```
var a = "quz";
var b = "quz";
(a = true) and (b = false) and (a = "bad");
print a;
print b;
```

Expected Output:

```
true
false
```

Test Case 4:

Input:

```
var stage = "unknown";
var age = 14;
if (age < 18) { stage = "child"; }
if (age >= 18) { stage = "adult"; }
print stage;

var isAdult = age >= 18;
if (isAdult) { print "eligible for voting: true"; }
if (!isAdult) { print "eligible for voting: false"; }
```

Expected Output:

```
child
eligible for voting: false
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/4a840f70f69c6ddd17cfef4f6964f8e1bcd8c3d4/test/logical_operator/and.lox)