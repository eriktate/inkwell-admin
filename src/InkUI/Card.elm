module InkUI.Card exposing (..)

import Html exposing (..)
import Css exposing (..)
import InkUI.Base exposing (..)
import InkUI.Grid exposing (inkRow, inkCol)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = Card
    | Title
    | Body
    | Menu


css : List Snippet
css =
    [ Css.class Card
        [ backgroundColor ultrawhite
        , borderRadius (px 2)
        , boxShadow4 (px 2) (px 4) (px 5) gray
        , margin (Css.em 1)
        , padding (Css.em 1)
        , descendants
            [ Css.class Title
                [ borderBottom3 (px 1) solid dark
                , margin4 (Css.em -1) (Css.em -1) (px 0) (Css.em -1)
                , padding (Css.em 1)
                , backgroundColor dark
                , color white
                , fontWeight bold
                ]
            , Css.class Body
                [ marginTop (Css.em 1) ]
            , Css.class Menu
                [ margin4 (px 0) (Css.em -1) (Css.em -1) (px 0)
                , backgroundColor gray
                , children
                    [ everything
                        [ display block
                        , textAlign center
                        , padding (px 8)
                        , color white
                        ]
                    ]
                ]
            ]
        ]
    ]


inkCard : List (Attribute msg) -> Html msg -> Html msg
inkCard attrs body =
    div (class [ Card ] :: attrs)
        [ body ]


inkCardWithTitle : List (Attribute msg) -> Html msg -> Html msg -> Html msg
inkCardWithTitle attrs title body =
    div (class [ Card ] :: attrs)
        [ title
        , body
        ]


inkCardWithMenu : List (Attribute msg) -> Html msg -> Html msg -> List (Html msg) -> Html msg
inkCardWithMenu attrs title body menu =
    div (class [ Card ] :: attrs)
        [ title
        , inkRow []
            [ inkCol 11 [] [ body ]
            , inkCol 1
                [ class [ Menu ] ]
                menu
            ]
        ]
