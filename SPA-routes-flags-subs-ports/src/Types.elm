module Types exposing (Msg(..), Model, Flags)

import Time exposing (Time)
import Navigation as Nav
import Routing exposing (Route)


type Msg
  = Tick Time
  | Echo String
  | NavigateTo Route
  | LocationChange Nav.Location


type alias Model =
  { location : Nav.Location
  , route : Route
  , clock : Time
  }


type alias Flags =
  { time : Int
  }
