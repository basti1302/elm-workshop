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

Mit ein bisschen Fantasie kann man sich die zweite und die dritte Zeile als "Pipeline" für Werte vorstellen. Anschaulich kann man den Operator `|>` folgendermaßen erklären: In der zweiten Zeile fangen wir auf der linken Seite mit dem Ausdruck `6 * 7` an und übergeben ihn mit `|>` an die Funktion `toString`. Die Funktion `toString` konvertiert den numerischen Wert  `42` in den String-Wert `"42"`. Dieser Wert wird dann per `|>` weitergegeben an die Funktion `Html.text`, die den String schließlich in einen HTML Text-Knoten konvertiert.

Die dritte Zeile funktioniert genauso, nur dass der Datenfluß dort auf der rechten Seite anfängt und Werte von rechts nach links weitergegeben werden.

### Partielle Funktionsausführung

Was ist aber mit Funktionen, die zwei oder mehr Argumente bekommen. Können wir `|>`und `<|` mit solchen Funktionen verwenden? Wir können immer nur ein Argument per Pipe an die nächste Funktion in der Kette übergeben. Wo kommen dann die anderen Argumente her? Hier kommt partielle Funktionsausführung ins Spiel.

Angenommen wir wollten die Funktion [compare](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#compare) in so einer Kette von Funktionsaufrufen verwenden, wie wir es mit `toString` und `text` weiter oben gemacht haben. Die Funktion `compare` bekommt zwei Argumente. Wir können allerdings in Elm jederzeit auch erstmal nur einen Parameter an eine solche Funktion übergeben, also `(compare 7)` schreiben. Dieser Ausdruck erzeugt eine neue Funktion, die nur noch ein Argument benötigt und die jede übergebene Zahl mit 7 vergleicht. Das erste Argument für `compare` ist hier also schon auf 7 festgelegt.

Folgendes wäre also gültiger Elm-Code:

```
12 |> compare 7
-- => LT (which means that 7 is less then 12)
```

This code passes the value 12 into a function that takes one parameter and compares every incoming parameter with 7.


Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#functions
* http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#|>
* http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#<|

Übung 11.1
----------

Öffne `frontend/elm/Example011.elm` in einem Editor. Dort wird eine längliche let-Expression verwendet, um

* eine Liste mit Integer-Werten zu sortieren,
* alle Integer in Strings umzuwandeln,
* die Strings per `join` zu einem String zu verketten und schließlich
* diesen String in einen HTML Text Knoten umzuwandeln.

Man könnte das auch in einer Zeile als `text (String.join ", " (List.map toString (List.sort unsortedList)))` schreiben, aber das ist noch häßlicher.

Entferne die let-Expression und schreibe den Code als Kette von Funktionsaufrufen, die mit `|>` verknüpft sind.

### Randbemerkung

Es gibt auch noch Operatoren für Funktionskomposition, [`<<`](http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#<<) und [`>>`](http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#>>). Für mathematisch Interessierte:

* `(g << f) x` ist das gleiche wie `g (f x)`
* `(f >> g) x` ist auch das gleiche wie `g (f x)`

Wenn das kompliziert klingt, ignorier es einfach. `|>` und `<|` werden deutlich häufiger benutzt als `<<` und `>>`.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 12](/#012)**.
"""
