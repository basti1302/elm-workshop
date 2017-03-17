module Example010 exposing (..)

import Html exposing (..)


-- TODO Declare the Msg union type
-- type Msg = ?


-- TODO Implement the update function
-- update : Int -> Msg -> Int
-- update currentValue msg = ?


view : Int -> Html a
view value =
    let
        txt =
            text (toString (value))
    in
        li [] [ txt ]


main : Html a
main =
-- TODO Delete this line
    text "Exercise 10"
-- TODO Uncomment the code below after implementing Msg and update
-- let
--     someValues =
--         [ update 42 Increment
--         , update 42 Decrement
--         , update 42 (Set 10)
--         ]
--     items =
--         List.map view someValues
-- in
--     ul [] items
