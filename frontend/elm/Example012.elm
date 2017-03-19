module Example012 exposing (main)

import Html exposing (..)
import Html.Events exposing (..)


{-| When our main function does not return static HTML it is best to use a function like Html.beginnerProgram, Html.program or Html.programWithFlags.
-}
main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }


{-| It is a convention to call the type that represents your model "Model". So
even if our model is a simple Int, we create an alias named "Model" for Int.
-}
type alias Model =
    Int


{-| define the initial model value
-}
model : Model
model =
    0


{-| define all messages that might be send from the view to the runtime
-}
type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html Msg
view model =
    div []
        [ p [] [ model |> toString |> text ]
        , p
            []
            [ button [] [ text "-" ]
            , button [] [ text "+" ]
            ]
        ]
