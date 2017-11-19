module InkUI.Buttons exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src, title, type_)


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


inkButton : String -> CssClasses -> msg -> Html msg
inkButton label btnClass msg =
    button [ type_ "button", class [ Button, btnClass ], onClick msg ] [ Html.text label ]


inkButtonPrimary : String -> msg -> Html msg
inkButtonPrimary label msg =
    inkButton label Primary msg


inkButtonCancel : String -> msg -> Html msg
inkButtonCancel label msg =
    inkButton label Cancel msg


dataGlyph : String -> Attribute msg
dataGlyph name =
    Html.Attributes.attribute "data-glyph" name


iconButton : msg -> String -> String -> List (Attribute msg) -> Html msg
iconButton msg icon desc attrs =
    span ([ Html.Attributes.class "oi", (dataGlyph icon), title desc, onClick msg ] ++ attrs) []


editButton : msg -> List (Attribute msg) -> Html msg
editButton msg attrs =
    iconButton msg "pencil" "edit" attrs


deleteButton : msg -> List (Attribute msg) -> Html msg
deleteButton msg attrs =
    iconButton msg "trash" "delete" attrs


metricsButton : msg -> List (Attribute msg) -> Html msg
metricsButton msg attrs =
    iconButton msg "bar-chart" "analytics" attrs


tagButton : msg -> List (Attribute msg) -> Html msg
tagButton msg attrs =
    iconButton msg "tags" " tags" attrs


publishButton : msg -> List (Attribute msg) -> Html msg
publishButton msg attrs =
    iconButton msg "account-login" "publish" attrs


unpublishButton : msg -> List (Attribute msg) -> Html msg
unpublishButton msg attrs =
    iconButton msg "account-logout" "unpublish" attrs
