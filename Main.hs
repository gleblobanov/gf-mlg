{-# LANGUAGE DeriveDataTypeable #-}

module Main where

import Weather

import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Data.ByteString.Lazy.UTF8 as UTF8
import Text.JSON as JSON
import Text.JSON.Generic
import PGF
import qualified DarkSky as DS
import Numeric

languageName = "WeatherEng"


data Ontology = Ontology {
                latitude :: GLatitude,
                longitude :: GLongitude,
                city :: GCity,
                time :: GTime,
                timezone :: GTimezone,
                precipIntensity :: GPrecipIntensity,
                precipProbability :: GPrecipProbability,
                temperature :: GTemperature,
                apparentTemperature :: GApparentTemperature,
                dewPoint :: GDewPoint,
                humidity :: GHumidiy,
                windSpeed :: GWindSpeed,
                windBearing :: GWindBearing,
                cloudCover :: GCloudCover,
                pressure :: GPressure,
                ozone :: GOzone }


extractOntology :: DS.Response -> Ontology
extractOntology r = Ontology {
  latitude = GLatitudeVal $ GFloat $ DS.latitude r,
  longitude = GLongitudeVal $ GFloat $ DS.longitude r,
  timezone = GTimezoneVal $ GString $ DS.timezone r,
  city = GCityVal $ GString "Gothenburg",
  time = GTimeVal $ GString $ show $ GInt $ DS.time $ DS.currently r,
  precipIntensity = GPrecipIntensityVal $ GFloat $ DS.precipIntensity $ DS.currently r,
  precipProbability = GPrecipProbabilityVal $ GFloat $ DS.precipProbability $ DS.currently r,
  temperature = GTemperatureVal $ GFloat $ DS.temperature $ DS.currently r,
  apparentTemperature = GApparentTemperatureVal $ GFloat $ DS.apparentTemperature $ DS.currently r,
  dewPoint = GDewPointVal $ GFloat $ DS.dewPoint $ DS.currently r,
  humidity = GHumidiyVal $ GFloat $ DS.humidity $ DS.currently r,
  windSpeed = GWindSpeedVal $ GFloat $ DS.windSpeed $ DS.currently r,
  windBearing = GWindBearingVal $ GFloat $ DS.windBearing $ DS.currently r,
  cloudCover = GCloudCoverVal $ GFloat $ DS.cloudCover $ DS.currently r,
  pressure = GPressureVal $ GFloat $ DS.pressure $ DS.currently r,
  ozone = GOzoneVal $ GFloat $ DS.ozone $ DS.currently r}


getTempPerception :: Ontology -> GSpan
getTempPerception o | temp <= 0  = GFreezing
                    | temp <= 15 = GChilly
                    | temp <= 25 = GWarm
                    | temp <= 35 = GHot
                    | otherwise = GBoiling
                      where (GTemperatureVal (GFloat temp)) = temperature o


t :: Ontology -> GSchema
t o = GNonVolitionalCause (GNuc' n) (GBSat $ GSat s)
  where
    n = GCircumstance (GNuc $ getTempPerception o) (GBSat (GSat $ GInCity (city o)))
    s = GTempIs (temperature o)



f2c :: Double -> Double
f2c f = (f - 32 ) / 1.8


main :: IO ()
main = do
  req <- parseRequest "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/57.6962901,11.978816/?exclude=minutely,hourly,daily,alerts,flags"
  mgr <- getGlobalManager
  resp <- httpLbs req mgr
  let json = (UTF8.toString (responseBody resp))
      response = decodeJSON json :: DS.Response
      o = extractOntology response
  gr <- readPGF "Weather.pgf"
  let out = case readLanguage languageName of
        Just lng -> linearize gr lng (gf (t o))
        Nothing  -> languageName ++ " is not found."
  putStrLn out
