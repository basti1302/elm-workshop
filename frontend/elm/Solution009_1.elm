module Solution009_1 exposing (..)

import Html exposing (..)


type Msg
    = Increment
    | Decrement


update : Int -> Msg -> Int
update currentValue msg =
    case msg of
        Increment ->
            currentValue + 1

        Decrement ->
            currentValue - 1


view : Int -> Html a
view value =
    let
        txt =
            text (toString (value))
    in
        li [] [ txt ]


main : Html a
main =
    let
        someValues =
            [ update 42 Increment
            , update 42 Decrement
            ]

        items =
            List.map view someValues
    in
        ul [] items
