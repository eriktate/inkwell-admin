module InkUI.Buttons exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Events exposing (onClick)
import Html.Styled.Attributes exposing (src, title, type_, attribute, class)
import InkUI.Base exposing (..)


inkButton : List (Attribute msg) -> List (Html msg) -> Html msg
inkButton =
    styled button
        [ borderRadius (px 2)
        , borderStyle solid
        , borderWidth (px 1)
        , borderColor gray
        , backgroundColor white
        , color dark
        , padding2 (Css.em 0.5) (Css.em 1)
        , boxShadow4 (px 1) (px 2) (px 3) gray
        , fontFamilies [ "Raleway", "sans-serif" ]
        , fontWeight bold
        , textTransform uppercase
        ]


inkButtonPrimary : List (Attribute msg) -> List (Html msg) -> Html msg
inkButtonPrimary =
    styled inkButton
        [ backgroundColor black
        , borderStyle none
        , color white
        ]


inkButtonCancel : List (Attribute msg) -> List (Html msg) -> Html msg
inkButtonCancel =
    styled inkButton
        [ backgroundColor dark
        , borderStyle none
        , color white
        ]


dataGlyph : String -> Attribute msg
dataGlyph name =
    attribute "data-glyph" name


iconButton : String -> List (Attribute msg) -> List (Html msg) -> Html msg
iconButton icon attrs =
    styled span
        [ width (px 16) ]
        ([ class "oi", (dataGlyph icon) ] ++ attrs)


editButton : List (Attribute msg) -> List (Html msg) -> Html msg
editButton =
    iconButton "pencil"


deleteButton : List (Attribute msg) -> List (Html msg) -> Html msg
deleteButton =
    iconButton "trash"


metricsButton : List (Attribute msg) -> List (Html msg) -> Html msg
metricsButton =
    iconButton "bar-chart"


tagButton : List (Attribute msg) -> List (Html msg) -> Html msg
tagButton =
    iconButton "tags"


publishButton : List (Attribute msg) -> List (Html msg) -> Html msg
publishButton =
    iconButton "account-login"


unpublishButton : List (Attribute msg) -> List (Html msg) -> Html msg
unpublishButton =
    iconButton "account-logout"
