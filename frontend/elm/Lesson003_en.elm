module Lesson003En exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Lesson 3 - Type Annotations
===========================

Introduction
------------

Elm is statically typed, so why did our code not mention any types until now? The reason is that Elm can infer the type of expressions by itself. You can add `type annotations` to your Elm code, though. It is considered a best practice to add type annotations to your top level functions.

Functions with a type annotations looks like this:

```
increment : Int -> Int
increment a =
    a + 1
```

```
concatenate : String -> String -> String
concatenate string1 string2 =
    string1 ++ string2
```

A type annotation is written in the line directly above the function definition. It starts with the function name and a colon `:`, followed by the types of the individual parameters, separated by `->`. The last type is the return type of the the function.

Simple values can also have type annotations:

```
aNumber : Int
aNumber = 42
```

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#type-annotations

Exercise 3.1
------------

Open the file `frontend/elm/Example003.elm` in an editor. It should look approximately like your solution to the last exercise.

Add type annotations to the `multiply` function. Make sure your code still compiles (check the output of webpack-dev-server).

Exercise 3.2
------------

Add type annotations to `main`. Keep in mind that `main` does not accept parameters, so technically it is not a function but a simple value. The type of `main` is `Html a`. The `a` is a type parameter - we will get to that later.

----

<span class="fa fa-hand-o-right"></span> Continue with **[exercise 4](/#004)**.
"""
