module Pages.Dashboard exposing (Msg, Model, view, css, update, init)

import Html exposing (..)
import Html.Events exposing (onClick)
import Data.Blog exposing (Blog)
import InkUI.Card as Card exposing (inkCard, inkCardWithMenu)
import InkUI.Grid as Grid exposing (inkRow)
import InkUI.Base exposing (namespace)
import InkUI.Buttons exposing (editButton, deleteButton, tagButton, metricsButton, publishButton, unpublishButton, iconButton)
import InkUI.Input exposing (inkInput, inkTextarea)
import Css exposing (..)
import Html.CssHelpers


-- BAD THINGS

import Debug exposing (log)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = BlogCard
    | NewCard


css : List Snippet
css =
    [ Css.class BlogCard
        [ minWidth (px 320) ]
    , Css.class NewCard
        [ minWidth (px 320)
        , displayFlex
        , justifyContent center
        , alignItems center
        , cursor pointer
        , fontWeight bold
        ]
    ]


type alias Model =
    { blogs : List Blog
    , newBlog : NewBlog
    , creating : Bool
    }


type alias NewBlog =
    { title : String
    , description : String
    }


type Msg
    = Edit String
    | Publish String
    | Unpublish String
    | Delete String
    | Tag String
    | Meter String
    | New
    | ChangeTitle String
    | ChangeDescription String
    | NoOp


init : ( Model, Cmd Msg )
init =
    ( { blogs = dummyBlogs, newBlog = { title = "", description = "" }, creating = False }, Cmd.none )


dummyBlogs : List Blog
dummyBlogs =
    [ { id = "abc"
      , title = "Test 1"
      , post = []
      , blurb = "This is a test blog made for testing purposes"
      , published = False
      }
    , { id = "def"
      , title = "Test 2"
      , post = []
      , blurb = "Will this test work? Who knows!!!???"
      , published = True
      }
    , { id = "ghi"
      , title = "Test 3"
      , post = []
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

        New ->
            ( { model | creating = True }, Cmd.none )

        ChangeTitle title ->
            let
                newBlog =
                    model.newBlog
            in
                ( { model | newBlog = { newBlog | title = title } }, Cmd.none )

        ChangeDescription desc ->
            let
                newBlog =
                    model.newBlog
            in
                ( { model | newBlog = { newBlog | description = desc } }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


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
    inkRow [] <| (newCard model) :: List.map blogCard model.blogs


newCard : Model -> Html Msg
newCard model =
    inkCard [ class [ Grid.Col 1 ], class [ NewCard ], onClick New ]
        (if model.creating then
            form []
                [ div [] [ Html.text <| "URL: " ++ (toUrl model.newBlog.title) ]
                , inkInput "title" (\title -> ChangeTitle title) []
                , inkTextarea "description" (\desc -> ChangeDescription desc) []
                ]
         else
            span []
                [ iconButton NoOp "plus" "new blog" []
                , Html.text " New Blog"
                ]
        )


toUrl : String -> String
toUrl title =
    String.join "-" <| String.split " " <| String.toLower title


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
        ]


handlePublishButton : Blog -> Html Msg
handlePublishButton blog =
    if blog.published then
        unpublishButton (Unpublish blog.id) []
    else
        publishButton (Publish blog.id) []
