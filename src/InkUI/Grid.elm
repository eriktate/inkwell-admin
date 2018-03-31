module InkUI.Grid exposing (..)

import Html.Styled exposing (..)
import Css exposing (..)


inkRow : List (Attribute msg) -> List (Html msg) -> Html msg
inkRow =
    styled div
        [ displayFlex
        , flexDirection row
        , flexWrap wrap
        ]


clampSize : Int -> Int
clampSize size =
    if size > 12 then
        12
    else if size < 0 then
        0
    else
        size


inkCol : Int -> List (Attribute msg) -> List (Html msg) -> Html msg
inkCol size =
    let
        col =
            clampSize (size)
    in
        styled div
            [ flex3 (int col) (int col) (int 0) ]
