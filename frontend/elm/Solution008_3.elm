module Solution008_3 exposing (..)

import Html exposing (..)


type alias Book =
    { title : String
    , author : String
    , price : Float
    }


books : List Book
books =
    let
        book1 =
            { title = "Elm in Action"
            , author = "Richard Feldman"
            , price = 38.88
            }

        book2 =
            { title = "The Direction of Play"
            , author = "Kajiwara Takeo"
            , price = 17.5
            }
    in
        [ book1, book2 ]


main : Html a
main =
    let
        titles =
            List.map .title books

        titleToItem title =
            li [] [ text title ]

        listItems =
            List.map titleToItem titles
    in
        ul [] listItems
