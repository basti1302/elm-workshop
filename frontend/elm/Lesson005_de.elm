module Lesson005De exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Einheit 5 - HTML
================

Einleitung
----------

Öffne `frontend/elm/Example005.elm` in einem Editor.

Die `main`-Funktion sieht etwas anders aus, als bisher:

```
main = p [] [ text "HTML Structures" ]
```

`p` ist eine Funktion aus dem Modul `Html`. Sie rendert einen `<p>`-Tag. Solch eine Funktion gibt es für alle HTML-Tags im Html-Modul, beispielsweise gibt es auch die Funktionen `div`, `span`, `ul`, `li`, `a`, etc.

Alle diese Funktionen akzeptieren zwei Listen als Parameter. Der erste Parameter ist die Liste der *Attribute* (Styles, CSS-Klasse, Event-Listener, etc.), der zweite Parameter ist die Liste der Kind-Elemente.

Wie wir in der letzten Einheit gesehen haben, werden Listen als `[ element1, element2, ... ]` geschrieben und `[]` ist die leere Liste. Um ein leeres `<p/>` Tag zu erzeugen, würde man also in Elm `p [] []` schreiben.

Eine wichtige Ausnahme von dieser Regel (dass alle Funktionen im `Html`-Modul diese beiden Listen entgegennehmen) ist die Funktion `text`, die nur einen Parameter mit Typ String akzeptiert.

Man kann `Html` Funktionsaufrufe schachteln, um geschachtelte DOM-Strukturen zu erzeugen:

```
div
    []
    [ span
        []
        [ text "etwas Text in einem span innerhalb eines divs" ]
    ]
```

Ein anderes Beispiel:

```
ul
    []
    [ li
        []
        [ text "Erstens" ]
    , li
        []
        [ text "Zweitens" ]
    , li
        []
        [ text "Drittens" ]
    ]
```

Dieser Code würde ein Liste mit drei Stichpunkten erzeugen.

Das erscheint im Moment evtl. etwas umständlich, um HTML zu erzeugen. Man darf dabei nicht vergessen, dass Elm keine Templating-Sprache für statisches HTML ist, sondern eine funtionale Programmiersprache. Da dies alles nur Funktionsaufrufe sind, können wir in unserem View-Code später einige ziemlich elegante Sachen damit anstellen (siehe z. B. Aufgabe 5.3)

Relevante Dokumentation
-----------------------

* [`Html` module](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html)
* [`Html.Attributes` module](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html-Attributes)

Übung 5.1
---------

Öffne die Datei `frontend/elm/Example005.elm` in einem Editor. Entferne die komplette Implementierung der `main` Funktion (den Aufruf der Funktion `p`) und ersetze ihn durch Elm-Code, der den folgenden DOM erzeugt:

```
<div>
    <h1>Überschrift 1</h1>
    <p>Ein Absatz</p>
    <h2>Überschrift 2</h2>
    <p>Noch ein Absatz</p>
</div>
```

Überprüfe die entstandene Dokumentstruktur im Browser mit den Dev Tools.

Übung 5.2 - CSS-Klassen (optional)
----------------------------------

**Bitte überspringe diese Übung im Halbtagsworkshop.**

In dieser Übung peppen wir unseren DOM-Schnipsel mit etwas CSS auf.

Weiter oben hatten wir festgestellt dass alle Funktionen des Html-Moduls *zwei* Parameter erwarten? Bis jetzt haben wir als ersten Parameter - die Liste der Attribute - immer eine leere Liste übergeben. Anstatt einer leeren Liste wollen wir nun ein einzelnes Attribut übergeben. Als Attribute sind die Werte zulässig, die von den Funktionen in `Html.Attributes` erzeugt werden.

Hier ist ein Beispiel:

```
span [ class "some-class another-class" ] [ text "Etwas Text" ]
```

Das würde `<span class="some-class another-class">Etwas Text</span>` erzeugen.

Erweitere nun deine Lösung für Aufgabe 5.1 so, dass das folgende HTML erzeugt wird:

```
<div>
    <h1 class="text-warning">Überschrift 1</h1>
    <p class="text-success bold">Ein Absatz</p>
    <h2 class="text-danger">Überschrift 2</h2>
    <p class="text-muted italic">Noch ein Absatz</p>
</div>
```

Anmerkung: [Bootstrap](http://getbootstrap.com/css/) CSS ist bereits im Projekt integeriert, du kannst also alle Klassen benutzen, die Bootstrap bereitstellt. Bei Bedarf kannst du auch eigene CSS-Klassen in `frontend/scss/user.scss` hinzufügen (das ist allerdings für keine der Übungen erforderlich).

Übung 5.3
------------

Unterhalb der main-Funktion in `frontend/elm/Example005.elm` steht noch eine weitere Deklaration, der Wert `list` (eine Liste mit vier Strings).

Schreibe eine Funktion `renderListItem : String -> Html a`, die einen String als `li`-Tag rendert. Benutze dann `List.map` in `main` um die folgende DOM-Struktur zu erzeugen:

```
<ul>
  <li>one</li>
  <li>two</li>
  <li>three</li>
  <li>four</li>
</ul>
```

Die Implementierung von `main` aus der vorigen Übung muss dazu komplett gelöscht und durch ein `ul` ersetzt werden, dass einen `List.map`-Ausdruck als zweiten Parameter erhält. Ggf. musst du den `List.map`-Aufruf samt Parametern in Klammer setzen.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 6](/#006)**.
"""
