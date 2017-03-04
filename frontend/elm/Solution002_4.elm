module Solution002_4 exposing (..)

import Html exposing (..)


main =
    {- call multiply and apply toString to the result,
       then convert to a text node.
    -}
    text (toString (multiply 6 7))


{-| Multiplies two numbers.
-}
multiply a b =
    -- Lorem ipsum dolor sit amet.
    a * b
