module Example002 exposing (..)

import Html exposing (..)


main =
    text (toString (multiply (6 * 7)))


multiply a b =
    a * b
