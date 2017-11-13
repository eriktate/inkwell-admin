module InkUI.Grid exposing (..)

import Html exposing (..)
import Css exposing (..)
import InkUI.Base exposing (..)
import Html.CssHelpers
import List exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = Row
    | Col Int


css : List Snippet
css =
    [ Css.class Row
        [ displayFlex
        , flexDirection row
        ]
    ]
        ++ (List.map toColumn (range 1 12))


toColumn : Int -> Snippet
toColumn col =
    Css.class (Col col)
        [ flexGrow (num (toFloat col))
        , flexWrap wrap
        ]


inkRow : List (Attribute msg) -> List (Html msg) -> Html msg
inkRow attrs inner =
    div (class [ Row ] :: attrs) inner


inkCol : Int -> List (Attribute msg) -> List (Html msg) -> Html msg
inkCol grow attrs inner =
    div (class [ Col grow ] :: attrs) inner
