import Html exposing (..)
import Html.Attributes exposing (..)
import StartApp.Simple as StartApp

import Utils exposing (stylesheetLink)
import CatalogList exposing (catalogList)
import Details exposing (itemDetails)

--model

type alias CatalogItems =
  { id: Int
  , title: String
  , image: String
  }


type alias Model =
  { catalogList: List CatalogItems
  }


initialModel =
  { catalogList =
      [ { id = 1, title = "Some component Title", image = "manuk.jpg"}
      , { id = 2, title = "Component Title", image = "manuk.jpg"}
      , { id = 3, title = "Another Title", image = "manuk.jpg"}
      , { id = 4, title = "More titles", image = "manuk.jpg"}
      , { id = 5, title = "Once again a title", image = "manuk.jpg"}
      , { id = 6, title = "Hi ", image = "manuk.jpg"}
      ]
  }


--update
type Action = Details Int


update action model =
  case action of
    Details id ->
      model


view address model =
  div [ class " catalog container" ]
    [ stylesheetLink "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    , stylesheetLink "main.css"
    , h1 [] [ text "Catalog"]
    , catalogList model.catalogList
    , itemDetails
    ]


main =
  StartApp.start
    { model = initialModel
    , update = update
    , view = view
    }
