module Exercise002 exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Exercise 2 - Hello World
========================

Open the file `frontend/elm/Example002.elm` in an editor. It looks exactly like `Example001.elm`, except for the module name. Now that we know some Elm syntax, let's play with it.

Exercise 2.1
------------
Change the text "Hello World" to something else. Check the result in your browser.
Notice that as long as `npm start` is running, you only need to save the file. The Webpack dev server will recompile everything automatically and trigger a browser refresh. For each exercise, the corresponding Elm module (`frontend/elm/Examplexxx.elm`) is embedded in page in the "Elm output" panel above, so you can check your results right there. Have an eye on the output of the webpack-dev-server (the shell where you started `npm start`) though. If your code does not compile, compile errors will be shown there. Compile errors are also reported in the browser dev tools' console.

Exercise 2.2
------------
Replace the text with a simple mathematical calculation, say `6 * 7`.
You will need to convert the result to a string first before passing it to
the text function. Use the `toString` function for this. Use parantheses for
nested function calls, like this:

```
text (toString (6 * 7))
```

In case you want to consult the docs:
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1
* http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Basics#toString

Excercise 2.3
-------------
Define a function of your own, named multiply, which accepts two parameters
and multiplies them. Call this function in the main function.
This is how a function definition looks like:

```
multiply a b = a * b
```

First comes the function name, then the parameter list, separated by spaces.
The equals sign starts the function body. Remember that Elm is not an
imperative language. All you can do in the function body is to produce a new
value, based on the input parameters.

Exercise 2.4
------------

Add some comments to your Elm code. Here's how:

```
-- a single line comment

{-
a comment over
multiple lines.
-}

{-| A documentation comment describing a function.
-}
someFunction a b c = ...
```

----

<span class="fa fa-hand-o-right"></span> Continue with **[exercise 3](/#003)**.
"""
