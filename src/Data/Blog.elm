module Data.Blog exposing (Blog)


type alias Blog =
    { id : String
    , title : String
    , blurb : String
    , published : Bool
    }
