The entry point for your Interpreter implementation is in `src/main/java/Main.java`.

Study and uncomment the relevant code: 

```java
// Uncomment this block to pass the first stage

if (fileContents.length() > 0) {
  throw new RuntimeException("Scanner not implemented");
} else {
  System.out.println("EOF  null"); // Placeholder, remove this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
