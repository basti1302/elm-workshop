module Lesson008En exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Lesson 8 - Records
==================

Introduction
------------

Besides lists, Elm offers a few more data structures. One of them are *records*. While lists contain a variable number of values of the *same* type, records contain a fixed number of values with *different* types. They are quite similar to dictionaries/maps in other languages.

You create a record value like this:

```
point = { x = 3, y = 4 }
```

and access individual record fields with the dot notation:

```
point.x
-- => 3
```

Actually, each record property implicitly creates an accessor function, so you could also get the `x` value like this:

```
.x point
-- => 3
```

This is handy if you want to use the accessor function, for example, with `List.map`:
```
List.map .x [ {x = 1, y = 0}, {x = 2, y = 0}, {x = 3, y =0 } ]
-- => [ 1, 2, 3 ]
```

This is how you update a record (or, to be precise, create a new record with one field updated):

```
{ point | x = 99 }
-- => { x = 99, y = 4 }
```

You can also update multiple fields at once:

```
{ point |
    x = point.x + 1,
    y = point.y + 1
}
-- => { x = 4, y = 5 }
```

You use a type alias to define a type (that can be used in type annotations) for record values:

```
type alias Point =
  { x : Int
  , y : Int
  }

point : Point
point = { x = 3, y = 4 }
```

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#records

Exercise 8.1
------------

Open the file `frontend/elm/Example008.elm` in an editor. This time we are starting with an almost empty source file.

Define a `type alias` named `Book` for records with the attributes `title`, `author` (both of type `String`) and `price` (type `Float`).

Create a value `book1` of type `Book` with some arbitrary values for title, author and price. Add a type annotation to `book1` for bonus points :)

Create a `bookToString` function that takes a `Book` and returns a string like "Title - Author". You can either use a let expression inside `main` or declare this as a top level function. Reminder: You can use `++` to concatenate strings in Elm.

Use `bookToString` to render the book. Don't forget to apply  the `text` function to the string returned by `bookToString`.

Exercise 8.2
------------

Create another helper function `applyDiscount: Book -> Book` that reduces the price of a book by 50%.

Apply `applyDiscount` to `book1`. Extend the `bookToString` function from the previous exercise to also include the price of the book, so that it returns a string with the pattern "Title - Author: Price". Reminder: Values that are not of type `String` (like `Float` values) need to be converted to `String` with `toString`.

Finally, use the updated `bookToString` function to render the book with the discount applied.

Exercise 8.3 (optional)
-----------------------

**Please skip this exercise in the half day workshop.**

Create another book `book2` and a list of books that contains both `book1` and `book2`. Use `List.map` to map the list of books to a list of strings that only contains the titles of the book. Render the list of titles as an unordered list (`ul`).

----

<span class="fa fa-hand-o-right"></span> Continue with **[lesson 9](/#009)**.
"""
