The entry point for your Interpreter implementation is in `app/main.ts`.

Study and uncomment the relevant code: 

```typescript
// Uncomment this block to pass the first stage

const fileContent: string = fs.readFileSync(filename, "utf8");

if (fileContent.length !== 0) {
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
