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
        [ backgroundColor black
        , width (pct 100)
        , height (px 64)
        , color white
        , boxShadow4 (px 0) (px 2) (px 3) gray
        , fontWeight bold
        , fontSize (pt 24)
        , displayFlex
        , flexDirection column
        , justifyContent center
        , padding2 (px 0) (Css.em 1)
        ]
    ]


inkMasthead : List (Attribute msg) -> List (Html msg) -> Html msg
inkMasthead attrs inner =
    div (class [ Masthead ] :: attrs) inner
