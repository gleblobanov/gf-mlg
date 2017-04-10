module Main where

import Weather

import System.Random
import Data.Char
import Data.List
import PGF
import DarkSky
import CommunicativeGoals
import Ontology
import Data.List.Utils
import NLP.FullStop


type LanguageName = String
english = "WeatherEng"
russian = "WeatherRus"




main :: IO ()
main = do
  putStrLn "Write Gothenburg or Osaka:"
  city <- getLine
  (gCity, cityName) <- checkCity city
  responseMaybe <- getResponse gCity
  maybe (putStrLn "Error") (gen cityName) responseMaybe
    where gen cityName response = do let o = extractOntology response cityName
                                     gr <- readPGF "Weather.pgf"
                                     stdGen <- getStdGen
                                     generateText stdGen o gr english summariseDay
                                     generateText stdGen o gr russian summariseDay

checkCity :: String -> IO (String, String)
checkCity city = case city of
        "Gothenburg" -> return (gothenburg, city)
        "gothenburg" -> return (gothenburg, capitalize city)
        "Osaka" -> return (osaka, city)
        "osaka" -> return (osaka, capitalize city)
        _ -> do putStrLn "Try again:"
                city' <- getLine
                checkCity city'


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
prettify = f1 . f2 . f3 . f4 . f5 . f6
  where f1 = replace " %" "%"
        f2 = replace ".." "."
        f3 = replace " ." "."
        f4 = replace " ," ","
        f5 = replace " :" ":"
        f6 = unwords . map capitalize . segment

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) | isAlpha x = toUpper x : xs
                  | otherwise = x : capitalize xs
