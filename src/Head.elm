module Head where

import Html exposing (..)
import Html.Attributes exposing (..)

heading =
  div [ class "row" ]
    [ div [ class "col-md-3 col-lg-3" ]
        [h1 [] [ text "Catalog"]]
    , div [ class "col-md-9 col-lg-9" ]
        [input [ type' "text", class "form-control col-md-8 col-lg-4", placeholder "Search" ] []]
    ]
