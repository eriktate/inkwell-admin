module InkUI.Buttons exposing (..)

import Html exposing (..)


-- CSS things

import Css exposing (..)
import InkUI.Base exposing (namespace)


-- import Css.Elements as CssEl

import Html.CssHelpers


-- Establish namespace for styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace



-- Define classes for component


type CssClasses
    = Button
    | Primary



-- Create component CSS snippet


css : List Snippet
css =
    [ Css.class Button
        [ borderRadius (px 3)
        , borderWidth (px 1)
        , borderStyle solid
        , borderColor (hex "edd382")
        , backgroundColor (hex "f2f3ae")
        ]
    , Css.class Primary
        [ backgroundColor (hex "fc9e4f") ]
    ]


inkButton : List (Attribute msg) -> List (Html msg) -> Html msg
inkButton attrs inner =
    button (class [ Button ] :: attrs) inner


inkButtonPrimary : List (Attribute msg) -> List (Html msg) -> Html msg
inkButtonPrimary attrs inner =
    inkButton (class [ Primary ] :: attrs) inner
