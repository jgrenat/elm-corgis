module Main exposing (main)

import Browser
import FetchDog exposing (defaultCorgi)
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
    { breed : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { breed = "corgi"
      }
    , Cmd.none
    )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ style "text-align" "center" ]
        [ h1 [] [ text "Des chiens !" ]
        , div []
            [ img [ src defaultCorgi, alt "Cute dog", style "max-width" "800px" ] []
            ]
        , div []
            [ button [ onClick NoOp ] [ text "Voir un Corgi" ]
            , text " "
            , button [ onClick NoOp ] [ text "Voir un Dalmatien" ]
            ]
        ]
