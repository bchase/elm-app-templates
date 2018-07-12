# Elm SPA &ndash; routes + flags + subscriptions + ports

* passes `Date.now()` via `Flags`
* subscribes to `Time.every Time.second` and stores result in `Model`
* echoes (`Debug.log`) through `Ports` `outbound` & `inbound`
* provides buttons in `view` to switch between two routes


## Compile & Run

> Server requires Ruby & Sinatra.

```
$ ./make.sh
$ ./server/start 1337
$ open http://localhost:1337
```

```sh
### make.sh ###

elm make src/Main.elm src/*.elm --output dist/elm.js
```


## App Structure

* `src/Types.elm` &ndash; shared types, e.g. `Model`, `Msg(..)`
* `src/App.elm` &ndash; `init`, `update`, `subscriptions`, and `view`
* `src/Main.elm` &ndash; `Main.main : Program Flags Model Msg`
* `src/Ports.elm` &ndash; echo via JS using `outbound` & `inbound`
* `src/Routing.elm` &ndash; `Route(..)`, `parse : Navigation.Location -> Route`

```javascript
//// index.html ///

var flags = { time : Date.now() }
var node  = document.getElementById('elm')
var app   = Elm.Main.embed(node, flags)

app.ports.outbound.subscribe(function(str){
  app.ports.inbound.send(str)
})
```
