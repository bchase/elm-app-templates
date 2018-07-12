module Routing exposing (Route(..), parse, path)

import Maybe as M
import UrlParser exposing (Parser, (</>), s, int, string)
import UrlParser as Path
import Navigation as Nav


type Route
  = Home
  | Foo Int
  | Bar String
  | FooBar Int String
  | NotFound


parse : Nav.Location -> Route
parse =
  M.withDefault NotFound << Path.parsePath routes


routes : Parser (Route -> a) a
routes =
  let
    ( r, root ) =
      ( Path.map, Path.top )
  in
    Path.oneOf
      [ r Home root
      , r Foo (s "foo" </> int)
      , r Bar (s "bar" </> string)
      , r FooBar (s "foo" </> int </> s "bar" </> string)
      ]


path : Route -> String
path route =
  case route of
    Home ->
      "/"

    Foo i ->
      "/foo/" ++ toString i

    Bar str ->
      "/bar/" ++ str

    FooBar i str ->
      "/foo/" ++ toString i ++ "/bar/" ++ str

    NotFound ->
      "/404"
