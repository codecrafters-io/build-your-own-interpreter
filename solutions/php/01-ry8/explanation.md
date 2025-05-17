The entry point for your Interpreter implementation is in `app/main.php`.

Study and uncomment the relevant code: 

```php
// Uncomment this block to pass the first stage
if ($file_contents) {
    throw new Exception("Scanner not implemented");
} else {
    echo "EOF  null\n"; // Placeholder, replace this line when implementing the scanner
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
