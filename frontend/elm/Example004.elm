module Example004 exposing (..)

import Html exposing (..)


list1 : List Int
list1 =
    []


main : Html a
main =
    text
        (toString (list1))
