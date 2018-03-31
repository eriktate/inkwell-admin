module InkUI.Card exposing (..)

import Html.Styled exposing (..)
import Css exposing (..)
import Css.Foreign exposing (children, everything)
import InkUI.Base exposing (..)
import InkUI.Grid exposing (inkRow, inkCol)


inkCard : List (Attribute msg) -> List (Html msg) -> Html msg
inkCard =
    styled div
        [ backgroundColor ultrawhite
        , borderRadius (px 2)
        , boxShadow4 (px 2) (px 4) (px 5) gray
        , margin (Css.em 1)
        , padding (Css.em 1)
        ]


inkCardTitle : List (Attribute msg) -> List (Html msg) -> Html msg
inkCardTitle =
    styled div
        [ borderBottom3 (px 1) solid black
        , margin4 (Css.em -1) (Css.em -1) (px 0) (Css.em -1)
        , padding (Css.em 1)
        , backgroundColor black
        , color white
        , fontWeight bold
        ]


inkCardBody : List (Attribute msg) -> List (Html msg) -> Html msg
inkCardBody =
    styled inkRow [ marginTop (Css.em 1) ]


inkCardMenuBody : List (Attribute msg) -> List (Html msg) -> List (Html msg) -> Html msg
inkCardMenuBody attrs body menu =
    inkCardBody
        attrs
        [ inkCol 11 [] body
        , inkCol 1 [] menu
        ]


inkCardMenu : List (Attribute msg) -> List (Html msg) -> Html msg
inkCardMenu =
    styled div
        [ margin4 (px 0) (Css.em -1) (Css.em -1) (px 0)
        , backgroundColor dark
        , minWidth (px 48)
        , maxWidth (px 48)
        , right (px 0)
        , height (pct 100)
        , children
            [ everything
                [ display block
                , textAlign center
                , padding (px 8)
                , color white
                , fontSize (pt 18)
                ]
            ]
        ]
