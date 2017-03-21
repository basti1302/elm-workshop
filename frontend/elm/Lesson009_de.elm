module Lesson009De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 9 - Union Types/Tagged Unions
=====================================

Einleitung
----------

Eine weitere Komponente des Typsystems in Elm sind *Union Types*. Diese ähneln dem ersten Eindruck nach Enumerations, wie sie aus anderen Sprachen (Java, C, TypeScript, ...) bekannt sind. Die Deklaration eines Union Types listet einfach die möglichen *Union Type Values* auf, wobei die einzelnen Alternativen durch das Pipe-Symbol (`|`) getrennt werden.

```
type LogLevel = Info | Warn | Error

logLevel : LogLevel
logLevel = Info
```

Wenn eine Funktion einen Union Type als Parameter bekommt, wird sie wahrscheinlich wissen wollen, um welchen der möglichen Werte es sich handelt. Dies lässt sich mit der `case ... of` Anweisung feststellen:

```
logLevelToMessage : LogLevel -> String
logLevelToMessage logLevel =
    case logLevel of
        Info ->
            "Eine Information"

        Warn ->
            "Eine Warnung"

        Error ->
            "Alarm! Fehler! Große Katastrophe!"
```

Tatsächlich sind Union Types aber deutlich mächtiger. Jeder Union Type Value kann weitere Daten typsicher enthalten:

```
{-| Gibt an, ob und welcher Benutzer angemeldet ist -}
type AuthenticationState =
    -- Nicht angemeldet, es werden keine weiteren Daten benötigt
    NotSignedIn |
    -- Der Benutzername des angemeldeten Benutzers wird zusammen mit dem
    -- Anmeldestatus hinterlegt.
    SignedIn String

authState1 : AuthenticationState
authState1 = NotSignedIn

authState2 : AuthenticationState
authState2 = SignedIn "example-user"
```

Wenn ein Union Type Value weitere Werte enthält (wie z. B. `SignedIn` im obigen Beispiel) kann man diese in einem `case ... of` mit *Pattern Matching* auslesen:

```
authStateToMessage : AuthenticationState -> String
authStateToMessage authState =
    case authState of
        NotSignedIn ->
            "Du bist nicht angemeldet."

        SignedIn userName ->
            "Angemeldet als " ++ userName
```

Hier wird im Fall für `SignedIn` das Muster `SignedIn userName` mit dem Wert `authState` abgeglichen und damit dem in SignedIn-Wert enthaltenen String der Bezeichner `userName` zugewiesen.

Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#union-types
* https://guide.elm-lang.org/types/union_types.html

Übung 9.1
-------------

Öffne die Datei `frontend/elm/Example009.elm` in einem Editor.

Deklariere einen Union Type `Msg` (Abkürzung für *Message*) mit den Werten `Increment` und `Decrement`.

Implementiere eine Funktion `update : Int -> Msg -> Int`, die den *aktuellen Wert* (ein Integer) und eine `Msg` entgegennimmt und einen neuen Wert zurückgibt, basierend auf dem aktuellen Wert und der `Msg`. Beispiel: `update 5 Increment` sollte 6 zurückgeben und `update 5 Decrement` sollte 4 zurückgeben.

Eine `view` Funktion, die den Integer-Wert in HTML konvertiert, ist bereits vorhanden, darum musst du dich in dieser Aufgabe also nicht kümmern.

Löschen schließlich die Zeile `text "Exercise 9"` in der `main`-Funktion und aktiviere den auskommentierten Code, beginnend mit `let someValues = ...`.

Das Resultat sollte folgendermaßen aussehen:

* 43
* 41

Übung 9.2
---------

Füge einen weiteren Union Type Value names `Set` zum Union Type `Msg` hinzu. `Set` enthält einen `Int`, so wie `SignedIn` im obigen Beispiel einen `String` enthielt.

Erweitere die Funktion `update`, so dass `Set` korrekt verarbeitet wird. `update 5 (Set 99)` sollte zum Beispiel 99 zurückgeben.

Füge abschließend ein weiteres Element zur Liste `someValues` hinzu, welches `Set` verwendet, z. B. `update 42 (Set 10)`.

Das Resultat sollte folgendermaßen aussehen:

* 43
* 41
* 10

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 10](/#010)**.
"""



-- You can also use *type variables* when declaring your union type if, you need something more generic:
--
-- ```
-- type Result error value
--     = Ok value
--     | Err error
--
-- someResult1 : Result String Int
-- someResult1 = Ok 42
--
-- someResult2 : Result String Int
-- someResult2 = Err "That did not work"
-- ```
--
-- With a declaration like this you can use `Result` with many different concrete types for your success values and for your error values respectively. In Elm, type variables start with a lower case (often, only one character is used to name a type variable) while actual types start with an upper case character.
--
