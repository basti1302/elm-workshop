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

The `update` function must have the signature `update : Msg -> Model -> Model`, that is, it takes a message and the current state of the model. It then produces the new state of the model after processing the message. Most update functions use a `case ... of` statement to check which message value they have received.

### View

The `view` function takes the current state of the model and produces corresponding HTML.

In a web app, the user can trigger events by interacting with the page (clicking a button, typing in a text field, etc.). User interaction is modelled as messages in Elm. The type of the messages that can be triggerd from a view is up to us, that is why the type `Html` takes a type parameter (such as `Html a` or `Html Msg`). Since our message type is `Msg`, the signature of our `view` function needs to be `view : Model -> Html Msg`. The message types used in the update function and in the view function must be the same, otherwise the compiler will complain.

Side note: Remember exercise 3.2 when we said that the type of `main` is not simply `Html` but `Html a` and that we would come back to this type parameter later? Well, now this mystery has been solved. Since we were not interested in the messages produced by the HTML in our earlier examples, we simply used an unbound *type variable* `a` there and ignored it.

### Events

To make an HTML element do anything, we use the `Html.Events` module. It contains things like `onClick`, `onInput`, `onBlur` and so on.

To use it, we need a new import at the top of the module:

```
import Html.Events exposing (..)
```

We attach event handlers to our DOM elements by adding them to the first of the two lists that we pass to each Html function:

```
button [ onClick Increment ] [ text "+" ]
```

This renders a button element with a "+" on it. When this button is clicked, the `Increment` message is produced. The Elm runtime will feed all messages that our view produces back into our `update` function, where we can process them to update our model.

### Main

Finally, with everything in place, we can call `Html.beginnerProgram` from our `main` function and pass the required record:

```
main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
```

The rest will be handeld by `Html.beginnerProgram` and the Elm runtime.

Relevant Docs
-------------

* http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#beginnerProgram
* https://guide.elm-lang.org/architecture/

Übung 12.1
-------------

Open the file  `frontend/elm/Example012.elm` in an editor. It outlines most of what we have discussed above. A few things are missing, tough, so the buttons won't work.

* Add the `Increment` and `Decrement` messages to the `Msg` type.
* Remove the `NoOp` message from to the `Msg` type.
* Implement the `update` function so that it correctly processes `Increment` and `Decrement` messages and returns an updated model.
* Add `onClick` handlers to the buttons in the `view` function.
* Verify that everything works as expected by clicking on the buttons in the "Elm output" panel above.


Übung 12.2 (optional)
------------------------

Replace the `type alias Model = Int` with a type alias for a record type that only has one integer attribute named `counter`. Update the rest of the code accordingly.

Übung 12.3 (optional)
------------------------

This one is a bit more difficult :-)

Add an input field after the buttons and send a message, when the input changes. Let's say we call this new message `OnInput`. Since this event will contain a string value, the new `Msg`  will need to be something like `OnInput String`.

Add code to the `update` function to overwrite the current counter value with the value contained in the `OnInput` message. Note: You will receive a string there, which you will need to convert into an integer. The functions [`String#toInt`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/String#toInt) and [Result.withDefault](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Result#withDefault) might be useful here.

----

The half day workshop ends here. Congratulations for finishing it! <3

Of course you are welcome to
* explorer lessons and/or exercises you might have skipped,
* review the covered material again and experiment some more with the code in the exercises you have completed, or
* continue with the next exercise that would be covered in a longer workshop (full day or multi day).

<span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 13](/#013)**, or review one of the skipped lessons, for example about conditionals (<span class="fa fa-hand-o-right"></span> **[Einheit 10](/#010)**) or about fancy function application (<span class="fa fa-hand-o-right"></span>  **[Einheit 11](/#011)**).
"""
