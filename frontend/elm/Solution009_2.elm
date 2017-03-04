module Solution009_2 exposing (..)

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
    , price = 39.99
    }


applyDiscount : Book -> Book
applyDiscount book =
    { book | price = book.price * 0.5 }


main : Html a
main =
    let
        discountedBook =
            applyDiscount book1

        bookToString b =
            b.title
                ++ " - "
                ++ b.author
                ++ ": "
                ++ toString (b.price)
    in
        text (bookToString discountedBook)
