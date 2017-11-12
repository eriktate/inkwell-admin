module InkUI.Input exposing (..)

import Html exposing (..)
import Css exposing (..)
import Css.Elements as CssEl
import InkUI.Base exposing (..)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = Input


css : List Snippet
css =
    [ Css.class Input
        [ borderStyle none
        , children
            [ CssEl.input
                [ borderStyle solid
                , borderWidth (px 1)
                , borderColor dark
                , backgroundColor ultrawhite
                , boxShadow4 (px 1) (px 2) (px 3) gray
                , width (pct 100)
                , padding (Css.em 0.5)
                , boxSizing borderBox
                ]
            , CssEl.label
                [ fontFamilies [ "Raleway", "sans-serif" ]
                , fontSize (pt 10)
                , fontWeight bold
                , display block
                , textAlign right
                , margin2 (px 0) (Css.em 1)
                ]
            ]
        ]
    ]


inkInput : String -> List (Attribute msg) -> Html msg
inkInput label attrs =
    fieldset [ class [ Input ] ]
        [ Html.label []
            [ Html.text label ]
        , input
            attrs
            []
        ]
