module Main exposing (..)

import Html exposing (..)
import InkUI.Masthead exposing (inkMasthead)
import InkUI.Grid exposing (inkRow, CssClasses)
import InkUI.Base exposing (..)
import Views.BlogCard as BlogCard
import Views.Shell as Shell
import Html.CssHelpers
import Data.Blog exposing (Blog)


{ id, class, classList } =
    Html.CssHelpers.withNamespace namespace


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL --


type alias Model =
    { blogs : List Blog }


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


dummyData : Model
dummyData =
    { blogs = dummyBlogs }


init : ( Model, Cmd Msg )
init =
    ( dummyData, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- UPDATE --


type Msg
    = TogglePublish String
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TogglePublish blog ->
            ( { model | blogs = handlePublish model.blogs blog }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


handlePublish : List Blog -> String -> List Blog
handlePublish blogs blogID =
    List.map
        (\blog ->
            if blog.id == blogID then
                { blog | published = not (blog.published) }
            else
                blog
        )
        blogs



-- VIEW --


view : Model -> Html Msg
view model =
    Shell.view (viewPosts model.blogs)


viewPosts : List Blog -> Html Msg
viewPosts blogs =
    inkRow []
        (List.map
            (\blog -> BlogCard.view blog)
            blogs
        )
