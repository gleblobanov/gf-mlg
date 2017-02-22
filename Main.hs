{-# LANGUAGE DeriveDataTypeable #-}

module Main where

import Weather

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
  response <- getResponse
  let o = extractOntology response
  gr <- readPGF "Weather.pgf"
  generateText o gr english summariseDay
  generateText o gr russian summariseDay


generateText :: Ontology ->
                PGF ->
                LanguageName ->
                (Ontology -> GSchema) ->
                IO ()

generateText o gr lang goal = let out = case readLanguage lang of
                                    Just lng -> linearize gr lng (gf (goal o))
                                    Nothing  -> lang ++ " is not found."
                              in putStrLn $ prettify out

prettify :: String -> String
prettify s = s1
  where s1 = replace " ." "." s2
        s2 = replace " ," "," s3
        s3 = replace " :" ":" s4
        s4 = unwords $ map capitalize $ segment s

capitalize :: String -> String
capitalize [] = []
capitalize (x:xs) | isAlpha x = toUpper x : xs
                  | otherwise = x : capitalize xs
