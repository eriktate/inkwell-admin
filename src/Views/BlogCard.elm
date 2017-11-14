module Views.BlogCard exposing (view, css)

import Html exposing (..)
import Data.Blog exposing (Blog)
import InkUI.Card as Card exposing (inkCardWithMenu)
import InkUI.Grid as Grid
import InkUI.Base exposing (namespace)
import InkUI.Buttons exposing (editButton, deleteButton, tagButton, metricsButton, publishButton, unpublishButton)
import Css exposing (..)
import Html.CssHelpers


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = BlogCard


css : List Snippet
css =
    [ Css.class BlogCard
        [ minWidth (px 320) ]
    ]


view : Blog -> Html msg
view blog =
    inkCardWithMenu [ class [ Grid.Col 1 ], class [ BlogCard ] ]
        (div [ class [ Card.Title ] ]
            [ Html.text blog.title ]
        )
        (div [ class [ Card.Body ] ]
            [ Html.text blog.blurb ]
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
