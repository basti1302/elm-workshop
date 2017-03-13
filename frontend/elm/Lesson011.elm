module Lesson011 exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Lesson 11 - Conditionals
========================

Introduction
------------

The `if` keyword lets you select among different expressions, depending on a boolean value. Its well known cousins `else` and `else if` are also available:

```
if someValue > 10 then "a lot" else "not so many"
```

```
if someValue == 10 then
    "exactly ten"
else if someValue > 10 then
    "a lot"
else
    "not so many"
```

Note that this is not a *control flow statement* like in imperative programming (Java, JavaScript, C, ...). All you do in your Elm functions is to return a *value*, based on the incoming parameters and `if` let's you return different values based on a boolean value.

To compose boolean expressions out of other expressions, you can use
* `not` to negate a boolean expression,
* `&&` for logical and, as well as
* `||` for logical or.

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#conditionals
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#not

Exercise 11.1
-------------

Open `frontend/elm/Example011.elm` in an editor. Your task is to implement the `convert` function so that it returns "even" for even numbers, "divisible by three" for numbers that are divisible by three and "whatever" in all other cases.

The correct output would be:
```
["even","even","divisible by three","whatever","divisible by three","even"]
```

Hint: You can use the [`rem`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#rem) function or [`%`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#%) to implement your check.

----

<span class="fa fa-hand-o-right"></span> Continue with **[exercise 12](/#012)**.
"""
