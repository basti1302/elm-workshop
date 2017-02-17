module Main exposing (main)

import Html exposing (..)


-- main : Program Never Model Msg
-- main =
--    Navigation.program locationToMsg
--        { init = init
--        , update = update
--        , subscriptions = subscriptions
--        , view = view
--        }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    Int


model : Model
model =
    0


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html Msg
view model =
    p [] [ text "Hello World" ]
