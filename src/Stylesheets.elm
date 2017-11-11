port module Stylesheets exposing (..)

import Css exposing (stylesheet, Stylesheet)
import Css.Namespace exposing (namespace)
import Css.File exposing (CssFileStructure, CssCompilerProgram)
import InkUI.Buttons
import InkUI.Base


port files : CssFileStructure -> Cmd msg


sheet : Stylesheet
sheet =
    (stylesheet << namespace "iw") (InkUI.Base.css ++ InkUI.Buttons.css)


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "index.css", Css.File.compile [ sheet ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
