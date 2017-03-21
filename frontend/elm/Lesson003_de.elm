module Lesson003De exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Einheit 3 - Type Annotations
============================

Einleitung
----------

Elm hat ein statisches Typsystem. Warum tauchten in unserem Code bisher gar keine Typen auf? Das liegt daran, dass Elm den eines Ausdrucks zuverlässig selbst ermitteln kann. Man kann seinen Code allerdings (optional) mit Typ-Annotationen anreichern. Als Best Practice gilt es, alle Top-Level-Funktionen mit Typ-Annotationen zu versehen. Typ-Annotationen werden vom Compiler beachtet - passt ein Ausdruck nicht zu seiner Typ-Annotation, gibt es einen Compile-Fehler.

Eine Funktion mit einer Typ-Annotation sieht so aus:

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

Eine Typ-Annotation wird in die Zeile direkt über der Funktionsdefinition geschrieben. Sie beginnt mit dem Funktionsnamen und einem Doppelpunkt `:`, gefolgt von den Typen er einzelnen Parameter. Diese werden mit `->` separiert aufgelistet. Der letzte Typ ist der Rückgabetyp der Funktion.

Einfache Werte können auch einen Typ-Annotation haben:

```
aNumber : Int
aNumber = 42
```

Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#type-annotations

Übung 3.1
---------

Öffne die Datei `frontend/elm/Example003.elm` in einem Editor. Sie sollte ungefähr der Lösung der letzten Aufgabe entsprechen.

Füge der Funktion `multiply` eine Typ-Annotation hinzu. Stelle sicher, dass dein Code immer noch kompiliert.

Übung 3.2
---------

Annotiere `main` mit dem passenden Typ. Hierbei ist zu beachten, dass `main` keine Parameter akzeptiert - es ist also eigentlich keine Funktion, sondern ein einfacher Wert. Der passende Typ für `main` ist `Html a`. Das `a` ist ein Typ-Parameter - darauf kommen wir später zurück.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 4](/#004)**.
"""
