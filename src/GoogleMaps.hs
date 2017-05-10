{-# LANGUAGE DeriveGeneric #-}

module GoogleMaps where

import Data.List.Utils (replace)
import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Data.ByteString.Lazy.UTF8 as UTF8
import Text.JSON as JSON
import GHC.Generics
import Data.Aeson

data GeoResponse = GeoResponse {
  results  :: Maybe [Address]

  } deriving (Generic, Show)

data Address = Address {
  formatted_address :: String,
  geometry :: Maybe Geometry
  } deriving (Generic, Show)

data Geometry = Geometry {
  location :: Maybe Location
  } deriving (Generic, Show)

data Location = Location {
  lat  :: Maybe Float,
  lng :: Maybe Float
  } deriving (Generic, Show)

instance FromJSON GoogleMaps.GeoResponse
instance FromJSON Address
instance FromJSON Geometry
instance FromJSON Location

apiKeyGeo = "AIzaSyBK3_B_7BTe5nrLJ6POFdRtyO4WJHo-MN8"
apiKeyTime = "AIzaSyB4Vr97-_93i_s0UHl3pxC01w0sSQAIWRo"

requestGeocode :: String -> String
requestGeocode query = let query' = replace " " "+" query
                       in "https://maps.googleapis.com/maps/api/geocode/json?address=" ++
                          query' ++
                          "&key=" ++ apiKeyGeo

requestReverseGeocode :: Float -> Float -> String
requestReverseGeocode lt lg =
  "GET https://maps.googleapis.com/maps/api/geocode/json?latlng=" ++
  show lt ++ "," ++ show lg ++
  "&key" ++ apiKeyGeo ++
  "&result_type=street_address"

-- reverseGeocodeGothenburg = getCityCountry 57.7089 11.9746
-- reverseGeocodeOsaka = getCityCountry 34.6937 135.5022

-- geocodeOsaka = geocode "Osaka"




-- | Returns (formatted address, latitude, longitude)
geocode :: String -> IO (Maybe (String, Float, Float))
geocode query =  do req <- parseRequest $ requestGeocode query
                    mgr <- getGlobalManager
                    resp <- httpLbs req mgr
                    let j = responseBody resp
                        response = Data.Aeson.decode j :: Maybe GoogleMaps.GeoResponse
                    case response of
                      Nothing           -> return Nothing
                      Just (GeoResponse r) -> case r of
                                             Nothing   -> return Nothing
                                             Just adrs -> case adrs of
                                                            []  -> return Nothing
                                                            a:_ -> let fa = formatted_address a
                                                                   in case geometry a of
                                                                        Nothing -> return Nothing
                                                                        Just g  -> case location g of
                                                                                     Nothing -> return Nothing
                                                                                     Just loc  -> case lat loc of
                                                                                                    Nothing -> return Nothing
                                                                                                    Just lt -> case lng loc of
                                                                                                                 Nothing -> fail "Nothing Long"
                                                                                                                 Just lg -> return $ Just (fa, lt, lg)


reverseGeocode :: Float -> Float -> IO String
reverseGeocode lt lg =  do req <- parseRequest $ requestReverseGeocode lt lg
                           mgr <- getGlobalManager
                           resp <- httpLbs req mgr
                           let j = responseBody resp
                               response = Data.Aeson.decode j :: Maybe GoogleMaps.GeoResponse
                           case response of
                             Nothing           -> fail "Nothing response"
                             Just (GeoResponse r) -> case r of
                                                    Nothing   -> fail "Nothing results"
                                                    Just adrs -> case adrs of
                                                                   []  -> return "Nothing"
                                                                   a:_ -> return $ formatted_address a



data TimeResponse = TimeResponse {
  rawOffset :: Maybe Int,
  dstOffset :: Maybe Int
  } deriving (Generic, Show)

instance FromJSON TimeResponse

requestTimezone :: Float -> Float -> Int -> String
requestTimezone lt lg ts =
  "GET https://maps.googleapis.com/maps/api/timezone/json?location=" ++
  show lt ++ "," ++ show lg ++
  "&timestamp=" ++ show ts ++
  "&key=" ++ apiKeyTime


getTimeOffset :: Float -> Float -> Int -> IO (Maybe Int)
getTimeOffset lt lg ts =  do req <- parseRequest $ requestTimezone lt lg ts
                             mgr <- getGlobalManager
                             resp <- httpLbs req mgr
                             let j = responseBody resp
                                 response = Data.Aeson.decode j :: Maybe GoogleMaps.TimeResponse
                             case response of
                               Nothing -> return Nothing
                               Just tr -> case rawOffset tr of
                                            Nothing   -> return Nothing
                                            Just ro -> case dstOffset tr of
                                                         Nothing   -> return Nothing
                                                         Just dst -> return . Just $ ro + dst



