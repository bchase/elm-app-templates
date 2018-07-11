module Main exposing (..)

import Html
import Types exposing (Model, Msg, Flags)
import App


main : Program Flags Model Msg
main =
  Html.programWithFlags
    { init = App.init
    , update = App.update
    , subscriptions = App.subscriptions
    , view = App.view
    }
