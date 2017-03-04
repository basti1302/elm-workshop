module Solution003_2 exposing (..)

import Html exposing (..)


main : Html a
main =
    text (toString (multiply 2 3))


multiply : Int -> Int -> Int
multiply a b =
    a * b
