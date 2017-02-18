{-# LANGUAGE DeriveDataTypeable #-}

module Main where

import Weather

import PGF
import DarkSky
import CommunicativeGoals
import Ontology


type Language = String
english = "WeatherEng"
russian = "WeatherRus"




main :: IO ()
main = do
  response <- getResponse
  let o = extractOntology response
  gr <- readPGF "Weather.pgf"
  generateText o gr summariseDay english
  generateText o gr summariseDay russian


generateText :: Ontology ->
                PGF ->
                Language ->
                (Ontology -> GSchema) ->
                IO ()

generateText o gr lang goal = let out = case readLanguage lang of
                         Just lng -> linearize gr lng (gf (goal o))
                         Nothing  -> lang ++ " is not found."
                   in putStrLn out

