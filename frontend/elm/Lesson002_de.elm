module Lesson002De exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Einheit 2 - Hello World
======================

Öffne die Datei `frontend/elm/Example002.elm` in einem Editor. Bis auf den Modulnamen sieht die Datei genauso aus wie `frontend/elm/Example002.elm`. Jetzt, wo wir die Grundlagen von Elm kennen, sollten wir ein bisschen damit arbeiten :)

Übung 2.1
---------
Ersetze den Text "Hello Elm!" durch etwas anderes. Überprüfe das Resultat im Browser. So lange `npm start` läuft, brauchst du die Datei einfach nur abzuspeichern und der webpack dev server kompiliert deinen Code automatisch und löst einen Browser Refresh aus. In jeder Einheit ist das passende Modul (`frontend/elm/Examplexxx.elm`) in die Seite eingebettet. So kannst du dir die Auswirkungen deiner Code-Änderungen sofort ansehen. Wenn der Code mal nicht kompiliert, werden die Compile-Fehler auch im Browser angezeigt. Zusätzlich werden Compile-Fehler auch durch den webpack-dev-server Prozess geloggt und erscheinen so in der Shell, in der `npm start` läuft.

Übung 2.2
---------
Ersetze den Text durch eine einfache mathematische Berechnung, z. B. `6 * 7`.
Der Ergebnis der Berechnung muss zuerst in einen String konvertiert werden, bevor du es an die Funktion `text` übergibst. Benutze dazu die Funktion `toString`. Benutze Klammern für geschachtelte Funktionsaufrufe, z. B. so:

```
text (toString (6 * 7))
```

Hier findest du bei Bedarf die Dokumentation dazu:
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#toString

Übung 2.3
---------
Definiere deine eigene Funktion namens `multiply`, die zwei Parameter entgegennimmt und multipliziert. Benutze diese Funktion dann in der main-Funktion. So sieht eine Funktionsdefinition aus:

```
multiply a b = a * b
```

Zuerst kommt der Funktionsname, dann die List der Parameter, wobei die einzelnen Parameter einfach durch Leerzeichen voneinander getrennt sind. Das Gleichheitszeichen leitet die Implementierung der Funktion ein. Da Elm keine imperative sondern eine funktionale Sprache ist, kann eine Funktionsimplementierung immer nur einen neuen Wert erzeugen, in Abhängigkeit von den Parametern.

Übung 2.4
------------

Füge dem Elm-Code einige Kommentare hinzu. In Elm gibt es drei Arten von Kommentaren:

```
-- Ein einzeiliger Kommtar

{-
Ein Kommentar
über mehere Zeilen.
-}

{-| Ein Dokumentationskommentar, der eine Funktion beschreibt.
-}
someFunction a b c = ...
```

----

<span class="fa fa-hand-o-right"></span> Fahre mit **[Einheit 3](/#003) fort**.
"""
