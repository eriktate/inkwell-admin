module InkUI.Input exposing (..)

import Html.Styled as Html exposing (..)
import Css exposing (..)
import Html.Styled.Attributes exposing (css)
import InkUI.Base exposing (..)


-- TODO: Consider making these styles into helper functions that return Html msg


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
        [ Html.label [ css [ labelStyle ] ]
            [ Html.text label ]
        , input
            ((css [ inputStyle ]) :: attrs)
            []
        ]


inkTextarea : String -> List (Attribute msg) -> Html msg
inkTextarea label attrs =
    styled fieldset
        [ borderStyle none ]
        []
        [ Html.label [ css [ labelStyle ] ]
            [ Html.text label ]
        , textarea
            ((css [ textareaStyle ]) :: attrs)
            []
        ]
