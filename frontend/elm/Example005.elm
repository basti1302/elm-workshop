module Example005 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main : Html a
main =
    p [] [ text "HTML Structures" ]


{-| The value list is only used in exercise 5.3, ignore it in exercises 5.1
    and 5.2.
-}
list : List String
list =
    [ "one"
    , "two"
    , "three"
    , "four"
    ]
