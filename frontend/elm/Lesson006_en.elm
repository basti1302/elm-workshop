module Lesson006En exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Lesson 6 - Let Expressions
==========================

Introduction
------------

Continuing from the last exercise we notice that it can be a bit awkward to define a new top level function for every little helper, especially if we only use the helper function in the context of one function. *Let expressions* to the rescue!

An example:
```
calculate : Int
calculate =
    let
        twentyfour = 3 * 8

        toThePowerOfTwo x =
            x ^ 2

        sixteen = toThePowerOfTwo 4

    in
        twentyfour + sixteen
```

With the `let` keyword you can assign names to intermediate values or helper functions. Here, two values (`twentyfour` and `sixteen`) and one function (`toThePowerOfTwo`) are defined. Note that `let` declarations can use things declared in the same `let` expression.

The function `calculate` as a whole returns the value produced in the expression after the `in` keyword.

You can add type annotations to the things in the let expression, but people often omit them and only add them to top level functions.


Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#let-expressions

Exercise 6.1
------------

Open the file `frontend/elm/Example006.elm` in an editor. Restructure the code so that only one top level expression (`main`) remains. Define `list` and `renderListItem` in a let expression inside `main`.

----

<span class="fa fa-hand-o-right"></span> Continue with **[lesson 7](/#007)**.
"""
