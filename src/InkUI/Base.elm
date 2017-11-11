module InkUI.Base exposing (css, namespace)

import Css exposing (..)
import Css.Elements exposing (..)


namespace : String
namespace =
    "iw"


css : List Snippet
css =
    [ body
        [ backgroundColor (hex "f2f3ae")
        , color (hex "020122")
        , fontFamilies [ "Raleway", "sans-serif" ]
        ]
    ]
