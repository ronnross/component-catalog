module CatalogList where

import Html exposing (..)
import Html.Attributes exposing (..)


caption title =
  div [ class "caption" ]
    [ h5 [ class "text-center" ] [ text title ]
    , button [ class "btn btn-primary btn-block"] [ text "More" ]
    ]

thumbnail item =
  div [ class "thumbnail"]
    [ img [ src item.image, alt "image" ] []
    , caption item.title
    ]

catalogList listings =
    let
      thumbnails =
        List.map (\i -> div [ class "col-md-3 col-sm-4 col-xs-12" ] [ thumbnail i ]) listings
    in
      div [ class "row" ] thumbnails
