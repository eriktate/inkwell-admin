module InkUI.Buttons exposing (..)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Events exposing (onClick)
import Html.Styled.Attributes exposing (src, title, type_)
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
    styled inkButton =
        [ backgroundColor dark
        , borderStyle none
        , color white
        ]

dataGlyph : String -> Attribute msg
dataGlyph name =
    Html.Attributes.attribute "data-glyph" name

iconButton : String -> List (Attribute msg) -> List (Html msg) -> Html msg
iconButton icon attrs =
    styled span 
        [ width (px 16) ]
        ([Html.Attributes.class "oi", (dataGlyph icon)] ++ attrs)

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


publishButton : List (Attribute msg) -> List (Html msg) ->  Html msg
publishButton =
    iconButton "account-login"


unpublishButton : List (Attribute msg) -> List (Html msg) -> Html msg
unpublishButton =
    iconButton "account-logout"

-- iconButton : msg -> String -> String -> List (Attribute msg) -> Html msg
-- iconButton msg icon desc attrs =
--     span ([ Html.Attributes.class "oi", (dataGlyph icon), title desc, onClick msg ] ++ attrs) []

-- inkButton : String -> CssClasses -> msg -> Html msg
-- inkButton label btnClass msg =
--     button [ type_ "button", class [ Button, btnClass ], onClick msg ] [ Html.text label ]


-- inkButtonPrimary : String -> msg -> Html msg
-- inkButtonPrimary label msg =
--     inkButton label Primary msg


-- inkButtonCancel : String -> msg -> Html msg
-- inkButtonCancel label msg =
--     inkButton label Cancel msg



-- iconButton : msg -> String -> String -> List (Attribute msg) -> Html msg
-- iconButton msg icon desc attrs =
--     span ([ Html.Attributes.class "oi", (dataGlyph icon), title desc, onClick msg ] ++ attrs) []


