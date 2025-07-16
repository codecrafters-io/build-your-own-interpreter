In this stage, you'll add support for handling multiple statements in a single `program`. From here on, we will create test programs that span across multiple statements.

### Book reference

The code for this stage is implemented in [Section 8.1: Statements](https://craftinginterpreters.com/statements-and-state.html#statements).

### Tests

The tester will run a series of tests with `test.lox` files that contain multiple statements.

For example, if `test.lox` contains the following

```
print "Hello, World!";
print 42;
```

The tester will run your program like this:

```
$ ./your_program.sh run test.lox
Hello, World!
42
```

The tester will run multiple such tests with randomized expressions, for example:

Test Case 1:

Input:

```
print "world" + "baz" + "bar";
print 27 - 26;
print "bar" == "quz";
```

Expected Output:

```
worldbazbar
1
false
```

Test Case 2:

Input:

```
print "hello"; print true;
print false;
print "bar"; print 43;
```

Expected Output:

```
hello
true
false
bar
43
```

Test Case 3:

Input:

```
print 81;
    print 81 + 46;
        print 81 + 46 + 19;
```

Expected Output:

```
81
127
146
```

Test Case 4:

Input:

```
print true != true;

print "36
10
78
";

print "There should be an empty line above this.";
```

Expected Output:

```
false
36
10
78

There should be an empty line above this.
```

The tester will assert that the stdout of your program matches the format above, and that the exit code is 0.

### Notes

- This output format matches the spec in the [book's repository](https://github.com/munificent/craftinginterpreters/blob/01e6f5b8f3e5dfa65674c2f9cf4700d73ab41cf8/test/string/literals.lox)