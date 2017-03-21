module Lesson007De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 7 - Typ-Alias
=====================

Einleitung
------------

Du kannst in Elm mit `type alias` einen Alias (also einen alternativen Namen) für jeden beliebigen Typ festlegen. Beispiele:

```
type alias Name = String
type alias Age = Int

type alias ManyStrings = List String
```

Der ursprüngliche Typ und sein Alias können beide gleichwertig verwendet werden. Einer Funktion, die einen `String` als Parameter erwartet, kann auch ein `Name` übergeben werden und umgekehrt.

Relevante Dokumentation
-----------------------

* http://elm-lang.org/docs/syntax#type-aliases

Übungen
-------

Für das Thema Typ-Alias gibt es keine Übungen, aber wir werden Aliase verwenden, wenn wir in [Übung 8](/#008) *Records* einführen.

----

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 8](/#008)**.
"""
