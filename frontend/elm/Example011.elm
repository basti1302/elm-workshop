module Example011 exposing (..)

import Html exposing (..)


convert : Int -> String
convert v =
    "TODO"


main : Html a
main =
    let
        mappedValues =
            List.map convert [ 2, 4, 9, 11, 15, 24 ]
    in
        text (toString (mappedValues))
