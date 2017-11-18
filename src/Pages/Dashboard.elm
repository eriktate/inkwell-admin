module Pages.Dashboard exposing (Msg, Model, view, update, init)

import Html exposing (Html)
import Data.Blog exposing (Blog)
import InkUI.Buttons exposing (editButton, deleteButton, tagButton, metricsButton, publishButton, unpublishButton)
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (StyleSheet, style)
import Style.Color as Color
import Style.Shadow as Shadow
import Color


-- BAD THINGS

import Debug exposing (log)


type Styles
    = Card
    | CardTitle
    | CardBody
    | CardMenu
    | Dashboard
    | None


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style Card
            [ Color.background Color.white
            , Shadow.box
                { offset = ( 2, 4 )
                , size = 5
                , blur = 1
                , color = Color.charcoal
                }
            ]
        , style CardTitle
            [ Color.text Color.white
            , Color.background Color.black
            ]
        , style CardMenu
            [ Color.background Color.charcoal ]
        ]



-- css : List Snippet
-- css =
--     [ Css.class BlogCard
--         [ minWidth (px 320) ]
--     ]


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
    layout stylesheet <|
        row Dashboard [ padding 16, spacing 16 ] (List.map blogCard model.blogs)


blogCard : Blog -> Element Styles variation msg
blogCard blog =
    column Card
        [ minWidth (px 320), width fill ]
        [ el CardTitle [ padding 8 ] (text blog.title)
        , row None
            []
            [ el CardBody [ width fill ] (text blog.blurb)
            , el CardMenu
                [ width (px 32) ]
                (column None
                    [ spacing 4 ]
                    [ el None [] (text "A")
                    , el None [] (text "B")
                    , el None [] (text "C")
                    , el None [] (text "D")
                    ]
                )
            ]
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
