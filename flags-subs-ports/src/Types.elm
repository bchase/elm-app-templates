module Types exposing (Msg(..), Model, Flags)

import Time exposing (Time)


type Msg
  = Tick Time
  | Echo String


type alias Model =
  { clock : Time
  }


type alias Flags =
  { time : Int
  }
