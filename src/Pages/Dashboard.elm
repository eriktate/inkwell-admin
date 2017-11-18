module Pages.Dashboard exposing (Msg, Model, view, css, update, init)

import Html exposing (..)
import Data.Blog exposing (Blog)
import InkUI.Card as Card exposing (inkCardWithMenu)
import InkUI.Grid as Grid exposing (inkRow)
import InkUI.Base exposing (namespace)
import InkUI.Buttons exposing (editButton, deleteButton, tagButton, metricsButton, publishButton, unpublishButton)
import InkUI.Checkbox exposing (inkCheckbox)
import Css exposing (..)
import Html.CssHelpers


-- BAD THINGS

import Debug exposing (log)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = BlogCard


css : List Snippet
css =
    [ Css.class BlogCard
        [ minWidth (px 320) ]
    ]


type alias Model =
    { blogs : List Blog }


type Msg
    = Edit String
    | Publish String
    | Unpublish String
    | Delete String
    | Tag String
    | Meter String
    | Check
    | Uncheck


init : ( Model, Cmd Msg )
init =
    ( { blogs = dummyBlogs }, Cmd.none )


dummyBlogs : List Blog
dummyBlogs =
    [ { id = "abc"
      , title = "Test 1"
      , blurb = "This is a test blog made for testing purposes"
      , published = False
      }
    , { id = "def"
      , title = "Test 2"
      , blurb = "Will this test work? Who knows!!!???"
      , published = True
      }
    , { id = "ghi"
      , title = "Test 3"
      , blurb = "For real though...are these tests working?"
      , published = True
      }
    ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Edit id ->
            ( model, log "Clicked edit" <| Cmd.none )

        Publish id ->
            ( { model | blogs = List.map (publishBlog id) model.blogs }, Cmd.none )

        Unpublish id ->
            ( { model | blogs = List.map (unpublishBlog id) model.blogs }, Cmd.none )

        Delete id ->
            ( model, log "Clicked delete" <| Cmd.none )

        Tag id ->
            ( model, log "Clicked tag" <| Cmd.none )

        Meter id ->
            ( model, log "Clicked meter" <| Cmd.none )

        Check ->
            ( model, log "Checked box" <| Cmd.none )

        Uncheck ->
            ( model, log "Unchecked box" <| Cmd.none )


publishBlog : String -> Blog -> Blog
publishBlog id blog =
    if id == blog.id then
        { blog | published = True }
    else
        blog


unpublishBlog : String -> Blog -> Blog
unpublishBlog id blog =
    if id == blog.id then
        { blog | published = False }
    else
        blog


view : Model -> Html Msg
view model =
    inkRow [] <| List.map blogCard model.blogs


blogCard : Blog -> Html Msg
blogCard blog =
    inkCardWithMenu [ class [ Grid.Col 1 ], class [ BlogCard ] ]
        (div [ class [ Card.Title ] ]
            [ Html.text blog.title ]
        )
        (div [ class [ Card.Body ] ]
            [ Html.text blog.blurb ]
        )
        [ editButton (Edit blog.id) []
        , handlePublishButton blog
        , deleteButton (Delete blog.id) []
        , tagButton (Tag blog.id) []
        , metricsButton (Meter blog.id) []
        , inkCheckbox handleCheck []
        ]


handleCheck : Bool -> Msg
handleCheck check =
    if check then
        Check
    else
        Uncheck


handlePublishButton : Blog -> Html Msg
handlePublishButton blog =
    if blog.published then
        unpublishButton (Unpublish blog.id) []
    else
        publishButton (Publish blog.id) []
