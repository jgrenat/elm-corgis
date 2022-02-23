module Main exposing (main)

import Browser
import FetchDog exposing (defaultCorgi, defaultDalmatian, fetchDog)
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (alt, src, style)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { dog : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { dog = defaultCorgi
      }
    , Cmd.none
    )


type Msg
    = FetchDog String
    | DogFetched String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchDog breed ->
            ( model, fetchDog breed DogFetched )

        DogFetched url ->
            ( { model | dog = url }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ style "text-align" "center" ]
        [ h1 [] [ text "Des chiens !" ]
        , div []
            [ img [ src model.dog, alt "Cute dog", style "max-width" "800px" ] []
            ]
        , div []
            [ button [ onClick (FetchDog "corgi/cardigan") ] [ text "Voir un Corgi" ]
            , text " "
            , button [ onClick (FetchDog "dalmatian") ] [ text "Voir un Dalmatien" ]
            ]
        ]
