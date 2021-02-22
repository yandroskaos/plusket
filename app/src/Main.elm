module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main : Html msg
main = div []
      [ img [class "center", src "assets/plusket-logo.svg"] []  
      , h1 [class "text"] [text "Proximamente"]
      ]
