module Exercise012 exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Exercise 12 - Union Types/Tagged Unions
=======================================

Introduction
------------

At the most basic level, union types in Elm feel like enumerations in other languages (Java, TypeScript, ...). Each union type consists of a number of constant names.

```
type LogLevel = Info | Warn | Error

logLevel : LogLevel
logLevel = Info
```

Union types are quite a bit more powerful than that, though. Each individual union type option can hold additional data in a type safe way:

```
type AuthenticationState =
    -- not signed in, so no additional data is needed
    NotSignedIn |
    -- store the user name together with the the authentication state
    SignedIn String

authState1 : AuthenticationState
authState1 = NotSignedIn

authState2 : AuthenticationState
authState2 = SignedIn "example.user"
```

When a function accepts a union type value as a parameter, it will usually want to know which case it is. The `case ... of` statement helps with that:

```
logLevelToMessage : LogLevel -> String
logLevelToMessage logLevel =
    case logLevel of
        Info ->
            "An information"

        Warn ->
            "A warning"

        Error ->
            "Red alert! Red Alert"
```

If a union type contains additional data (like `SignedIn` in the example above) you can get these values out with pattern matching:

```
authStateToMessage : AuthenticationState -> String
authStateToMessage authState =
    case authState of
        NotSignedIn ->
            "You are not signed in."

        SignedIn userName ->
            "Signed in as " ++ userName
```

Here, in the `SignedIn userName ->` case, the pattern `SignedIn userName` is matched against the value `authState`, thereby assigning the name `userName` to the string contained in the SignedIn value.

Relevant Docs
-------------

* http://elm-lang.org/docs/syntax#union-types
* https://guide.elm-lang.org/types/union_types.html

Exercise 12.1
-------------

Open the file  `frontend/elm/Example012.elm` in an editor.

Declare a union type `Msg` (short for message) with the values `Increment` and `Decrement` and a value `Set` which can contain a value of type `Int` (like `SignedIn` above could contain a `String` value).

Implement a function `update` with type `Int -> Msg -> Int` that accepts the *current value* and a `Msg` and returns a new integer value, based on the current value and the incoming `Msg`. That is, `update 5 Increment` would return 6, `update 5 Decrement` would return 4, and `update 5 (Set 99)` would return 99.

A `view` function that renders an integer value to HTML is already provided for you, so you don't have to bother about that in this exercise.

Finally, delete the dummy line `text "Exercise 12"` in the `main` function and uncomment the disabled code in the main function (beginning with `let someValues = ...`).

The result should look like this:

* 43
* 41
* 13

----

<span class="fa fa-hand-o-right"></span> Continue with **[exercise 13](/#013)**.
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
