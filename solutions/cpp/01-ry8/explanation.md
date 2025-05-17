The entry point for your Interpreter implementation is in `src/main.cpp`.

Study and uncomment the relevant code:

```cpp
// Uncomment this block to pass the first stage

if (!file_contents.empty()) {
    std::cerr << "Scanner not implemented" << std::endl;
    return 1;
}
std::cout << "EOF  null" << std::endl; // Placeholder, replace this line when implementing the scanner
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
