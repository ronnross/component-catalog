module CatalogItem where

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  { id: Int
  , title: String
  , image: String
  }


thumbnail : Model -> Html
thumbnail model =
  div [ class "thumbnail"]
    [ h5 [ class "text-center" ] [ text model.title ]
    , img [ src model.image, alt "image" ] []
    , button [ class "btn btn-primary btn-block"] [ text "More" ]
    ]


view : Model -> Html
view model =
  div [ class "col-md-3 col-sm-4 col-xs-12" ] [ thumbnail model ]
