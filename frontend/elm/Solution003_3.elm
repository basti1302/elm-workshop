module Solution003_3 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div
        []
        [ h1
            [ style
                [ ( "font-size", "100px" )
                , ( "color", "#f0f" )
                ]
            ]
            [ text "Headline 1" ]
        , p
            [ class "text-success bold" ]
            [ text "A paragraph" ]
        , h2
            [ class "text-danger" ]
            [ text "Headline 2" ]
        , p
            [ class "text-muted italic" ]
            [ text "Another paragraph" ]
        ]
