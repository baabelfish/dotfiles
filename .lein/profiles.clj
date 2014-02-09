{:user
 {:dependencies [[clj-stacktrace "0.2.7"]]
  :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                      'print-cause-trace)
                     new (ns-resolve (doto 'clj-stacktrace.repl require)
                                     'pst)]
                 (alter-var-root orig (constantly (deref new))))]}
 :plugins
 [[jonase/eastwood "0.1.0"]
  [slamhound "1.5.1"]]}
