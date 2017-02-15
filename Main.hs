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

langEng = "WeatherEng"
langRus = "WeatherRus"


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
  temperature = GTemperatureVal $ GFloat $ f2c $ DS.temperature $ DS.currently r,
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


temperaturePerception :: Ontology -> GSchema
temperaturePerception o = GNonVolitionalCause (GNuc' n) (GBSat $ GSat s)
  where
    n = GCircumstance (GNuc $ getTempPerception o) (GBSat (GSat $ GInCity (city o)))
    s = GTemperatureIs (temperature o)


showData :: Ontology -> GSchema
showData o = GJoint $ (GJCNuc (GNuc' $ temperaturePerception o)
                       (GJCNuc nApparentTemperature
                        (GJCNuc nLatitude
                         (GJCNuc nLongitude
                          (GJCNuc nPrecipIntensity
                           (GJCNuc nPrecipProbability
                            (GJCNuc nDewPoint
                             (GJCNuc nHumidity
                              (GJCNuc nWindSpeed
                               (GJCNuc nWindBearing
                                (GJCNuc nCloudCover
                                 (GJCNuc nPressure
                                  (GJBNuc nOzone)))))))))))))
  where nTemperature = GNuc $ GTemperatureIs $ temperature o
        nApparentTemperature = GNuc $ GApparentTemperatureIs $ apparentTemperature o
        nLatitude = GNuc $ GLatitudeIs $ latitude o
        nLongitude = GNuc $ GLongitudeIs $ longitude o
        nPrecipIntensity = GNuc $ GPrecipIntensityIs $ precipIntensity o
        nPrecipProbability = GNuc $ GPrecipProbabilityIs $ precipProbability o
        nDewPoint = GNuc $ GDewPointIs $ dewPoint o
        nHumidity = GNuc $ GHumidityIs $ humidity o
        nWindSpeed = GNuc $ GWindSpeedIs $ windSpeed o
        nWindBearing = GNuc $ GWindBearingIs $ windBearing o
        nCloudCover = GNuc $ GCloudCoverIs $ cloudCover o
        nPressure = GNuc $ GPressureIs $ pressure o
        nOzone = GNuc $ GOzoneIs $ ozone o




f2c :: Double -> Double
f2c f = (fromIntegral (floor  $ (f - 32 ) / 1.8 * 100))/100


main :: IO ()
main = do
  req <- parseRequest "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/57.6962901,11.978816/?exclude=minutely,hourly,daily,alerts,flags"
  mgr <- getGlobalManager
  resp <- httpLbs req mgr
  let json = (UTF8.toString (responseBody resp))
      response = decodeJSON json :: DS.Response
      o = extractOntology response
  gr <- readPGF "Weather.pgf"
  genOut o gr langEng
  genOut o gr langRus

  
genOut o gr lang = let out = case readLanguage lang of
                         Just lng -> linearize gr lng (gf (showData o))
                         Nothing  -> lang ++ " is not found."
                   in putStrLn out

