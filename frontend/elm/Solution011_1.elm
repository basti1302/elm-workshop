module Solution011_1 exposing (..)

import Html exposing (..)


convert : Int -> String
convert v =
    if (rem v 2 == 0) then
        "even"
    else if (rem v 3 == 0) then
        "divisible by three"
    else
        "whatever"


main : Html a
main =
    let
        mappedValues =
            List.map convert [ 2, 4, 9, 11, 15, 24 ]
    in
        text (toString (mappedValues))
