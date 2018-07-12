module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Time
import Navigation as Nav
import Types exposing (Flags, Model, Msg(..))
import Routing exposing (Route(..))
import Ports


---- INIT ----


init : Flags -> Nav.Location -> ( Model, Cmd Msg )
init { time } loc =
  let
    model =
      { location = loc
      , route = Routing.parse loc
      , clock = toFloat time
      }
  in
    model ! [ Ports.outbound "echo" ]



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

    NavigateTo route ->
      model ! [ Nav.newUrl <| Routing.path route ]

    LocationChange loc ->
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
    , p [] [ button [ onClick <| NavigateTo Home ] [ text "Home" ] ]
    , p [] [ button [ onClick <| NavigateTo <| Foo 123 ] [ text "Foo#123" ] ]
    ]
