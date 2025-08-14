(ns interpreter.core
  (:gen-class))

(defn -main [& args]
  (let [filename (second args)
        file-contents (slurp filename)]
    (if (zero? (count file-contents))
      (println "EOF  null")
      (throw (ex-info "Scanner not implemented" {}))))
  )
