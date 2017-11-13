module InkUI.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (src, title)


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


dataGlyph : String -> Attribute msg
dataGlyph name =
    Html.Attributes.attribute "data-glyph" name


iconButton : String -> String -> List (Attribute msg) -> Html msg
iconButton icon desc attrs =
    span ([ Html.Attributes.class "oi", (dataGlyph icon), title desc ] ++ attrs) []


editButton : List (Attribute msg) -> Html msg
editButton attrs =
    iconButton "pencil" "edit" attrs


deleteButton : List (Attribute msg) -> Html msg
deleteButton attrs =
    iconButton "trash" "delete" attrs


metricsButton : List (Attribute msg) -> Html msg
metricsButton attrs =
    iconButton "bar-chart" "analytics" attrs


tagButton : List (Attribute msg) -> Html msg
tagButton attrs =
    iconButton "tags" " tags" attrs


publishButton : List (Attribute msg) -> Html msg
publishButton attrs =
    iconButton "account-login" "publish" attrs


unpublishButton : List (Attribute msg) -> Html msg
unpublishButton attrs =
    iconButton "account-logout" "unpublish" attrs
