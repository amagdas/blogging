# Pragmatic web functional programming using Elm

## Why Elm
Excerpt from: http://www.elmbark.com/2016/03/16/mainstream-elm-user-focused-design
> If functional programming is so great, why is it still niche? We have a product that can practically eliminate runtime errors,
> make refactoring much eass is for Elm to be extraordinarily easy to learn and use productively.

Pragmatic functional programming language for the Web, easy to learn and light on the syntax.
Simple APP design, higher level concepts hidden behind simple constructs(Monads!)
Main features:
- Simple
- Strong static typing
- Type inference
- Great error messages
- Enforced semantic versioning for packages

## Short introduction to Elm language
- lists
- tuples
- records
- types
- type aliases
- functions
- curry
- pipe
- debuger
- Tasks
- type signature
- warn
- ports
- subscriptions

## TEA:
```
import Html exposing (..)


-- MODEL

type alias Model = { ... }


-- UPDATE

type Msg = Reset | ...

update : Msg -> Model -> Model
update msg model =
  case msg of
    Reset -> ...
    ...


-- VIEW

view : Model -> Html Msg
view model =
  ...
```


## Let's sum it up
