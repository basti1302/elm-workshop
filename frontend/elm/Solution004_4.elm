module Solution004_4 exposing (..)

import Html exposing (..)


list1 : List Int
list1 =
    0 :: [ 1, 2, 3 ] ++ [ 5, 6, 7 ]


increment : Int -> Int
increment x =
    x + 1


list2 : List Int
list2 =
    List.map increment list1


main : Html a
main =
    text
        (toString (list2))
