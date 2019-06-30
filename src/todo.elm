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
type alias Model = 
  { list : List String,
    text : String
  }

init : Model
init = { list = [], text = "" }


-- Update
type Msg = UpdateText String | AddTodo

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateText newText ->
      { model | text = newText }
    AddTodo ->
      { model | 
        text = "",
        list = model.list ++ [ model.text ]
        -- ++ is a combine 2 list
      }


-- View
view : Model -> Html Msg
view model = 
  div [] [
    input [ onInput UpdateText ] [],
    button [ onClick AddTodo ] [ text "Add" ],
    div [] (
      List.map (\todo -> div [] [
        text todo
      ]) model.list
    )
  ]