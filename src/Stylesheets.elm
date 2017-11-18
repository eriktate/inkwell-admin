port module Stylesheets exposing (..)

import Css exposing (stylesheet, Stylesheet)
import Css.Namespace exposing (namespace)
import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Css.Normalize exposing (css)
import InkUI.Base as Base
import InkUI.Buttons as Buttons
import InkUI.Input as Input
import InkUI.Card as Card
import InkUI.Grid as Grid
import InkUI.Masthead as Masthead
import InkUI.Checkbox as Checkbox
import Pages.Dashboard as Dashboard


port files : CssFileStructure -> Cmd msg


sheet : Stylesheet
sheet =
    (stylesheet << namespace "iw")
        (Base.css
            ++ Buttons.css
            ++ Input.css
            ++ Checkbox.css
            ++ Card.css
            ++ Grid.css
            ++ Masthead.css
            ++ Dashboard.css
        )


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
