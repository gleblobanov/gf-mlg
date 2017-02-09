module Main where

import Weather

import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Data.ByteString.Lazy.UTF8 as UTF8
import Text.JSON as JSON

import PGF

languageName = "WeatherEng"
outputFileName = "gf-mlg_output.txt"


t = GUtt2Text (GMsgCityTemp GGothenburg_PN (GTemperatureStr (GString "34")))


main :: IO ()
main = do
  req <- parseRequest "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/57.6962901,11.978816"
  mgr <- getGlobalManager
  resp <- httpLbs req mgr
  case JSON.decode (UTF8.toString (responseBody resp)) of
     Ok json -> writeFile "test" (show (json :: JSValue))
     Error msg -> putStrLn msg
  -- gr <- readPGF "Weather.pgf"
  -- let out = case readLanguage languageName of
        -- Just lng -> linearize gr lng (gf t)
        -- Nothing  -> languageName ++ " is not found."
  -- writeFile outputFileName out
