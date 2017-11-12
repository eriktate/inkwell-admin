module InkUI.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (src)


-- CSS things

import Css exposing (..)
import InkUI.Base exposing (..)


-- import Css.Elements as CssEl

import Html.CssHelpers


-- Establish namespace for styles


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace



-- Define classes for component


type CssClasses
    = Button
    | Primary
    | Cancel
    | IconButton



-- Create component CSS snippet


css : List Snippet
css =
    [ Css.class Button
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
    , Css.class Primary
        [ backgroundColor black
        , borderStyle none
        , color white
        ]
    , Css.class Cancel
        [ backgroundColor dark
        , borderStyle none
        , color white
        ]
    , Css.class IconButton
        [ width (px 16) ]
    ]


inkButton : List (Attribute msg) -> List (Html msg) -> Html msg
inkButton attrs inner =
    button (class [ Button ] :: attrs) inner


inkButtonPrimary : List (Attribute msg) -> List (Html msg) -> Html msg
inkButtonPrimary attrs inner =
    inkButton (class [ Primary ] :: attrs) inner


inkButtonCancel : List (Attribute msg) -> List (Html msg) -> Html msg
inkButtonCancel attrs inner =
    inkButton (class [ Cancel ] :: attrs) inner


iconButton : String -> List (Attribute msg) -> List (Html msg) -> Html msg
iconButton icon attrs inner =
    img (class [ IconButton ] :: Html.Attributes.src ("/icons/svg/" ++ icon ++ ".svg") :: attrs) inner


editButton : List (Attribute msg) -> List (Html msg) -> Html msg
editButton attrs inner =
    iconButton "pencil" attrs inner


deleteButton : List (Attribute msg) -> List (Html msg) -> Html msg
deleteButton attrs inner =
    iconButton "trash" attrs inner


metricsButton : List (Attribute msg) -> List (Html msg) -> Html msg
metricsButton attrs inner =
    iconButton "bar-chart" attrs inner


tagButton : List (Attribute msg) -> List (Html msg) -> Html msg
tagButton attrs inner =
    iconButton "tags" attrs inner


publishButton : List (Attribute msg) -> List (Html msg) -> Html msg
publishButton attrs inner =
    iconButton "account-login" attrs inner


unpublishButton : List (Attribute msg) -> List (Html msg) -> Html msg
unpublishButton attrs inner =
    iconButton "account-logout" attrs inner
