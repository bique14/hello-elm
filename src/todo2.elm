import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

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
type Msg = UpdateText String | AddTodo | RemoveTodo Int

update : Msg -> Model -> Model
update msg model =
  case msg of
      UpdateText newText ->
        { model | text = newText }
  
      AddTodo ->
        { model | 
          text = "",
          list = model.list ++ [ model.text ]
        }

      RemoveTodo index -> 
        let 
          beforeTodo = List.take index model.list
          afterTodo = List.drop (index + 1) model.list
          newTodo = beforeTodo ++ afterTodo
        in 
          { model | list = newTodo }


-- View
view : Model -> Html Msg
view model = 
  div [] [
    input [ onInput UpdateText ] [],
    button [ onClick AddTodo ] [ text "Add" ],
    div [] [ 
      h2 [] [ text "TODO .." ],
      div [] (List.indexedMap viewTodo model.list)
    ]
  ]

-- viewTodo : String -> Int -> Html Msg ใช้ไม่ได้ ? งง
viewTodo : Int -> String -> Html Msg
viewTodo index todo =
  div [
    style "background-color" "red",
    style "padding" "10px",
    style "margin" "10px"
  ] [
    text todo,
    button [ onClick (RemoveTodo index) ] [ text "del" ]
  ]