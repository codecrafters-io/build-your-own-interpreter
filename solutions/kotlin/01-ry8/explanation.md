The entry point for your Interpreter implementation is in `app/src/main/kotlin/App.kt`.

Study and uncomment the relevant code: 

```kotlin
// Uncomment this block to pass the first stage
if (fileContents.isNotEmpty()) {
    throw NotImplementedError("Scanner not implemented")
} else {
    println("EOF  null") // Placeholder, replace this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
