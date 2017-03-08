module Solution010_1 exposing (..)

import Html exposing (..)


unsortedList : List Int
unsortedList =
    [ 3, 7, 2, 9, 5, 1 ]


main : Html a
main =
    unsortedList
        |> List.sort
        |> List.map toString
        |> String.join ", "
        |> text
