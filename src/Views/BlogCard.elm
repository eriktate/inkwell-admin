module Views.BlogCard exposing (view)

import Html exposing (..)
import Data.Blog exposing (Blog)
import InkUI.Card as Card exposing (inkCardWithMenu)
import InkUI.Grid as Grid
import InkUI.Base exposing (namespace)
import InkUI.Buttons exposing (editButton, deleteButton, tagButton, metricsButton, publishButton, unpublishButton)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


view : Blog -> Html msg
view blog =
    inkCardWithMenu [ class [ Grid.Col 1 ] ]
        (div [ class [ Card.Title ] ]
            [ text blog.title ]
        )
        (div [ class [ Card.Body ] ]
            [ text blog.blurb ]
        )
        [ editButton []
        , handlePublishButton blog
        , deleteButton []
        , tagButton []
        , metricsButton []
        ]


handlePublishButton : Blog -> Html msg
handlePublishButton blog =
    if blog.published then
        unpublishButton []
    else
        publishButton []
