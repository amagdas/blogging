module Main exposing (..)

import Html exposing (text)


name =
    "Carl Sagan"


age =
    60


salary =
    2000.2


double n =
    n * 2


over9000 powerLevel =
    if powerLevel > 9000 then
        "It's over 9000!!!"
    else
        "meh"


numbers =
    [ 1, 4, 3, 2 ]


listOfNames =
    [ "Alice", "Bob", "Chuck" ]


tuple =
    --hold a fixed number of values, and each value can have any type
    ( True, "Elm is fun" )


point =
    --A record is a set of key-value pairs
    --List.map .x [point, point, point]
    -- { point | y = 5 }
    { x = 3, y = 4 }


toFullName person =
    person.firstName ++ " " ++ person.lastName


fullName =
    -- mismatch
    toFullName { firstName = "Hermann", lastName = "Hesse" }


type alias Person =
    -- Person "Obi Wan" "Kenobi"
    { firstName : String, lastName : String }



-- Union type example


type Visibility
    = All
    | Active
    | Completed


type alias Task =
    { task : String, complete : Bool }


buy : Task
buy =
    { task = "Buy milk", complete = True }


drink : Task
drink =
    { task = "Drink milk", complete = False }


tasks : List Task
tasks =
    [ buy, drink ]


keep : Visibility -> List Task -> List Task
keep visibility tasks =
    case visibility of
        All ->
            tasks

        Active ->
            List.filter (\task -> not task.complete) tasks

        Completed ->
            List.filter (\task -> task.complete) tasks


main =
    text (name ++ over9000 point.x)
