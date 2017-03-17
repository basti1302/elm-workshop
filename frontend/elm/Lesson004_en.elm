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

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#lists
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List

Exercise 4.1
------------

Open the file `frontend/elm/Example004.elm` in an editor. You will find the definition of an emtpy list (named `list1`) and some code to render the list to HTML. Change line 8 of the file (the definition of `list1`) so that the list contains three numbers (say, 1, 2 and 3).

Exercise 4.2
------------

Use `++` to concatenate `[5, 6, 7]` to the existing list. You can do this directly in the definition of `list1` (that is, in line 8).

Exercise 4.3
------------

Use `::` to prepend the number 0 to the start of the list. Again, you can do this directly in the definition of `list1` (that is, in line 8).

----

<span class="fa fa-hand-o-right"></span> Continue with **[lesson 5](/#005)**.
"""
