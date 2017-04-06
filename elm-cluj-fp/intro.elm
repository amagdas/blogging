module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


initModel =
    0


main =
    beginnerProgram { model = initModel, view = view, update = update }


view model =
    div [] [ text "Cluj.js" ]


update msg model =
    model
