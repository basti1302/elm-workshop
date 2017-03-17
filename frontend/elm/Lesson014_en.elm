module Lesson014En exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Lesson 14 - Talking to HTTP Backends
====================================

Introduction
------------

Elm is a *pure* functional language. In particular, all functions are *pure*, which means that for the same input parameter values, the function must return the same result value, *every single time*. If you call `(someFunction 42 "foo" True)` two times, it will return the exact same result both times.

But the real world is not pure. For example, an HTTP request, even with the exact same URL and query parameters  might work the first time and fail the second time due to network problems. How does Elm handle this mismatch?

The solution is that the Elm runtime handles impure code and side effects for you. Let's extend the example of the previous lesson with an HTTP request to see how this works in practice.

First of all, we need to upgrade from the `Html.beginnerProgram` to `Html.program` to be able to work with Elm [`Cmd`](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Platform-Cmd) (short for *command*) type. A command is something that you hand off to the Elm runtime for execution. This could be an HTTP request, some asynchronous task, getting the current time or generating a random value (or a number of other things that are not possible in pure Elm).

When Elm has executed your `Cmd`, it create a message representing the result and calls your `update` function with it. You specify which messages you want to receive when creating the `Cmd`.

Open the file  `frontend/elm/Example014.elm` in an editor. You might notice two key differences to the code in exercise 13, caused by our switch from `Html.beginnerProgram` to `Html.program`.

First, instead of `model` we now have to provide an `init` method which not only creates the initial model but also an initial command. This is handy in case you want to execute a command right at the start of your app. If you don't, you simple use `Cmd.none` to create a command that does nothing.

Second, the return type of the `update` function now is `( Model, Cmd Msg )` instead of simply `Model`. Thus, everytime `update is called, you can manipulate the state of your model *and* ask Elm to execute a command. Again, for cases where you don't need to run a command, return your model together with `Cmd.none`.

The `getRandomNumber` is a stub (that you will need to implement in exercise 14.1, see below). When implemented it should create a command to send an HTTP request asking random.org for a single random number.

The `view` method renders a button that should triggers a new request for a random number. Actually, in Elm a view method never directly triggers a `Cmd`, it only sends a message. In this case, it sends a `TriggerRequest` message. This message is then pushed into the update method by the Elm runtime. The update method would then create the command (by calling `getRandomNumber`) and return it, together with the model, for example like this:

```
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TriggerRequest ->
            ( model | getRandomNumber )
        ...
```

When the request returns, it either has succeeded or failed. That's why the `ReceivedResponse` wraps a value of type `Result Http.Error String`, which either contains an `Http.Error` (when the request has failed) or a simple string representing the response body (when the request has succeeded).

Relevant Docs
-------------

* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Platform-Cmd
* https://guide.elm-lang.org/architecture/effects/

Exercise 14.1
-------------

Open the file  `frontend/elm/Example014.elm` in an editor, if it is not open already.

First, implement `getRandomNumber` to actually send a request.

Use `Http.getString` with the url `https://www.random.org/integers/?num=1&min=1&max=999&col=1&base=10&format=plain&rnd=new` to create the `request` object, then use `Http.send ReceivedResponse request` to actually create the `Cmd`. Passing the constructor `ReceivedResponse` into `Http.send` tells the Elm runtime that we want to receive the result of the HTTP call as a `ReceivedResponse` message.

Now, complete the implementation of the update function. You'll need the usual `case ... of` for the incoming message. In the `ReceivedResponse` case you might need a second `case` statement for the `Result` value, like this:

```
case result of
    Ok newRandomNumber -> ...
    Err err -> ...
```

In the `Ok` case, put a string into the model's `message` attribute that contains the response body. In the `Err` case, let the `message` be `toString err`.

----

Further Topics for Study
------------------------

You have reached the end of the workshop material. Congratulations! I hope you had some fun while working with Elm.

Of course, there is more to learn. Here are some aspects that are not (yet) covered by this beginner's workshop. Some of the topics will be included in the next version of this workshop.

* tuples
* working with Maybe
* the module system, that is,
    * details about the import statement
    * working with multiple modules,
    * expose functions from modules
    * using modules with full qualified name versus non-qualified names via `import ... exposing`
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



-- <span class="fa fa-hand-o-right"></span> Continue with **[lesson 15](/#015)**.
