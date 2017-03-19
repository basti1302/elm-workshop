module Lesson004En exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Lesson 4 - Lists
================

Introduction
------------

Lists are written as `[ element1, element2, ... ]` in Elm. `[]` is the empty list.

A list can only contain values of the same type, so `["string", 42]` would be illegal in Elm. The `List` type is a parameterized type, and the type parameter defines the type of the individual elements contained in the list. That is, `[1, 2, 3]` has type `List Int` and `["just", "some", "words"]` has type `List String`.

You can prepend an element to the beginning of a list with `::`, like this:
```
"before" :: [ "everything", "else" ]
-- => [ "before", "everything", "else" ]
```

You can also concatenate lists with `++`.

```
[ "some", "strings" ] ++ [ "and", "some", "more" ]
-- => [ "some", "strings", "and", "some", "more" ]
```

There is no dedicated operator to add a single element to the end of the list, so to do this you simply use `++` and wrap the single element in a list:

```
[ "one", "two" ] ++ [ "three" ]
-- => [ "one", "two", "three" ]
```

By the way, `++` also works on strings, that is, when you need to concatenate two strings, you can use `++`.

You can convert a list into a string by using the `toString` function. (In fact,  you can use `toString` with _any_ Elm value, no matter which type).

List.map
--------

Let's have a look at some of the things we can do with lists in Elm. One of the most common operations on lists is to _map_ a function over it. [`List.map`](http://package.elm-lang.org/packages/elm-lang/core/5.0.0/List#map) takes a function and a list and applies the given function to each element in the list, producing a new list containing the mapped values.

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
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#map

Exercise 4.1
------------

Open the file `frontend/elm/Example004.elm` in an editor. You will find the definition of an emtpy list (named `list1`) and some code to render the list to HTML. Change line 8 of the file (the definition of `list1`) so that the list contains three numbers (say, 1, 2 and 3).

Exercise 4.2
------------

Use `++` to concatenate `[5, 6, 7]` to the existing list. You can do this directly in the definition of `list1` (that is, in line 8).

Exercise 4.3
------------

Use `::` to prepend the number 0 to the start of the list. Again, you can do this directly in the definition of `list1` (that is, in line 8).

Exercise 4.4
------------

Define a function `increment : Int -> Int` that increments an integer by 1. Define a second `List Int` (say, `list2`) by mapping the `increment` function over `list1`. Don't forget to change your main function so that `list2` is printed instead of `list1`.

----

<span class="fa fa-hand-o-right"></span> Continue with **[lesson 5](/#005)**.
"""
