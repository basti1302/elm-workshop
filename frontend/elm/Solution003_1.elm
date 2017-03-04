module Solution003_1 exposing (..)

import Html exposing (..)


main =
    text (toString (multiply 2 3))


multiply : Int -> Int -> Int
multiply a b =
    a * b
