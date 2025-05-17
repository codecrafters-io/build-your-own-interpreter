The entry point for your Interpreter implementation is in `src/main.cs`.

Study and uncomment the relevant code:

```csharp
// Uncomment this block to pass the first stage
if (!string.IsNullOrEmpty(fileContents))
{
    throw new NotImplementedException("Scanner not implemented");
}
else
{
    Console.WriteLine("EOF  null"); // Placeholder, replace this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
