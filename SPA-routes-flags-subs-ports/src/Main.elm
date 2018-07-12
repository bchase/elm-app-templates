module Main exposing (..)

import Navigation
import Types exposing (Model, Msg(LocationChange), Flags)
import App


main : Program Flags Model Msg
main =
  Navigation.programWithFlags LocationChange
    { init = App.init
    , update = App.update
    , subscriptions = App.subscriptions
    , view = App.view
    }
