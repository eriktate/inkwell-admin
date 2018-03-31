module InkUI.Input exposing (..)

import Html exposing (..)
import Html.Events exposing (onInput)
import Css exposing (..)
import Css.Elements as CssEl
import InkUI.Base exposing (..)


labelStyle : Style
labelStyle =
    Css.batch
        [ fontFamilies [ "Raleway", "sans-serif" ]
        , fontSize (pt 10)
        , fontWeight bold
        , display block
        , textAlign right
        , margin2 (px 0) (Css.em 1)
        ]


textareaStyle : Style
textareaStyle =
    Css.batch
        [ borderStyle solid
        , borderWidth (px 1)
        , borderColor dark
        , backgroundColor ultrawhite
        , boxShadow4 (px 1) (px 2) (px 3) gray
        , width (pct 100)
        , resize vertical
        , padding (Css.em 0.5)
        , boxSizing borderBox
        ]


inputStyle : Style
inputStyle =
    Css.batch
        [ borderStyle solid
        , borderWidth (px 1)
        , borderColor dark
        , backgroundColor ultrawhite
        , boxShadow4 (px 1) (px 2) (px 3) gray
        , width (pct 100)
        , padding (Css.em 0.5)
        , boxSizing borderBox
        ]


inkInput : String -> List (Attribute msg) -> Html msg
inkInput label attrs =
    styled fieldset
        [ borderStyle none ]
        []
        [ Html.label [ css labelStyle ]
            [ Html.text label ]
        , input
            ((css inputStyle) :: attrs)
            []
        ]
inkInput : String -> List (Attribute msg) -> Html msg
inkInput label attrs =
    styled fieldset
        [ borderStyle none ]
        []
        [ Html.label [ css labelStyle ]
            [ Html.text label ]
        , textarea
            ((css textareaStyle) :: attrs)
            []
        ]
