module Lesson001De exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Einheit 1 - Einrichtung
=======================

Erste Schritte
--------------

Willkommen beim Elm Workshop! Wenn du noch nicht die Anweisungen in der Datei `readme.markdown` durchgearbeitet hast, solltest du das jetzt tun, um alles einzurichten.

Wenn du allerdings diese Seite hier in deinem Browser siehst und sie von http://localhost:7000 ausgeliefert wird, hast du schon alles erfolgreich eingerichet. Großartig!

Der Workshop
------------

Dieser Workshop ist darauf ausgelegt, in einer Gruppe mit einem Trainer durchgeführt zu werden. Man kann die Aufgaben vermutlich auch alleine durchgehen, auch wenn das nicht die effektiveste Möglichkeit ist. Wenn du diesen Workshop in deiner Firma oder auf einer Konferenz durchführen möchtest, kannst gerne mit <a href="mailto:bastian.krol@codecentric.de">bastian.krol@codecentric.de</a> Kontakt aufnehmen. Die Länge des Workshops und die behandelten Themen sind flexibel und können auf eure individuellen Anforderungen abgestimmt werden, vom Halbtages-Grundlagen-Kurs bis zum mehrtägigen Elm-Bootcamp.

Elm Syntax Grundlagen
---------------------

Öffne die Datei `frontend/elm/Example001.elm` in einem Editor. Hier ist der Inhalt der Datei:

```
module Example001 exposing (..)

import Html exposing (..)

main =
    text "Hello Elm!"
```

Was bedeuten diese drei Zeilen?

Die erste Zeile

```
module Example001 exposing (..)
```

deklariert ein Modul mit dem Namen `Example001`. Jeglicher Elm-Code muss sich innerhalb eines Moduls befinden. Den `exposing`-Teil an der Modul-Deklaration ignorieren wir erst einmal.

Als nächstes kommt:

```
import Html exposing (..)
```

Damit importieren wir das `Html` Modul, so dass wir Funktionen aus diesem Modul benutzen können.

Zu guter Letzt kommt die Funktion `main`.

```
main = text "Hello Elm!"
```

Dies ist der Einsprungspunkt in unser Modul. Das, was diese Funktion zurückgibt, wird dargestellt. Elm ist stark typisiert, daher können wir nicht einfach einen String zurückgeben. Stattdessen müssen wir den String "Hello Elm!" in eine *HTML Text-Node* konvertieren, in dem wir die Funktion `text` aus dem Model `Html` verwenden.

Da wir in der `import`-Anweisung mit der Phrase `exposing (..)` *alle* Funktionen aus dem Model `Html` importieren, können wir deren Namen *unqualifiziert* verwenden. Das bedeutet, dass wir einfach `text` schreiben können statt `Html.text`. Hätten wir in der import Anweisung nur `import Html` geschrieben und das `exposing (..)` weggelassen, müssten wir im in unserer `main`-Funktion den vollqualifizierten Name `Html.text` verwenden.

Nun, da wir die Grundlagen der Elm-Syntax kennen, können wir mit den praktischen Übungen loslegen.

----

Siehst du die Navigationsleiste am oberen Rand? Dort kannst du jederzeit zwischen den einzelnen Einheiten hin- und herschalten sowie die Sprache umschalten.

<span class="fa fa-hand-o-right"></span> Machh weiter mit  **[Einheit 2](/#002)**.
"""
