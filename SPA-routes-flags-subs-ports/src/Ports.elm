port module Ports exposing (outbound, inbound)


port outbound : String -> Cmd msg


port inbound : (String -> msg) -> Sub msg
