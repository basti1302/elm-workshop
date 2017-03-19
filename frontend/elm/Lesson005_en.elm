module Lesson005En exposing (..)

import Html exposing (Html)
import Markdown


main : Html ()
main =
    Markdown.toHtml [] """
Lesson 5 - HTML
===============

Introduction
------------

Open the file `frontend/elm/Example005.elm` in an editor.

This file's main function looks different than before:

```
p [] [ text "HTML Structures" ]
```

`p` is a function from the module `Html`. It renders a `<p>` tag. For all HTML tags you could possibly think of, there is function with the same name in the `Html` module, so there are also functions like `div`, `span`, `ul`, `li`, `a`, etc.

All of these functions accept two lists as parameters. The first list is the list of attributes (style, class, event listeners etc.), the second list is the list of child elements.

You should remember from the last lesson that lists are written as `[ element1, element2, ... ]` and `[]` is the empty list. So to produce an empty `<p/>` tag without attributes or children, you would write `p [] []`.

The notable exception to this pattern is `text`, which only accepts one parameters of type string.

Of course you can nest `Html` function calls to produce nested DOM structures, like so

```
div
    []
    [ span
        []
        [ text "Some text in a span in a div" ]
    ]
```

or like this

```
ul
    []
    [ li
        []
        [ text "First" ]
    , li
        []
        [ text "Second" ]
    , li
        []
        [ text "Third" ]
    ]
```

which produces an unordered list with three items.

This might seem a bit clunky now. Just keep in mind that Elm is not a templating language for static Html, but a functional language. Since all of this are function calls, we can do some quite elegant things in our view code (we come back to this in the excercise 6).

Relevant Docs
-------------

* [`Html` module](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html)
* [`Html.Attributes` module](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html-Attributes)

Exercise 5.1
------------

Open the file `frontend/elm/Example005.elm` in an editor. Remove `main`'s  function body (the `p` function call) and replace it with Elm code that produces the following DOM:

```
<div>
    <h1>Headline 1</h1>
    <p>A paragraph</p>
    <h2>Headline 2</h2>
    <p>Another paragraph</p>
</div>
```

Check the resulting document structure with your browser's developer tools.

Exercise 5.2 - Classes (optional)
---------------------------------

**Please skip this exercise in the half day workshop.**

In this exercise we are going to add some CSS classes to our little piece of DOM.

Remember when we said that all functions from the Html module accept *two* parameters? Until now, we always passed an empty list for the first parameter, which is actually the list of attributes. Instead of an empty list, we are now going to pass a single attribute. Attributes are values produced by the functions in the `Html.Attributes` module.

Here is an example:

```
span [ class "some-class another-class" ] [ text "some text" ]
```

This would produce `<span class="some-class another-class">some text</span>`.

Now, extend your solution from exercise 5.1 so that the following HTMl is produced.

```
<div>
    <h1 class="text-warning">Headline 1</h1>
    <p class="text-success bold">A paragraph</p>
    <h2 class="text-danger">Headline 2</h2>
    <p class="text-muted italic">Another paragraph</p>
</div>
```

Remark: [Bootstrap](http://getbootstrap.com/css/) CSS is included in the bundle, so you can use any Bootstrap CSS class. If you really wanted to, you could also add more custom classes  in `frontend/scss/user.scss` (but it is not required for any of the exercises).


Exercise 5.3
------------

Below the main function in `frontend/elm/Example005.elm`, you will find another declaration, a value named `list` (a list of four strings).

Write a function `renderListItem : String -> Html a`, that renders a string into an `li` tag. Then, use `List.map` in `main` to create the following DOM structure:

```
<ul>
  <li>one</li>
  <li>two</li>
  <li>three</li>
  <li>four</li>
</ul>
```

Basically, you need to replace current body of the main function with an `ul` that receives a `List.map` expression as its second parameter. You might need to wrap your `List.map` call in parantheses.

----

<span class="fa fa-hand-o-right"></span> Continue with **[lesson 6](/#006)**.
"""



-- Exercise 5.4 (Optional) - Styles
-- --------------------------------
--
-- Inline styles are syntactically a bit more complicated than classes, because the are passed as a list of tuples to the styles function. If you want to, check out the examples in the docs for [the style function](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html-Attributes#style) and add some inline styles.
--
-- As this is not required knowledge for the rest of this workshop and inline styles are meh anyway, you can also skip this exercise.
