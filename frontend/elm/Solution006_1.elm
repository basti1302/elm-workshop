module Solution006_1 exposing (..)

import Html exposing (..)


main : Html a
main =
    let
        list =
            [ "one"
            , "two"
            , "three"
            , "four"
            ]

        renderListItem string =
            li [] [ text string ]
    in
        ul [] (List.map renderListItem list)
