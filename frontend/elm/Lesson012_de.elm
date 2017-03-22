module Lesson012De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 12 - Web Apps (endlich!)
================================

Einleitung
----------

Bis jetzt haben wir nur über statisches HTML und die Elm-Syntax geredet. Höchste Zeit, etwas zu programmieren, das ein bisschen interaktiver ist. Schließlich ist Elm für interaktive Web Apps gedacht.

Wir schreiben im folgenden eine minimalistische Zähler-App, die einen Zähler anzeigt und zwei Buttons, um den Zähler zu inkrementieren und dekrementieren.

Um das zu erreichen, geben wir aus unserer `main`-Funktion nicht mehr statisches HTML zurück. So funktioniert eine typische Elm App ohnehin nicht. Stattdessen benutzen Elm Apps üblicherweise eine der folgenden drei Optionen:

* [Html.beginnerProgram](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#beginnerProgram),
* [Html.program](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#program) or
* [Html.programWithFlags](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#programWithFlags).

`Html.program` und `Html.programWithFlags` ignorieren wir erst fürs erste und benutzen `Html.beginnerProgram`. Dieser Funktion müssen wir einen Record mit drei Attributen geben:

* einen Wert `model`, der den initialen Zustand unseres Modells darstellt,
* eine Funktion `view`, die das Modell in HTML übersetzt, und
* eine Funktion `update` die alle *Messages* (Benutzereingaben, Mausklicks, zurückkehrende HTTP-Requests, etc.) verarbeitet und das Modell entsprechend der eingehenden Message aktualisiert.

### Model

Das `model` kann von einem beliebigen Typ sein. Elm benutzt Typ-Variablen, um das zu erreichen. Der Konvention nach deklarieren wir einen Typ namens `Model` dafür. Das könnte ein Record-Typ sein, eine Liste, ein simpler Typ-Alias, was auch immer für unseren Anwendungsfall gerade passt. Für unsere Zähler-App könnten wir z. B. Folgendes verwenden:

```
type alias Model = Int
```

Wir benötigen ja als unser Modell nur einen simplen Integer. Nun, da wir den Typ festgelegt haben, initialisieren wir das Modell:

```
model : Model
model = 0
```

### Messages

Des Weiteren benötigen wir einen Union Type (üblicherweise `Msg` genannt) der die Messages beschreibt, die unsere `update`-Funktion bekommt. Für die Zähler-App benötigen wir erstmal nur zwei Messages:

```
type Msg = Increment | Decrement
```

### Update

Die Funktion `update` muss die Signatur `update : Msg -> Model -> Model` haben, sie bekommt also eine Message und den aktuellen Zustand des Modells. AufBasis dieser Eingaben erzeugt sie den *neuen* Zustand des Modells, der durch die Verarbeitung der Message erzeugt wird. Die meisten update-Funktionen benutzen `case ... of`, um festzustellen, welche Message sie erhalten haben.

### View

Die Funktion `view` bekommt den aktuellen Zustand des Modells und produziert auf dieser Basis HTML.

In einer Web App löst die Benutzerin durch ihre Interaktion mit der App Ereignisse aus (sie klickt auf einen Button, gibt etwas in ein Eingabefeld ein, etc.). Benutzerunteraktion wird in Elm als Message modelliert. Der Typ der Messages, die von einer View erzeugt werden, bleibt dabei uns überlassen. Das ist der Grund, warum der Typ `Html` einen Typparameter hat (z. B. `Html Msg`). Da unser Message-Typ `Msg` ist, muss die Signatur unserer `view`-Funktion `view : Model -> Html Msg` sein. Der Message-Typ in unserer update-Funktion muss der gleiche sein wie in unserer view-Funktion, ansonsten beschwert sich der Compiler.

Randbemerkung: In Übung 3.2 hatten wir gesagt, dass der Typ von `main` nicht einfach `Html` sondern `Html a` ist und dass wir später darauf zurückkommen. Nun haben wir die Erklärung dazu. Da unser HTML in Übung 3.2 noch gar keine Messages produziert hat, war uns der Typparameter an dieser Stelle egal und wir haben eine ungebundene *Typvariable* `a` verwendet.

### Events

Um die Benutzerinteraktion in unserem HTML zu ermöglichen, benutzen wir das Modul `Html.Events`. Es stellt Funktionen wie `onClick`, `onInput` und `onBlur` zur Verfügung. Um es benutzen zu können, benötigen wir einen weiteren Import in unserem Modul:

```
import Html.Events exposing (..)
```

Um einen Event-Handler an ein DOM-Element zu binden, wird dieser im ersten der beiden Listen-Parameter übergeben, die jede HTML-Funktion bekommt:

```
button [ onClick Increment ] [ text "+" ]
```

Dieser Code erzeugt einen Button mit der Beschriftung "+". Wenn der Button angeklickt wird, wird die Message `Increment` erzeugt. Die Elm-Runtime ruft für jede Message, die in unserer View erzeugt wird, unsere `update`-Funktion auf. Dort können wir die Nachricht verarbeiten und unser Modell entsprechend aktualisieren.

### Main

Jetzt haben wir alle Bestandteile beisammen und können sie als Record an `Html.beginnerProgram` übergeben (in unserer `main`-Funktion):

```
main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
```

Um den Rest kümmert sich `Html.beginnerProgram` und die Elm-Runtime.

Relevante Dokumentation
-----------------------

* http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#beginnerProgram
* https://guide.elm-lang.org/architecture/

Übung 12.1
----------

Öffne die Datei `frontend/elm/Example012.elm` in einem Editor. Dort ist schon ein Teil der oben behandelten Struktur skizziert. Es fehlen aber noch ein paar Dinge und die Buttons funktionieren noch nicht.

* Füge die `Increment`- und `Decrement`-Messages zum Typ `Msg` hinzu.
* Entferene die `NoOp` message.
* Implementiere die `update`-Funktion, so dass `Increment` und `Decrement` korrekt verarbeitet werden.
* Füge den Buttons in der `view`-Funktion die passenden `onClick` handler hinzu.
* Überprüfe, dass alles wie erwartet funktioniert - teste deine App im obigen "Elm Output" Panel.

Übung 12.2 (optional)
---------------------

Ersetze den Alias `type alias Model = Int` durch einen Typ-Alias für einen Recordtyp, der nur ein Integer-Attribut namens `counter` hat. Passe den Rest des Codes entsprechend an.

Tip: Wenn der Elm-Compiler nicht mehr meckert, ist das Refactoring höchstwahrscheinlich abgeschlossen und deine App funktioniert wieder tadellos. Das ist fast immer so, wenn man mit Elm arbeitet, egal wie groß das Refactoring ist. Wenn es kompiliert, läufts! :)

Übung 12.3 (optional)
---------------------

Diese Übung ist ein kleines bisschen schwieriger :-)

Füge noch ein Texteingabefeld hinter den Buttons hinzu. Das Eingabefeld sollte eine Message erzeugen, wenn sich sein Inhalt ändert. Wir könnten diese Nachricht z. B. `OnInput` nennen. Da diese Nachricht einen String enthalten wird, muss der neue `Msg`-Wert so etwas wie `OnInput String` sein.

Füge der `update`-Funktion Code hinzu, die den aktuellen Counter mit dem Wert überschreibt, der in der `OnInput`-Nachricht enthalten ist. Da die Nachricht einen String enthält, muss dieser zuerst in einen Integer konvertiert werden. Die Funktionen [`String#toInt`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/String#toInt) und [Result.withDefault](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Result#withDefault) könnten hier nützlich sein.

----

Der Halbtags-Workshop endet hier. Herzlichen Glückwunsch zur erfolgreichen Bearbeitung der Aufgaben!

Natürlich kannst du gerne noch weitermachen, z. B.
* Einheiten und/oder Übungen bearbeiten, die wir übersprungen haben,
* das bearbeitete Material noch einmal durchgehen und etwas mehr mit dem Code in den Übungen experimentieren oder
* mit der nächsten Einheit weitermachen, die sonst in einer längeren Version des Workshops (Ganztagesworkshop oder mehrtägiger Workshop) abgedeckt würde.

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 13](/#013)**, oder schaue dir eine der übersprungenen Einheiten an, z. B. die Einheit zu Verzweigungen (<span class="fa fa-hand-o-right"></span> **[Einheit 10](/#010)**) oder zu fortgeschrittener Funktionsanwendung (<span class="fa fa-hand-o-right"></span>  **[Einheit 11](/#011)**).
"""
