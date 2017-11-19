module Pages.Dashboard exposing (Msg, Model, view, css, update, init)

import Html exposing (..)
import Html.Events exposing (onClick, onSubmit)
import Html.Attributes exposing (value)
import Data.Blog exposing (Blog)
import InkUI.Card as Card exposing (inkCard, inkCardWithMenu)
import InkUI.Grid as Grid exposing (inkRow, inkCol)
import InkUI.Base exposing (namespace)
import InkUI.Buttons exposing (editButton, deleteButton, tagButton, metricsButton, publishButton, unpublishButton, iconButton, inkButtonPrimary, inkButtonCancel)
import InkUI.Input exposing (inkInput, inkTextarea)
import Css exposing (..)
import Html.CssHelpers
import Http


-- BAD THINGS

import Debug exposing (log)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


type CssClasses
    = BlogCard
    | NewCard
    | NewForm
    | FormButton


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
    , Css.class NewForm
        [ margin (Css.em 1)
        , width (pct 100)
        ]
    , Css.class FormButton
        [ displayFlex
        , justifyContent center
        , alignItems center
        ]
    ]


type alias Model =
    { blogs : List Blog
    , newBlog : NewBlog
    }


type alias NewBlog =
    { title : String
    , blurb : String
    , creating : Bool
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
    | ChangeBlurb String
    | CreateBlog
    | CancelCreate
    | NoOp


init : ( Model, Cmd Msg )
init =
    ( { blogs = dummyBlogs, newBlog = { title = "", blurb = "", creating = False } }, Cmd.none )


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
            let
                newBlog =
                    model.newBlog
            in
                ( { model | newBlog = { newBlog | creating = True } }, Cmd.none )

        ChangeTitle title ->
            let
                newBlog =
                    model.newBlog
            in
                ( { model | newBlog = { newBlog | title = title } }, Cmd.none )

        ChangeBlurb desc ->
            let
                newBlog =
                    model.newBlog
            in
                ( { model | newBlog = { newBlog | blurb = desc } }, Cmd.none )

        CreateBlog ->
            ( model, log "Creating blog!" <| Cmd.none )

        CancelCreate ->
            let
                newBlog =
                    model.newBlog
            in
                ( { model | newBlog = { newBlog | creating = False } }, log "Cancelling blog!" <| Cmd.none )

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
    inkRow [] <| (newCard model.newBlog) :: List.map blogCard model.blogs


newCard : NewBlog -> Html Msg
newCard blog =
    (if blog.creating then
        inkCard [ class [ Grid.Col 1 ], class [ NewCard ] ] <|
            form
                [ class [ NewForm ] ]
                [ div [] [ Html.text <| "Blog URL: " ++ (toUri blog.title) ]
                , inkInput "TITLE" (\title -> ChangeTitle title) [ value blog.title ]
                , inkInput "BLURB" (\blurb -> ChangeBlurb blurb) [ value blog.blurb ]
                , inkRow []
                    [ inkCol 1 [ class [ FormButton ] ] [ inkButtonPrimary "Create" CreateBlog ]
                    , inkCol 1 [ class [ FormButton ] ] [ inkButtonCancel "Cancel" CancelCreate ]
                    ]
                ]
     else
        inkCard [ class [ Grid.Col 1 ], class [ NewCard ], onClick New ] <|
            span
                []
                [ iconButton NoOp "plus" "new blog" []
                , Html.text " New Blog"
                ]
    )


toUri : String -> String
toUri title =
    Http.encodeUri <| String.join "-" <| String.split " " <| String.toLower title


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
