{-# LANGUAGE DeriveDataTypeable #-}

module DarkSky where

import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Data.ByteString.Lazy.UTF8 as UTF8
import Text.JSON as JSON
import Text.JSON.Generic


data Response = Response {
  latitude  :: Double,
  longitude :: Double,
  timezone  :: String,
  currently :: Currently
  } deriving (Eq, Show, Data, Typeable)

data Currently = Currently {
  time :: Int,
  summary :: String,
  icon :: String,
  precipIntensity :: Double,
  precipProbability :: Double,
  temperature :: Double,
  precipType :: String,
  apparentTemperature :: Double,
  dewPoint :: Double,
  humidity :: Double,
  windSpeed :: Double,
  windBearing :: Double,
  cloudCover :: Double,
  pressure :: Double,
  ozone :: Double
  } deriving (Eq, Show, Data, Typeable)


request = "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/57.6962901,11.978816/?exclude=minutely,hourly,daily,alerts,flags"


getResponse :: IO DarkSky.Response
getResponse =  do req <- parseRequest request
                  mgr <- getGlobalManager
                  resp <- httpLbs req mgr
                  let json = (UTF8.toString (responseBody resp))
                      response = decodeJSON json :: DarkSky.Response
                  return response
