The entry point for your Interpreter implementation is in `src/index.js`.

Study and uncomment the relevant code: 

```javascript
// Uncomment this block to pass the first stage

const fileContent = fs.readFileSync(filename, "utf8");

if (fileContent && fileContent.length !== 0) {
  throw new Error("Scanner not implemented");
} else {
  console.log("EOF  null");
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
