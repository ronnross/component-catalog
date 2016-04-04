module CatalogList where

import Html exposing (..)
import Html.Attributes exposing (..)


thumbnail item =
  div [ class "thumbnail"]
    [ h5 [ class "text-center" ] [ text item.title ]
    , img [ src item.image, alt "image" ] []
    , button [ class "btn btn-primary btn-block"] [ text "More" ]
    ]


catalogList listings =
    let
      thumbnails =
        List.map (\i -> div [ class "col-md-3 col-sm-4 col-xs-12" ] [ thumbnail i ]) listings
    in
      div [ class "row" ] thumbnails
