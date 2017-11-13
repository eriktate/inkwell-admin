module InkUI.Masthead exposing (..)

import Html exposing (..)
import Css exposing (..)
import Html.CssHelpers
import InkUI.Base exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = Masthead


css : List Snippet
css =
    [ Css.class Masthead
        [ backgroundColor dark
        , width (pct 100)
        , height (px 64)
        , color white
        , boxShadow4 (px 1) (px 0) (px 3) gray
        , fontWeight bold
        , fontSize (pt 24)
        ]
    ]


inkMasthead : List (Attribute msg) -> List (Html msg) -> Html msg
inkMasthead attrs inner =
    div (class [ Masthead ] :: attrs) inner
