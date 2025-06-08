(ns interpreter.core
  (:gen-class))

(defn -main [& args]
  ;; You can use print statements as follows for debugging, they'll be visible when running tests.
  (println "Logs from your program will appear here!")

  ;; Uncomment this block to pass the first stage
  ;; (let [filename (second args)
  ;;       file-contents (slurp filename)]
  ;;   (if (zero? (count file-contents))
  ;;     (println "EOF  null")
  ;;     (throw (ex-info "Scanner not implemented" {}))))
  )
