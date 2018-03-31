module InkUI.Masthead exposing (..)

import Html.Styled exposing (..)
import Css exposing (..)
import InkUI.Base exposing (..)


inkMasthead : List (Attribute msg) -> List (Html msg) -> Html msg
inkMasthead =
    styled div
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
