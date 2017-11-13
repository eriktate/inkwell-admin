port module Stylesheets exposing (..)

import Css exposing (stylesheet, Stylesheet)
import Css.Namespace exposing (namespace)
import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Css.Normalize exposing (css)
import InkUI.Buttons
import InkUI.Base
import InkUI.Input
import InkUI.Card
import InkUI.Grid
import InkUI.Masthead


port files : CssFileStructure -> Cmd msg


sheet : Stylesheet
sheet =
    (stylesheet << namespace "iw") (InkUI.Base.css ++ InkUI.Buttons.css ++ InkUI.Input.css ++ InkUI.Card.css ++ InkUI.Grid.css ++ InkUI.Masthead.css)


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "main.css"
          , Css.File.compile
                [ Css.Normalize.css
                , sheet
                ]
          )
        ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
