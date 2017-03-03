module Exercise001 exposing (..)

import Markdown


main =
    Markdown.toHtml [] """
Exercise 1 - Setup
==================

Getting started
---------------

If you did not yet follow the setup instructions in `readme.mardown`, please follow these steps to set everything up.

However, if you are seeing this in a browser served from http://localhost:7000 you have set up everything successfully. Hooray!

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

declares a module with the name `Example001`. All Elm code always needs to be in a module. Don't worry about the exposing keyword for now.

Next, with

```
import Html exposing (..)
```

we import the `Html` module to be able to use functions from it.

Finally, the `main` function:

```
main = text "Hello Elm!"
```

This is the entry point into our module. Whatever we return from it will be rendered. Elm is strongly typed, so we can not just return a string here. Instead, we need to convert the string into an HTML text node by calling the function text from the Html module.

Now you know the basic syntactic building blocks of Elm. Let's get started with some hands on exercises.

----

Do you see the navbar at the top? You can always switch between exercises by clicking on the exercise numbers there.

<span class="fa fa-hand-o-right"></span>  Now, continue with **[exercise 2](/#002)**.
"""
