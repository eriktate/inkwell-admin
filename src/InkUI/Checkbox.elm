module InkUI.Checkbox exposing (..)

import Html exposing (..)
import Html.Events exposing (onCheck)
import Html.Attributes exposing (type_)
import Css exposing (..)
import InkUI.Base exposing (..)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = Checkbox


css : List Snippet
css =
    [ Css.class Checkbox
        [ borderStyle solid
        , backgroundColor white
        , borderWidth (px 1)
        , borderColor black
        , width (pct 100)
        ]
    ]


inkCheckbox : (Bool -> msg) -> List (Attribute msg) -> Html msg
inkCheckbox handler attrs =
    input ([ onCheck handler, class [ Checkbox ], type_ "checkbox" ] ++ attrs) []
