module Solution014_1 exposing (..)

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
    case msg of
        TriggerRequest ->
            ( { model | message = "loading..." }
            , getRandomNumber
            )

        ReceivedResponse result ->
            let
                updatedModel =
                    case result of
                        Ok newRandomNumber ->
                            { model | message = "Latest random number: " ++ newRandomNumber }

                        Err err ->
                            { model | message = toString err }
            in
                ( updatedModel, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ p [] [ model |> .message |> text ]
        , p [] [ button [ onClick TriggerRequest ] [ text "execute request" ] ]
        ]


getRandomNumber : Cmd Msg
getRandomNumber =
    let
        url =
            "https://www.random.org/integers/?num=1&min=1&max=999&col=1&base=10&format=plain&rnd=new"

        request =
            Http.getString url
    in
        Http.send ReceivedResponse request
