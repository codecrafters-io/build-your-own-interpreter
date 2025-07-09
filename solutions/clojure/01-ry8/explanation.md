The entry point for your Interpreter implementation is in `src/interpreter/core.clj`.

Study and uncomment the relevant code: 

```clojure
;; Uncomment this block to pass the first stage
(let [filename (second args)
      file-contents (slurp filename)]
  (if (zero? (count file-contents))
    (println "EOF  null")
    (throw (ex-info "Scanner not implemented" {}))))
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
