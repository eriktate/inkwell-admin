module Pages.Edit exposing (Msg, Model, view, update, init)

import Html.Styled as Html exposing (..)
import Data.Blog exposing (Blog)


type alias Model =
    { blog : Blog }


type Msg
    = Test


init : ( Model, Cmd Msg )
init =
    ( { blog = dummyBlog }, Cmd.none )


dummyBlog : Blog
dummyBlog =
    { id = "abc"
    , title = "Test 1"
    , post = []
    , blurb = "This is a test blog made for testing purposes"
    , published = False
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Test ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [] [ Html.text "This is a test..." ]
