# Lambda Shorthand for Carp

This library implements a shorthand for lambdas in
[Carp](https://github.com/carp-lang/Carp) similar to [Clojure's Anonymous
Function Literal](https://clojure.org/reference/reader#_dispatch).

Use `:n` to access the implicit function arguments `n` being the argument
position, `:1`, `:2`, etc...

## Example

```clojure
(load "https://github.com/TimDeve/lambda-shorthand@master")

(defndynamic add-5 [i]
  ((: + :1 5) i))

(defmacro add-9 [i]
  (let [add-4 (: + :1 4)]
   (add-4 (add-5 i))))

(defn-do main []
  (println* "17 = " (+ 4 (add-9 4)))
  (println* "[6 12 18] = " &(endo-map &(: * 3 (* 2 :1)) [1 2 3]))
  (println* "12 = " ((: do :12) 1 2 3 4 5 6 7 8 9 10 11 12))
  (println* "threetwoone = " (reduce &(: append :2 &:1) @"" &[@"one" @"two" @"three"]))
  ; (println* "??? = " ((: (: + :1 1)) 1))      Not allowed to nest shorthands,
  (println* "2 = " ((: (fn [a] (+ a 1)) 1)))) ; Use normal lambdas inside shorthands instead
```

