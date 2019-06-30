import Browser
import Html exposing (..)
import Html.Events exposing (onClick)

main =
  Browser.sandbox {
    init = 0,
    update = update,
    view = view
  }

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view model = 
  div [] [ 
    button [ onClick Increment ] [ text "+"],
    div [] [ text ( String.fromInt model) ],
    button [ onClick Decrement ] [ text "-" ]
  ]