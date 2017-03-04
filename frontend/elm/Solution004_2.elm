module Solution004_2 exposing (..)

import Html exposing (..)


list1 : List Int
list1 =
    [ 1, 2, 3 ] ++ [ 5, 6, 7 ]


main : Html a
main =
    text
        (toString (list1))
