module Data.Blog exposing (Blog)

import Json.Decode as Decode exposing (..)


type alias Blog =
    { id : String
    , title : String
    , post : List Row
    , blurb : String
    , published : Bool
    }


type alias Row =
    { id : String
    , columns : List Column
    }


type alias Column =
    { id : String
    , contents : List Content
    }


type alias Content =
    { id : String
    , element : ContentType
    }


type ContentType
    = Paragraph ParagraphElement
    | Image ImageElement


type alias ParagraphElement =
    { id : String
    , text : String
    }


type alias ImageElement =
    { id : String
    , url : String
    }


contentDecoder : Decoder Content
contentDecoder =
    map2 Content
        (field "id" string)
        typeDecoder


typeDecoder : Decoder ContentType
typeDecoder =
    (field "type" string)
        |> Decode.andThen
            (\str ->
                case str of
                    "paragraph" ->
                        (field "element" value)
                            |> Decode.andThen
                                (\val ->
                                    let
                                        el =
                                            (decodeValue paragraphDecoder val)
                                    in
                                        case el of
                                            Ok par ->
                                                succeed (Paragraph par)

                                            Err err ->
                                                fail <| "Unknown structure: " ++ err
                                )

                    "image" ->
                        (field "element" value)
                            |> Decode.andThen
                                (\val ->
                                    let
                                        el =
                                            (decodeValue imageDecoder val)
                                    in
                                        case el of
                                            Ok img ->
                                                succeed (Image img)

                                            Err err ->
                                                fail <| "Unknown structure: " ++ err
                                )

                    somethingElse ->
                        Decode.fail <| "Unknown theme: " ++ somethingElse
            )


paragraphDecoder : Decoder ParagraphElement
paragraphDecoder =
    map2 ParagraphElement
        (field "id" string)
        (field "text" string)


imageDecoder : Decoder ImageElement
imageDecoder =
    map2 ImageElement
        (field "id" string)
        (field "url" string)
