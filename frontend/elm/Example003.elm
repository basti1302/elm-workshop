module Example003 exposing (..)

import Html exposing (..)


main =
    text (toString (multiply 2 3))


multiply a b =
    a * b
