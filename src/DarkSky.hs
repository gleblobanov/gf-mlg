{-# LANGUAGE DeriveGeneric #-}

module DarkSky where

import Data.Maybe
import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Data.ByteString.Lazy.UTF8 as UTF8
import Text.JSON as JSON
import GHC.Generics
import Data.Aeson
import Control.Monad

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


keyDS = "a270ce9fa3ff87b86cc329482c80e63f"

queryCrnt lat long = "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/"++ loc ++"/?exclude=minutely,hourly,daily,alerts,flags"
  where loc = show lat ++ "," ++ show long

queryFtr lat long time = "GET https://api.darksky.net/forecast/a270ce9fa3ff87b86cc329482c80e63f/"++ loc ++"/?exclude=minutely,hourly,daily,alerts,flags"
  where loc = show lat ++ "," ++ show long ++ "," ++ show time


getResponse :: String -> IO (Maybe DarkSky.Response)
getResponse query =  do req <- parseRequest query
                        mgr  <- getGlobalManager
                        resp <- httpLbs req mgr
                        let json =  (responseBody resp)
                            response = Data.Aeson.decode json :: Maybe DarkSky.Response
                        return response


getAverage :: (DataPoint -> Maybe Double) -> Float -> Float -> Int -> IO Double
getAverage acsr lat long ts = print "Average computed" >> liftM  ((/ fromIntegral yrs) . sum . catMaybes) rslt
  where scndsInYear = 31536000
        yrs         = 10
        hTs         = map ((\ x -> ts - x) . (scndsInYear*)) [0..yrs-1]
        queryHistory lat long ts =
          "GET https://api.darksky.net/forecast/" ++
          keyDS     ++ "/" ++
          show lat  ++ "," ++
          show long ++ "," ++
          show ts   ++
          "?units=si"

        rslt  = mapM (getValue . getResponse . queryHistory lat long) hTs
        getValue :: IO (Maybe DarkSky.Response) -> IO (Maybe Double)
        getValue cmnd = do mResp <- cmnd
                           case mResp of
                             Nothing -> return Nothing
                             Just resp -> case currently resp of
                                            Nothing -> return Nothing
                                            Just crnt ->  case acsr crnt of
                                                            Nothing -> return Nothing
                                                            Just v -> return $ Just v


testAvrg = getAverage dewPoint 57.7089 11.9746 1494381850
