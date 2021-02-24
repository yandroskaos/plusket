module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main : Html msg
main = div []
      [ img [class "center", src "assets/plusket-logo.svg", alt "Plusket Logo"] []  
      , h1 [class "text"] [text "Coming soon"]
      , h5 [class "text"] [text "To a device near you"]
      ]
