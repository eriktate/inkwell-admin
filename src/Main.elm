module Main exposing (..)

import Html exposing (..)
import InkUI.Base exposing (..)
import Views.Shell as Shell
import Pages.Dashboard as Dashboard
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


type Page
    = Dashboard Dashboard.Model


type PageState
    = Loaded Page
    | TransitioningFrom Page



-- MODEL --


type alias Model =
    { pageState : PageState }


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


init : ( Model, Cmd Msg )
init =
    let
        ( model, _ ) =
            (Dashboard.init)
    in
        ( { pageState = Loaded (Dashboard model) }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- UPDATE --


type Msg
    = DashboardMsg Dashboard.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updatePage (getPage model.pageState) msg model


updatePage : Page -> Msg -> Model -> ( Model, Cmd Msg )
updatePage page msg model =
    let
        runPage mainModel mainMsg pageUpdate pageMsg pageModel =
            let
                ( newModel, newCmd ) =
                    pageUpdate pageMsg pageModel
            in
                ( { model | pageState = Loaded (mainModel newModel) }, Cmd.map mainMsg newCmd )
    in
        case ( msg, page ) of
            ( DashboardMsg subMsg, Dashboard subModel ) ->
                runPage Dashboard DashboardMsg Dashboard.update subMsg subModel


getPage : PageState -> Page
getPage pageState =
    case pageState of
        Loaded page ->
            page

        TransitioningFrom page ->
            page



-- VIEW --


view : Model -> Html Msg
view model =
    case model.pageState of
        Loaded page ->
            viewPage False page

        TransitioningFrom page ->
            viewPage True page


viewPage : Bool -> Page -> Html Msg
viewPage isLoading page =
    Shell.view
        (if isLoading then
            div [] [ text "Loading..." ]
         else
            case page of
                Dashboard subModel ->
                    Html.map DashboardMsg
                        (Dashboard.view subModel)
        )
