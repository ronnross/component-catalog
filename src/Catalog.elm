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
      [ { id = 1, title = "Some component Title", image = "images/ddl.png"}
      , { id = 2, title = "Component Title", image = "images/ddl.png"}
      , { id = 3, title = "Another Title", image = "images/inputs.png"}
      , { id = 4, title = "More titles", image = "images/ddl.png"}
      , { id = 5, title = "Once again a title", image = "images/icons.png"}
      , { id = 6, title = "Hi ", image = "images/ddl.png"}
      ]
  }


--update
type Action = Details Int


update action model =
  case action of
    Details id ->
      model

header =
  div [ class "row" ]
    [ div [ class "col-md-3 col-lg-3" ]
        [h1 [] [ text "Catalog"]]
    , div [ class "col-md-9 col-lg-9" ]
        [input [ type' "text", class "form-control col-md-8 col-lg-4", placeholder "Search" ] []]
    ]

view address model =
  div [ class " catalog container" ]
    [ stylesheetLink "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    , stylesheetLink "styles/main.css"
    , header
    , catalogList model.catalogList
    , itemDetails
    ]


main =
  StartApp.start
    { model = initialModel
    , update = update
    , view = view
    }
