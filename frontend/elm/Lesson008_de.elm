module Lesson008De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 8 - Records
===================

Einleitung
----------

Neben Listen bietet Elm noch eine Reihe weiterer Datenstrukturen. Eine davon sind *Records*. Während Listen eine variable Anzahl von Elementen des *gleichen* Typs beinhalten können, enthalten Records eine feste Anzahl von Elementen mit *verschiedenen* Typen. Elm-Records ähneln Dictionaries oder Maps in anderen Programmiersprachen.

Ein Record-Wert wird folgendermaßen erzeugt:

```
point = { x = 3, y = 4 }
```

Auf die einzelnen Felder im Record kann man mit der Punkt-Notation zugreifen:

```
point.x
-- => 3
```

Des Weiteren wird für jedes deklarierte Record-Feld implizit ein Zugriffsfunktion erzeugt. Man könnte den `x`-Wert auch folgenermaßen auslesen:

```
.x point
-- => 3
```

Dies ist manchmal ganz nützlich, z. B. wenn man diese Zugriffsfunktion mit `List.map` verwenden will:
```
List.map .x [ {x = 1, y = 0}, {x = 2, y = 0}, {x = 3, y =0 } ]
-- => [ 1, 2, 3 ]
```

Um das Wert eines Feldes zu ändern benutzt man folgende Schreibweise:

```
{ point | x = 99 }
-- => { x = 99, y = 4 }
```

Um ganz genau zu sein: Da in Elm immer alle Werte unveränderlich (immutable) sind, ändert der obige Code den Wert von `x` im bestehenden Record nicht, sondern erzeugt eine geänderte Kopie des Records.

Man kann auch mehrere Felder auf einmal ändern:

```
{ point |
    x = point.x + 1,
    y = point.y + 1
}
-- => { x = 4, y = 5 }
```

Um für Record-Strukturen einen Typnamen zu haben, der sich z. B. in Typ-Annotationen verwenden lässt, legt man einen Typ-Alias fest:

```
type alias Point =
  { x : Int
  , y : Int
  }

point : Point
point = { x = 3, y = 4 }
```

Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#records

Übung 8.1
---------

Öffne die Datei `frontend/elm/Example008.elm` in einem Editor. Dieses Mal fangen wir mehr oder weniger mit einer leeren Datei an.

Lege einen `type alias` namens `Book` für Records mit den Feldern `title`, `author` (beides vom Type `String`) und `price` (Typ `Float`) an.

Erzeuge einen Wert `book1` vom Typ `Book` mit beliebigen Werten für Titel, Autor und Preis. Es gibt drei Bonuspunkte, wenn du `book1` eine Typ-Annotation gibst. ;-)

Implementiere eine Funktion `bookToString`, die ein `Book` als Parameter erwartet und ein String der Form "Titel - Autor" zurückgibt. Du kannst die Funktion entweder in einer `let`-Expression in `main` implementieren oder als Top-Level-Funktion. Zur Erinnerung: Strings werden in Elm mit `++` verkettet.

Benutze `bookToString`, um dein Buch `book1` zu rendern. Vergiss nicht, `Html.text` auf den String, den `bookToString` liefert, anzuwenden.

Übung 8.2
---------

Schreibe eine weitere Hilfsfunktion `applyDiscount: Book -> Book`, die den Preis eines Buches um 50% reduziert. Wende `applyDiscount` auf `book1`an.

Erweitere die Funktion `bookToString` aus der vorhergehenden Übung, so dass diese auch den Preis eines Buches mit ausgibt. Die erweiterte Funktion sollte eine String nach folgendem Muster zurückgeben: "Titel - Autor: Preis". Hinweis: Werte, die keine Strings sind (wie zum Beispiel `Float`-Werte), müssen mit `toString` in einen `String ` konvertiert werden.

Benutze abschließend die erweiterte Funktion `bookToString`, um das preisreduzierte Buch zu rendern.

Übung 8.3 (optional)
-----------------------

**Bitte überspringe diese Übung im Halbtagsworkshop.**

Lege ein weiteres Buch `book2` an und eine Liste von Büchern, die sowohl `book1` als auch `book2` enthält. Benutze `List.map`, um auf Basis der Liste von Büchern eine Liste von Strings zu erzeugen, die nur die Titel der Bücher enthält. Stelle die Liste der Titel als ungeordnete Liste (`<ul>`) dar.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 9](/#009)**.
"""
