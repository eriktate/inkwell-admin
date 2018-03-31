module InkUI.Base exposing (..)

import Css exposing (..)


namespace : String
namespace =
    "iw"


black : Color
black =
    (hex "000000")


dark : Color
dark =
    (hex "3e3e3e")


gray : Color
gray =
    (hex "858383")


light : Color
light =
    (hex "d4d1d1")


white : Color
white =
    (hex "eeeeee")


ultrawhite : Color
ultrawhite =
    (hex "ffffff")


bodyStyle : Style
bodyStyle =
    Css.batch
        [ backgroundColor white
        , color dark
        , fontFamilies [ "Raleway", "sans-serif" ]
        ]
