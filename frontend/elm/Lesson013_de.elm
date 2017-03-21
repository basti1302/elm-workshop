module Lesson013De exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Einheit 13 - Talking to HTTP Backends
====================================

Introduction
------------

Elm is a *pure* functional language. In particular, all functions are *pure*, which means that for the same input parameter values, the function must return the same result value, *every single time*. If you call `(someFunction 42 "foo" True)` two times, it will return the exact same result both times.

But the real world is not pure. For example, an HTTP request, even with the exact same URL and query parameters  might work the first time and fail the second time due to network problems. How does Elm handle this mismatch?

The solution is that the Elm runtime handles impure code and side effects for you. Let's extend the example of the previous lesson with an HTTP request to see how this works in practice.

First of all, we need to upgrade from the `Html.beginnerProgram` to `Html.program` to be able to work with Elm's [`Cmd`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Platform-Cmd) (short for *command*) type. A command is something that you hand off to the Elm runtime for execution. This could be an HTTP request, some asynchronous task, getting the current time or generating a random value (or a number of other things that are not possible in pure Elm).

When Elm has executed your `Cmd`, it create a message representing the result and calls your `update` function with it. You specify which messages you want to receive when creating the `Cmd`.

Open the file  `frontend/elm/Example013.elm` in an editor. You might notice two key differences to the code in exercise 12, caused by our switch from `Html.beginnerProgram` to `Html.program`.

First, instead of `model` we now have to provide an `init` method which not only creates the initial model but also an initial command. This is handy in case you want to execute a command right at the start of your app. If you don't, you simple use `Cmd.none` to create a command that does nothing.

Second, the return type of the `update` function now is `( Model, Cmd Msg )` instead of simply `Model`. Thus, everytime `update` is called, you can manipulate the state of your model *and* ask Elm to execute a command. Again, for cases where you don't need to run a command, return your model together with `Cmd.none`.

The `getRandomNumber` is a stub (that you will need to implement in exercise 13.1, see below). When implemented it should create a command to send an HTTP request asking the site random.org for a single random number.

The `view` method renders a button that should trigger a new request for a random number. Actually, an Elm view function does not directly trigger a `Cmd`, it only sends a message (that might trigger a `Cmd` later in the `update` function). In this case, it sends a `TriggerRequest` message. This message is then pushed into the update method by the Elm runtime. The update method would then create the command (by calling `getRandomNumber`) and return it, together with the model, for example like this:

```
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TriggerRequest ->
            ( model, getRandomNumber )
        ...
```

When the request returns, it either has succeeded or failed. That's why the `ResponseReceived` wraps a value of type `Result Http.Error String`, which either contains an `Http.Error` (when the request has failed) or a simple string representing the response body (when the request has succeeded).

Relevant Docs
-------------

* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Platform-Cmd
* https://guide.elm-lang.org/architecture/effects/

Übung 13.1
-------------

Open the file  `frontend/elm/Example013.elm` in an editor, if it is not open already.

First, implement `getRandomNumber` to actually send a request.

Use `Http.getString` with the url `https://www.random.org/integers/?num=1&min=1&max=999&col=1&base=10&format=plain&rnd=new` to create the `request` object, then use `Http.send ResponseReceived request` to actually create the `Cmd`. Passing the constructor function `ResponseReceived` into `Http.send` tells the Elm runtime that we want to receive the result of the HTTP call as a `ResponseReceived` message.

Now, complete the implementation of the update function. You'll need the usual `case ... of` for the incoming message. In the `ResponseReceived` case you might need a second (nested) `case` statement for the `Result` value, like this:

```
case result of
    Ok newRandomNumber -> ...
    Err err -> ...
```

In the `Ok` case, put a string into the model's `message` attribute that contains the new random number. In the `Err` case, let the `message` be `toString err`.

----

Further Topics for Study
------------------------

You have reached the end of the workshop material. Congratulations! I hope you had some fun while working with Elm.

Of course, there is more to learn. Here are some aspects that are not (yet) covered by this beginner's workshop. Some of the topics will be included in an upcoming, extended version of this workshop.

* Tooling
    * Package management with elm-package
    * elm-repl
    * elm-format
    * ...
    * Editor/IDE integration
* Writing tests with elm-test.
* Tuples
* Working with Maybe
* Anonymous functions ( `\\ x -> ... ` )
* Advanced pattern matching
* The module system:
    * working with multiple modules,
    * details about the import statement
    * exposing functions from modules
* JSON encoding/decoding
* advanced HTTP requests
* `Task`
* working with web sockets, subsriptions
* nesting components with their own model, view and update function
* programWithFlags
* writing SPAs in Elm
* navigation in Elm SPAs
* JavaScript interop/ports

"""



-- <span class="fa fa-hand-o-right"></span> Mach weiter mit **[Einheit 14](/#014)**.
