module Lesson010De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 10 - Conditionals (optional)
====================================

Einleitung
----------

**Diese Einheit ist optional. Bitte überspringe sie im Halbtagsworkshop. Du kannst sie gerne später bearbeiten.**

Das Schlüsselwort `if` wählt in Abhängigkeit von einer booleschen Bedingung zwischen mehreren Ausdrücken. Die Schlüsselwörter `else` and `else if` sind ebenfalls verfügbar.

Beispiele:

```
if einWert > 10 then "eine Menge" else "einige wenige"
```

```
if einWert == 10 then
    "genau zehn"
else if einWert > 10 then
    "eine Menge"
else
    "einige wenige"
```

Man beachte, dass es sich hier nicht um eine Kontrollflusssteuerung wie in imperativen Programmiersprachen (Java, JavaScript, C, ...) handelt. In Elm schreibt man ausschließlich Funktionen, die auf Basis der Eingabewerte einen neuen Wert zurückgeben. `if` erlaubt es, verschiedene Werte in Abhängigkeit von einer Bedingung zurückzugeben.

Folgende Operatoren stehen zur Verfügung, um boolesche Ausdrücke zu verknüpfen:
* `not` um einen booleschen Ausdruck zu negieren,
* `&&` für das logische "Und", sowie
* `||` für das logische "Oder".

Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#conditionals
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#not

Übung 10.1
----------

Öffne die Datei `frontend/elm/Example010.elm` in einem Editor. Deine Aufgabe ist es, eine Funktion `convert : Int -> String` zu implementieren, die "gerade" für gerade Zahlen zurückgibt, "teilbar durch drei" für Zahlen, die durch drei teilbar sind und "sonstwas" in allen anderen Fällen.

The correct output would be:
```
["gerade","gerade","teilbar durch drei","sonstwas","teilbar durch drei","gerade"]
```

Hinweis: Du kannst die Funktion [`rem`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#rem) oder [`%`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#%) verwenden, um deinen Check zu implementieren.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 11](/#011)**.
"""
