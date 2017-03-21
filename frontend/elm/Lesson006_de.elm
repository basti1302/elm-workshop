module Lesson006De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 6 - Let
===============

Einleitung
----------

Manchmal ist es etwas umständlich, wenn man jeden Wert und jede kleine Hilfsfunktion als neue Top-Level-Expression deklarieren muss - insbesondere dann, wenn die Hilfsfunktion nur im Kontext einer einzigen anderen Funktion Verwendung findet. Hier helfen *let-Expresssions*.

Ein Beispiel:
```
calculate : Int
calculate =
    let
        twentyfour = 3 * 8

        toThePowerOfTwo x =
            x ^ 2

        sixteen = toThePowerOfTwo 4

    in
        twentyfour + sixteen
```

Mit dem Schlüsselwort `let` kann man Zwischenwerten oder Hilfsunktionen einen Namen geben. In obigem Beispiel werden zwei Werte (`twentyfour` und `sixteen`) sowie eine Funktion (`toThePowerOfTwo`) deklariert. Man beachte dass deklarierte Namen auch innerhalb derselben let-Expression verwendet werden könnnen.

Die Funktion `calculate` als ganzes gibt dann den Wert zurück, der von dem Ausdruck hinter dem Schlüsselwort `in` erzeugt wird.

Man kann den Definitionen in der let-Expression Typannotation hinzufügen, allerdings werden diese meistens weggelassen und nur Top-Level-Expressions annotiert.

Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#let-expressions

Übung 6.1
------------

Öffne die Datei `frontend/elm/Example006.elm` in einem Editor. Strukturiere den Code so um, dass nur eine Top-Level-Expression (nämlich `main`) verbleibt. Definiere `list` und `renderListItem` in einer let-Expression in `main`.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 7](/#007)**.
"""
