module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import InkUI.Buttons exposing (inkButton, inkButtonPrimary)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL --


type alias Blog =
    { id : String
    , title : String
    , blurb : String
    , published : Bool
    }


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
    div [ class "masthead" ]
        [ text "This is the top bar"
        , viewPosts model.blogs
        ]


viewPosts : List Blog -> Html Msg
viewPosts blogs =
    div []
        (List.map
            (\blog -> viewPost blog)
            blogs
        )


viewPost : Blog -> Html Msg
viewPost blog =
    div [ class "post-container" ]
        [ div [ class "post-title" ]
            [ text blog.title
            , inkButtonPrimary [ class (publishedClass blog), onClick (TogglePublish blog.id) ]
                [ text (eitherOr blog.published "Unpublish" "Publish") ]
            ]
        , div [ class "post-blurb" ]
            [ text blog.blurb ]
        ]


publishedClass : Blog -> String
publishedClass blog =
    eitherOr blog.published "post-published" "post-unpublished"


eitherOr : Bool -> String -> String -> String
eitherOr condition opt1 opt2 =
    if condition then
        opt1
    else
        opt2
