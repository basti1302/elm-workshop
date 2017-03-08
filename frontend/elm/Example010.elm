module Example010 exposing (..)

import Html exposing (..)


unsortedList : List Int
unsortedList =
    [ 3, 7, 2, 9, 5, 1 ]


main : Html a
main =
    -- Actually, this could also be written as
    -- text (String.join ", " (List.map toString (List.sort unsortedList)))
    let
        sorted =
            List.sort unsortedList

        strings =
            List.map toString sorted

        joined =
            String.join ", " strings

        result =
            text joined
    in
        result
