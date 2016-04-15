module Catalog where

import CatalogList
import Debug exposing (log)
import Details exposing (itemDetails)
import Effects exposing (Effects, Never)
import Head exposing (heading)
import Hop
import Hop.Matchers exposing (int, str, match1, match2)
import Hop.Navigate exposing (navigateTo)
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router, newLocation)
import Html exposing (..)
import Html.Attributes exposing (..)
import StartApp exposing (App)
import Utils exposing (stylesheetLink)

-- ROUTES

type Route
  = HomeRoute
  | ItemDetailsRoute Int
  | NotFoundRoute


matchers : List (PathMatcher Route)
matchers =
  [ match1 HomeRoute ""
  , match2 ItemDetailsRoute "/item/" int
  ]


routerConfig : Config Route
routerConfig =
  { hash = True
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute
  }


router : Router Route
router =
  Hop.new routerConfig

--model

type alias Model =
  { catalogList: CatalogList.Model
  , location: Location
  , route: Route
  }


initialModel : Model
initialModel =
  { catalogList =
      [ { id = 1, title = "Some component Title", image = "images/ddl.png"}
      , { id = 2, title = "Component Title", image = "images/ddl.png"}
      , { id = 3, title = "Another Title", image = "images/inputs.png"}
      , { id = 4, title = "More titles", image = "images/ddl.png"}
      , { id = 5, title = "Once again a title", image = "images/icons.png"}
      , { id = 6, title = "Hi ", image = "images/ddl.png"}
      ]
  , location = newLocation
  , route = HomeRoute
  }


--update
type Action
  = Details Int
  | HopAction ()
  | ApplyRoute ( Route, Location )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    ApplyRoute ( route, location ) ->
      ( { model
          | route = route
          , location = location }
      , Effects.none
      )
    Details id ->
      ( model, Effects.none )
    HopAction () ->
      ( model, Effects.none )


view : Signal.Address Action -> Model -> Html
view address model =
  case model.route of
    HomeRoute ->
      homeView address model

    ItemDetailsRoute id ->
      --itemDetailsView address model id
      itemDetails id

    NotFoundRoute ->
      homeView address model


homeView : Signal.Address Action -> Model -> Html
homeView address model =
  div [ class "catalog container" ]
    [ stylesheetLink "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
    , stylesheetLink "styles/main.css"
    , nav
    , Head.heading
    , CatalogList.view model.catalogList
    ]


nav : Html
nav =
  ul []
    [ li []
        [ a [ href "#/" ] [ text "Home" ] ]
    , li []
        [ a [ href "#/item/1" ] [ text "Item" ] ]
    , li []
        [ a [ href "#/whatever" ] [ text "Junk" ] ]
    ]

app : App Model
app =
  StartApp.start
    { init = ( initialModel, Effects.none )
    , update = update
    , view = view
    , inputs = [ taggedRouterSignal ]
    }


main : Signal Html
main =
  app.html


taggedRouterSignal : Signal Action
taggedRouterSignal =
  Signal.map ApplyRoute router.signal
