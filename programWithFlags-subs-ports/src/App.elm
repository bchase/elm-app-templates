module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Time
import Types exposing (Flags, Model, Msg(..))
import Ports


---- INIT ----


init : Flags -> ( Model, Cmd Msg )
init { time } =
  Model (toFloat time) ! [ Ports.outbound "echo" ]



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Tick time ->
      { model | clock = time } ! []

    Echo str ->
      let
        _ =
          Debug.log "Echo" str
      in
        model ! []



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.batch
    [ Time.every Time.second Tick
    , Ports.inbound Echo
    ]



---- VIEW ----


view : Model -> Html Msg
view { clock } =
  div []
    [ p [] [ text <| toString clock ]
    ]
