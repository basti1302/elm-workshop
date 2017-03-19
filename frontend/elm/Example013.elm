module Example013 exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Http


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { message : String
    }


init : ( Model, Cmd Msg )
init =
    ( { message = "click the button!"
      }
    , Cmd.none
    )


type Msg
    = TriggerRequest
    | ReceivedResponse (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    -- TODO Implement the update function for TriggerRequest and ReceivedResponse
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ p [] [ model |> .message |> text ]
        , p []
            [ button [ onClick TriggerRequest ] [ text "execute request" ]
            ]
        ]


getRandomNumber : Cmd Msg
getRandomNumber =
    -- TODO Implement an HTTP request to
    -- "https://www.random.org/integers/?num=1&min=1&max=999&col=1&base=10&format=plain&rnd=new"
    -- that will trigger a ReceivedResponse message when it has been executed.
    Cmd.none
