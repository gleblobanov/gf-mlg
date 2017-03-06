{-# LANGUAGE DeriveGeneric #-}

module DarkSky where

import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Data.ByteString.Lazy.UTF8 as UTF8
import Text.JSON as JSON
import GHC.Generics
import Data.Aeson

data Response = Response {
  latitude  :: Maybe Double,
  longitude :: Maybe Double,
  timezone  :: Maybe String,
  currently :: Maybe DataPoint
  } deriving (Generic, Show)

data DataPoint = DataPoint {
  apparentTemperature :: Maybe Double,
  apparentTemperatureMax :: Maybe Double,
  apparentTemperatureMaxTime :: Maybe Double,
  apparentTemperatureMin :: Maybe Double,
  apparentTemperatureMinTime :: Maybe Double,
  cloudCover :: Maybe Double,
  dewPoint :: Maybe Double,
  humidity :: Maybe Double,
  icon :: Maybe String,
  moonPhase :: Maybe Double,
  nearestStormBearing :: Maybe Double,
  nearestStormDistance :: Maybe Double,
  ozone :: Maybe Double,
  time :: Maybe Int,
  summary :: Maybe String,
  precipIntensity :: Maybe Double,
  precipProbability :: Maybe Double,
  temperature :: Maybe Double,
  precipType :: Maybe String,
  windSpeed :: Maybe Double,
  windBearing :: Maybe Double,
  pressure :: Maybe Double
  } deriving (Generic, Show)

instance FromJSON DarkSky.Response
instance FromJSON DataPoint


request city = "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/"++ city ++"/?exclude=minutely,hourly,daily,alerts,flags"


getResponse :: String -> IO (Maybe DarkSky.Response)
getResponse city =  do req <- parseRequest $ request city
                       mgr <- getGlobalManager
                       resp <- httpLbs req mgr
                       let json =  (responseBody resp)
                           response = Data.Aeson.decode json :: Maybe DarkSky.Response
                       return response
