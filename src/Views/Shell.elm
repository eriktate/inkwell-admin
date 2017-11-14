module Views.Shell exposing (view)

import InkUI.Masthead exposing (inkMasthead)
import Html exposing (..)


view : Html msg -> Html msg
view page =
    div []
        [ inkMasthead []
            [ text "InkWell" ]
        , page
        , div []
            [ text "Put a footer here" ]
        ]
