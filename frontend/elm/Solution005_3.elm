module Solution005_3 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main : Html a
main =
    ul [] (List.map renderListItem list)


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


{-| The function renderListItem is only used in exercise 5.3, ignore it in
    exercises 5.1 and 5.2.

    Converts a string into a li (list item) tag.
-}
renderListItem : String -> Html a
renderListItem string =
    li [] [ text string ]
