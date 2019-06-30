import Browser
import Html exposing (..)
import Html.Events exposing (..)

main = 
  Browser.sandbox {
    init = init,
    update = update,
    view = view
  }


-- Model
type alias Model = { text : String }

init : Model
init = { text = "" }


-- Update
type Msg = UpdateText String

update : Msg -> Model -> Model
update msg model = 
  case msg of
    UpdateText newText ->
      { model | text = newText }


-- View
view : Model -> Html Msg
view model = 
  div [] [
    input [ onInput UpdateText ] [],
    div [] [
      span [] [ text "Hello, "],
      span [] [ text model.text ]
    ]
  ]