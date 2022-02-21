module FetchDog exposing (defaultCorgi, defaultDalmatian, fetchDog)

import Http
import Json.Decode as Decode exposing (Decoder)


defaultCorgi : String
defaultCorgi =
    "https://images.dog.ceo/breeds/corgi-cardigan/n02113186_6173.jpg"


defaultDalmatian : String
defaultDalmatian =
    "https://images.dog.ceo/breeds/dalmatian/cooper1.jpg"



-- dalmatian
-- corgi/cardigan


fetchDog : String -> (String -> msg) -> Cmd msg
fetchDog breed toMessage =
    Http.get
        { url = "https://dog.ceo/api/breed/" ++ breed ++ "/images/random"
        , expect =
            Http.expectJson
                (\result ->
                    case result of
                        Ok url ->
                            toMessage url

                        Err _ ->
                            toMessage defaultCorgi
                )
                dogDecoder
        }


dogDecoder : Decoder String
dogDecoder =
    Decode.field "message" Decode.string
