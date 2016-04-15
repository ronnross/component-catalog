module Details where

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown


itemDetails : Int -> Html
itemDetails _ =
  div [ class "row details" ]
    [ div [ class "col-md-4 col-sm-4" ]
        [ img [ src "images/ddl.png", alt "image" ] []
        ]
    , div [ class "col-md-8 col-sm-8" ]
        [ Markdown.toHtml markdown ]
    ]


markdown : String
markdown = """

# This is a Component's readme

[Link to more details](http://daringfireball.net/projects/markdown/) about component.

  * Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  * Lorem ipsum **dolor** sit amet, consectetur adipiscing elit.
  * Lorem ipsum *dolor* sit amet, consectetur adipiscing elit.
  * Lorem ipsum dolor sit amet, `consectetur adipiscing elit`.
  * ...

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mauris massa, placerat ac ultrices in, facilisis nec ex. Etiam dignissim ex ac nulla auctor porttitor. Nulla lobortis mi id viverra mattis. Suspendisse pellentesque egestas lectus vitae pharetra. Vivamus quis augue a sem dapibus bibendum lacinia in augue. Donec ornare ipsum et ligula fringilla, sed egestas nisl gravida. Pellentesque vehicula metus varius augue volutpat, interdum ornare massa dictum. Nullam tincidunt lacus in bibendum aliquam. Aenean non tincidunt massa, id condimentum nibh. Aliquam ut urna tincidunt, lobortis augue a, mollis velit. Morbi iaculis dui vel purus lobortis egestas nec ac mi. Nunc blandit ultrices felis, eu tincidunt sem eleifend at. Praesent in luctus odio, sit amet eleifend leo.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mauris massa, placerat ac ultrices in, facilisis nec ex. Etiam dignissim ex ac nulla auctor porttitor. Nulla lobortis mi id viverra mattis. Suspendisse pellentesque egestas lectus vitae pharetra. Vivamus quis augue a sem dapibus bibendum lacinia in augue. Donec ornare ipsum et ligula fringilla, sed egestas nisl gravida. Pellentesque vehicula metus varius augue volutpat, interdum ornare massa dictum. Nullam tincidunt lacus in bibendum aliquam. Aenean non tincidunt massa, id condimentum nibh. Aliquam ut urna tincidunt, lobortis augue a, mollis velit. Morbi iaculis dui vel purus lobortis egestas nec ac mi. Nunc blandit ultrices felis, eu tincidunt sem eleifend at. Praesent in luctus odio, sit amet eleifend leo.
"""
