module Lesson004De exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Einheit 4 - Listen
==================

Einleitung
----------

Listen werden in Elm folgendermaßen definiert: `[ element1, element2, ... ]`. Der Ausdruck `[]` ist die leere Liste.

Eine Liste kann nur Werte eines Typs enthalten. Der Ausdruck `["string", 42]` wäre also nicht zulässig. Der Typ `List` ist parametrisiert, der Typ-Parameter gibt den Typ der Listenelemente an. Die Liste `[1, 2, 3]` hat also den Typ `List Int` und `["just", "some", "words"]` hat den Typ `List String`.

Mit `++` kann man Listen verketten:

```
[ "einige", "strings" ] ++ [ "und", "noch", "ein", "paar" ]
-- => [ "einige", "strings", "und", "noch", "ein", "paar" ]

```

Man kann auch mit `::` ein einzelnes Element am Anfang der Liste einfügen:

```
"vor" :: [ "allem", "anderen" ]
-- => [ "vor", "allem", "anderen" ]
```

Es gibt keinen eigenen Operator, um ein Element am Ende der Liste anzuhängen. Dazu benutzt man einfach auch  `++` und gibt das anzuhängende Element als Liste mit einem Element an:

```
[ "eins", "zwei" ] ++ [ "drei" ]
-- => [ "eins", "zwei", "drei" ]
```

Übrigens funktioniert `++` auch mit Strings. Um zwei Strings zu verketten, kann man also auch `++` benutzen.

Man kann eine Liste mit `toString` in einen String konvertieren. Tatsächlich kann man *alle* Werte in Elm mit `toString` in einen String umwandeln, egal welcher Typ.

List.map
--------

Was kann man in Elm mit Listen so alles anstellen? Eine der gebräuchlichsten Operationen auf einer Liste ist es, ein Funktion über die Liste zu mappen. [`List.map`](http://package.elm-lang.org/packages/elm-lang/core/5.0.0/List#map) nimmt eine Funktion und eine Liste entgegen und wendet die Funktion auf jedes Element in der Liste an. Dadurch wird eine neue Liste erzeugt, die die gemappten Werte enthält.

Beispiel:

```
liste : List Int
liste = [ 1, 2, 3, 4 ]

verdoppeln : Int -> Int
verdoppeln a = a * 2

gemappteListe : List Int
gemappteListe = List.map verdoppeln liste
-- => gemappteListe = [ 2, 4, 6, 8 ]
```

Relevante Dokumenation
----------------------

* http://elm-lang.org/docs/syntax#lists
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#map

Übung 4.1
---------

Öffne die Datei `frontend/elm/Example004.elm` in einem Editor. Die Datei enthält bereits die Definition einer leeren Liste (namens `list1`) und etwas Code, um eine Liste zu rendern. Ändere Zeile 8 (die Definition von `list1`), so dass die Liste drei Zahlen enthält (beispielsweise 1, 2 und 3).

Übung 4.2
---------

Benutze `++` um `[5, 6, 7]` an die Liste anzuhängen. Du kannst das direkt in der Definition von `list1` erledigen (also in Zeile 8).

Übung 4.3
---------

Benutze `::`, um der Liste die Zahl 0 voranzustellen. Auch das kannst du direkt in der Definition von `list1` machen.

Übung 4.4
---------

Implementiere eine Funktion `increment : Int -> Int`, die eine Zahl um eins inkrementiert. Definiere eine zweite Liste (z. B. `list2`) indem du die `increment` Funktion über `list1` mappst. Vergiss nicht, `main` anzupassen, so dass `list2` statt `list1` ausgegeben wird.

Übung 4.5 (optional)
--------------------

**Bitte überspringe diese Übung im Halbtagsworkshop.**

Implementiere eine Funktion `greaterThanFive : Int -> Bool`, die `True` zurückgibt, wenn der übergebene Parameter größer als fünf ist. Lösche den `List.map`-Ausdruck aus der letzten Übung und benutze stattdessn [List.filter](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/List#filter), so dass `list2` nur noch die Zahlen aus `list1` enthält, die größer als 5 sind.Stelle sicher, dass `list2` statt `list1` in `main` ausgegeben wird.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 5](/#005)**.
"""
