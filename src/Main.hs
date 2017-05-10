module Main where

import Weather

import System.Random
import System.Environment
import Data.Char
import Data.List
import PGF
import DarkSky
import GoogleMaps
import CommunicativeGoals
import Ontology
import Data.List.Utils
import NLP.FullStop


type LanguageName = String
english = "WeatherEng"
russian = "WeatherRus"
pathPGF = "Weather.pgf"



main :: IO ()
main = do
  [query] <- getArgs
  mLocation <- geocode query
  case mLocation of
    Nothing -> fail "No location"
    Just (loc, lat, long) -> do
      mResponse <- getResponse $ queryCrnt lat long
      case mResponse of
        Nothing -> fail "Response is Nothing"
        Just resp -> do
          let ts  = maybe (fail "Timestamp isn't determined") DarkSky.time (currently resp)
          case ts of
            Nothing -> fail "Timestamp isn't determined"
            Just ts -> do
              api <- getAverage DarkSky.precipIntensity lat long ts
              at  <- getAverage DarkSky.temperature lat long ts
              adp <- getAverage DarkSky.dewPoint lat long ts
              ah  <- getAverage DarkSky.humidity lat long ts
              mTimeOffset <- getTimeOffset lat long ts
              case mTimeOffset of
                Nothing -> fail "RawOffset isn't determined"
                Just to -> do let o = extractOntology resp loc to api at adp ah
                              gr <- readPGF pathPGF
                              stdGen <- getStdGen
                              generateText stdGen o gr english summariseDay
                              -- generateText stdGen o gr russian summariseDay


generateText :: StdGen ->
                Ontology ->
                PGF ->
                LanguageName ->
                (Ontology -> GSchema) ->
                IO ()

generateText stdGen o gr lang goal =
  let out = case readLanguage lang of
        Just lng -> concatMap (linearize gr lng) $ [head exps]
        -- Just lng -> showExpr [] $ head exps
        Nothing  -> lang ++ " is not found."
      ont  = (ontologyToList . ontologyApplyRules) o
      -- ont  = (ontologyToList . id) o
      exps = generateFromOntology stdGen gr (startCat gr) ont
  in putStrLn $ prettify out

prettify :: String -> String
prettify = f8. f7 .f6 . f5 . f4 . f3 . f2 . f1
  where f8 = replace "( " "("
        f7 = replace " )" ")"
        f6 = replace " %" "%"
        f5 = replace ".." "."
        f4 = replace " ." "."
        f3 = replace " ," ","
        f2 = replace " :" ":"
        f1 = unwords . map capitalize . segment

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) | isAlpha x = toUpper x : xs
                  | otherwise = x : capitalize xs
