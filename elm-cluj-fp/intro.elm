module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


initModel =
    0


type alias Name =
    String


type alias City =
    String


greet : Name -> Name
greet name =
    "Hello, " ++ name


greetings : Name -> City -> String
greetings name city =
    "Hello " ++ name ++ ", from " ++ city


main =
    beginnerProgram { model = initModel, view = view, update = update }


view model =
    div [] [ text (greet "Cluj.fp") ]


update msg model =
    model
