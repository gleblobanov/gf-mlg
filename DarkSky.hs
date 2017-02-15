{-# LANGUAGE DeriveDataTypeable #-}

module DarkSky where

import Text.JSON
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
  apparentTemperature :: Double,
  dewPoint :: Double,
  humidity :: Double,
  windSpeed :: Double,
  windBearing :: Double,
  cloudCover :: Double,
  pressure :: Double,
  ozone :: Double
  } deriving (Eq, Show, Data, Typeable)


