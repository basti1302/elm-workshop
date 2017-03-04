module Example006 exposing (..)

import Html exposing (..)


list : List String
list =
    [ "one"
    , "two"
    , "three"
    , "four"
    ]


{-| Converts a string into a li (list item) tag
-}
renderListItem : String -> Html a
renderListItem string =
    li [] [ text string ]


main : Html a
main =
    ul [] []
