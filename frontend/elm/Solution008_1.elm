module Solution008_1 exposing (..)

import Html exposing (..)


type alias Book =
    { title : String
    , author : String
    , price : Float
    }


book1 : Book
book1 =
    { title = "Elm in Action"
    , author = "Richard Feldman"
    , price = 38.88
    }


main : Html a
main =
    let
        bookToString b =
            b.title
                ++ " - "
                ++ b.author
    in
        text (bookToString book1)
