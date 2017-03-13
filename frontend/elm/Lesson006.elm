module Lesson006 exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Lesson 6 - Working with Lists
=============================

Introduction
------------

We already used the List type in exercises 4 and 5. Let's have a look at some of the things we can do with lists in Elm. One of the most common operations on lists is to _map_ a function over it. [`List.map`](http://package.elm-lang.org/packages/elm-lang/core/5.0.0/List#map) takes a function and a list and applies the given function to each element in the list, producing a new list containing the mapped values.

Example:

```
list : List Int
list = [ 1, 2, 3, 4 ]

double : Int -> Int
double a = a * 2

mappedList : List Int
mappedList = List.map double list
-- => mappedList = [ 2, 4, 6, 8 ]
```

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#lists
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List

Exercise 6.1
------------

Open the file `frontend/elm/Example006.elm` in an editor. You'll find a list of four strings and a function that turns a string into an `li` tag. Use `List.map` to create the following DOM structure:

```
<ul>
  <li>one</li>
  <li>two</li>
  <li>three</li>
  <li>four</li>
</ul>
```

Basically, you need to replace the second parameter to `ul` in `main` with a `List.map` expression. You might need to wrap your `List.map` call in parantheses `()`.

----

<span class="fa fa-hand-o-right"></span> Continue with **[exercise 7](/#007)**.
"""
