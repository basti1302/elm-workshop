module Lesson007En exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Lesson 7 - Type Alias
=====================

Introduction
------------

You can declare an alias for any type in Elm by using the `type alias` construct. Examples:

```
type alias Name = String
type alias Age = Int

type alias ManyStrings = List String
```

The original type and its aliases can be used interchangeably, that is, you can pass a `String` to a function that expects a `Name` and vice versa.

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#type-aliases

Exercises
---------

There are no exercises for type aliases but we will use type aliases when we introduce records in [exercise 8](/#008).

----

<span class="fa fa-hand-o-right"></span> Continue with **[lesson 8](/#008)**.
"""
