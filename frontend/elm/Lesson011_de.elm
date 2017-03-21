module Lesson011De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 11 - Funktionsanwendung für Fortgeschrittene (optional)
===============================================================

Einleitung
------------

**Diese Einheit ist optional. Bitte überspringe sie im Halbtagsworkshop. Du kannst sie gerne später bearbeiten.** Diese Einheit wird dir helfen, besseren Elm-Code zu schreiben.

### Funktionsanwenung

In einigen der vorhergehenden Übungen hatte wir Anwendungsfälle, die eine nicht unwesentliche Anzahl von Klammern erforderlich machten, z. B. Ausdrücke wie `text (toString (6 * 7))`. Es gibt Möglichkeiten, so etwas in Elm deutlich eleganter zu schreiben. Dabei helfen vor allem die Operatoren `|>` und `<|`, die *forward function application* und *backward function application* genannt werden. Man kann diese Operatoren auch Pipe nennen, da sie einer Pipe in der Shell stark ähneln.

* `(parameter |> function)` ist das gleiche wie `(function parameter)`.
* `(function <| parameter)` ist auch das gleiche wie `(function parameter)`.

Hier sind einige Ausdrücke, die äquivalent sind:
```
text (toString (6 * 7))

6 * 7 |> toString |> text

text <| toString <| 6 * 7
```

Do you notice how the second and the third line resemble pipelines for values? Let's look at the second line in detail. The following is a good mental model for the `|>` operator: We start with the value `6 * 7` and pass it via `|>` into the `toString` function. The `toString` function transforms the numerical value `42` into the string value `"42"`. This value is then passed into the function `text`, which turns the string into an HTML text node.

The third line works the same, but there the flow starts at the right side and values flow from right to left instead of left to right.

### Partial Function Application

But what about functions that take two or more parameters? Can we use `|>` and `<|` with such functions? We can only pipe one value into the next function via `|>`/`<|`, so where would this function get the other parameters from? Turns out we still can use these operators, with the help of partial function application.

Let's say we wanted to use the [compare function](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#compare) in a pipe expression, like we did with `toString` and `text` above. The function `compare` requires *two* arguments, but it is perfectly fine to only pass in one value, like so `(compare 7)`. This will create a new (anonymous) function on the fly, that takes only one parameter, and that will compare everything with 7. We say that the first parameter for `compare` is already bound to 7.

Thus, this would be legal Elm code:

```
12 |> compare 7
-- => LT (which means that 7 is less then 12)
```

This code passes the value 12 into a function that takes one parameter and compares every incoming parameter with 7.


Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#functions
* http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#|>
* http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#<|

Übung 11.1
----------

Take a look at `frontend/elm/Example011.elm`. It uses a verbose `let` expression to

* sort an integer list,
* convert all integer values in the list to strings,
* join the strings into one string, and finally
* convert this string into an HTML text node.

You could write that as one line with `text (String.join ", " (List.map toString (List.sort unsortedList)))` but that is even uglier.

Remove the `let` expresssion and refactor this code into a chain of function calls that are chained via `|>`.

### Sidenote

There are also *function composition* operators, [`<<`](http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#<<) and [`>>`](http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#>>). For the mathematically inclined:

* `(g << f) x` is the same as `g (f x)`
* `(f >> g) x` is the same as `g (f x)`

If this sounds like complicated gibberish to you, don't bother with it for now. `|>` and `<|` are used far more often than `<<` and `>>`.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 12](/#012)**.
"""
