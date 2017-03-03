module Solution003_2 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div
        []
        [ h1
            [ class "text-warning" ]
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
