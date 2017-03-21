module Lesson001En exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
English or German?
==================

* Schalte die Sprache oben rechts um, wenn du mit der deutschen Übersetzung arbeiten möchtest.
* You can switch the language between German and English in the upper right corner.

Lesson 1 - Setup
================

Getting started
---------------

Welcome to the Elm workshop! If you did not yet follow the setup instructions in `readme.markdown`, please do so now to set everything up.

However, if you are seeing this in a browser served from http://localhost:7000 you have set up everything successfully. Hooray!

Workshop Setting
----------------

This workshop is intended as a live workshop with a trainer. You might be able to work through the exercises by yourself, but this might not be the most effective way. If you would like to arrange an on-site workshop at your company or for a conference, feel free to contact <a href="mailto:bastian.krol@codecentric.de">bastian.krol@codecentric.de</a>. The workshop length and the covered topics are flexible and can be customized to your specific needs, ranging from a half day basics workshop to a multi-day in depth Elm bootcamp.

Elm Syntax Basics - a Very Short Guided Tour
--------------------------------------------

Open the file `frontend/elm/Example001.elm` in an editor. The file looks like this:

```
module Example001 exposing (..)

import Html exposing (..)

main =
    text "Hello Elm!"
```

What's all that?

The first line

```
module Example001 exposing (..)
```

declares a module with the name `Example001`. All Elm code always needs to be in a module. Don't worry about the `exposing` part in the module declaration for now.

Next, with

```
import Html exposing (..)
```

we import the `Html` module to be able to use functions from it.

Finally, the `main` function:

```
main = text "Hello Elm!"
```

This is the entry point into our module. Whatever we return from it will be rendered. Elm is strongly typed, so we can not just return a string. Instead, we need to convert the string into an *HTML text node* by calling the function `text` from the `Html` module.

Since in the `import` statement we import *everything* from the `Html` module with the phrase `exposing (..)` we can refer to all `Html` functions by their unqualified name. That is, when we write `text`, the Elm compiler knows we are talking about the `text` function from the `Html` module. If the import statement had been `import Html` (omitting the `exposing` part), we would have to use the full qualified name `Html.text` in our `main` function.

Now you know the basics of Elm's syntax. Let's get started with some hands on exercises.

----

Do you see the navigation bar at the top? You can use it to switch between the lessons anytime. You can also change the language there.

<span class="fa fa-hand-o-right"></span>  Now, continue with **[lesson 2](/#002)**.
"""
