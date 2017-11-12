module InkUI.Card exposing (..)

import Html exposing (..)
import Css exposing (..)
import InkUI.Base exposing (..)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = Card


css : List Snippet
css =
    [ Css.class Card
        [ backgroundColor ultrawhite
        , borderRadius (px 2)
        , boxShadow4 (px 2) (px 4) (px 5) gray
        , margin (Css.em 1)
        , padding (Css.em 1)
        ]
    ]


inkCard : List (Attribute msg) -> List (Html msg) -> Html msg
inkCard attrs inner =
    div (class [ Card ] :: attrs) inner
