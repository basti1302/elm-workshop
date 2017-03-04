module Exercise010 exposing (..)

import Html exposing (..)
import Markdown


main : Html a
main =
    Markdown.toHtml [] """
Exercise 10 - Topic
==================

Introduction
------------

Relevant Docs
-------------

*

Exercise 10.1
------------

Exercise 10.2
------------


----

<span class="fa fa-hand-o-right"></span> Continue with **[exercise 11](/#011)**.
"""
