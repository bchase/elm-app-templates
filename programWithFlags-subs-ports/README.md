# Elm &mdash; programWithFlags + subscriptions + ports

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

* `src/Types.elm` &mdash; shared types, e.g. `Model`, `Msg(..)`
* `src/App.elm` &mdash; `init`, `update`, `subscriptions`, and `view`
* `src/Main.elm` &mdash; `Main.main : Program Flags Model Msg`
* `src/Ports.elm` &mdash; echo via JS using `outbound` & `inbound`

```javascript
//// index.html ///

var flags = { time : Date.now() }
var node  = document.getElementById('elm')
var app   = Elm.Main.embed(node, flags)

app.ports.outbound.subscribe(function(str){
  app.ports.inbound.send(str)
})
```
