module Solution004_1 exposing (..)

import Html exposing (..)


list1 : List Int
list1 =
    [ 1, 2, 3 ]


main : Html a
main =
    text
        (toString (list1))
