module Views.Masthead exposing (view)

import Html exposing (..)
import Css exposing (..)
import Html.CssHelpers
import InkUI.Base exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


view : Html msg
view =
    div [] []
