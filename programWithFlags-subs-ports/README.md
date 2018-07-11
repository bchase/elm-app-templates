# Elm &ndash; programWithFlags + subscriptions + ports

* passes `Date.now()` via `Flags`
* subscribes to `Time.every Time.second`, stores result in `Model`, and in `view`
* echoes (`Debug.log`) through `Ports` `outbound` & `inbound`


## Compile & Run

```sh
### make.sh ###

elm make src/Main.elm src/*.elm --output dist/elm.js
```

```
$ ./make.sh
$ open dist/index.html
```


## App Structure

* `src/Types.elm` &ndash; shared types, e.g. `Model`, `Msg(..)`
* `src/App.elm` &ndash; `init`, `update`, `subscriptions`, and `view`
* `src/Main.elm` &ndash; `Main.main : Program Flags Model Msg`
* `src/Ports.elm` &ndash; echo via JS using `outbound` & `inbound`

```javascript
//// index.html ///

var flags = { time : Date.now() }
var node  = document.getElementById('elm')
var app   = Elm.Main.embed(node, flags)

app.ports.outbound.subscribe(function(str){
  app.ports.inbound.send(str)
})
```
