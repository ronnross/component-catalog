module CatalogList where

import Html exposing (..)
import Html.Attributes exposing (..)

import CatalogItem
import Details exposing (itemDetails)

type alias Model = List CatalogItem.Model

view : Model -> Html
view listings =
  div [ class "row" ]
    <| List.map CatalogItem.view listings
