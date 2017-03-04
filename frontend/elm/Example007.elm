module Example007 exposing (..)

import Html exposing (..)


list : List String
list =
    [ "one"
    , "two"
    , "three"
    , "four"
    ]


renderListItem : String -> Html a
renderListItem string =
    li [] [ text string ]


main : Html a
main =
    ul [] (List.map renderListItem list)
