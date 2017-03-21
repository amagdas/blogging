module Main exposing (..)

import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = Increment
    | Decrement


initModel =
    0


main =
    beginnerProgram { model = initModel, view = view, update = update }


view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
