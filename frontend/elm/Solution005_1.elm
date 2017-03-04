module Solution005_1 exposing (..)

import Html exposing (..)


main : Html a
main =
    div
        []
        [ h1
            []
            [ text "Headline 1" ]
        , p
            []
            [ text "A paragraph" ]
        , h2
            []
            [ text "Headline 2" ]
        , p
            []
            [ text "Another paragraph" ]
        ]
