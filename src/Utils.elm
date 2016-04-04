module Utils where

import Html.Attributes exposing (..)
import VirtualDom as VirtualDom
import Json.Encode exposing (string)

stylesheetLink url =
  VirtualDom.node
      "link"
      [ property "rel" (string "stylesheet")
      , property "type" (string "text/css")
      , property "href" (string url)
      ]
      []
