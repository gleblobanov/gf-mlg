module Ontology where

import qualified DarkSky as DS

import Weather
import Numeric


data Ontology = Ontology {
  latitude :: GLatitude,
  longitude :: GLongitude,
  city :: GCity,
  time :: GTime,
  day :: GDay,
  month :: GMonth,
  year :: GYear,
  timezone :: GTimezone,
  precipIntensity :: GPrecipIntensity,
  precipProbability :: GPrecipProbability,
  precipType :: GPrecipType,
  icon :: GIcon,
  temperature :: GTemperature,
  apparentTemperature :: GApparentTemperature,
  tempType :: GTempType,
  dewPoint :: GDewPoint,
  humidity :: GHumidity,
  humidityType :: GHumidityType,
  windSpeed :: GWindSpeed,
  windSpeedType :: GWindSpeedType,
  windBearingType :: GWindBearingType,
  windBearing :: GWindBearing,
  cloudCover :: GCloudCover,
  cloudCoverType :: GCloudCoverType,
  pressure :: GPressure,
  ozone :: GOzone }


extractOntology :: DS.Response -> Ontology
extractOntology r = Ontology {
  latitude = getLatitude r,
  longitude = getLongitude r,
  city = getCity r,
  time = getTime r,
  day = getDay r,
  month = getMonth r,
  year = getYear r,
  timezone = getTimezone r,
  precipIntensity = getPrecipIntensity r,
  precipProbability = getPrecipProbability r,
  precipType = getPrecipType r,
  icon = getIcon r,
  temperature = getTemperature r,
  apparentTemperature = getApparentTemperature r,
  tempType = getTempType r,
  dewPoint = getDewPoint r,
  humidity = getHumidity r,
  humidityType = getHumidityType r,
  windSpeed = getWindSpeed r,
  windSpeedType = getWindSpeedType r,
  windBearingType = getWindBearingType r,
  windBearing = getWindBearing r,
  cloudCover = getCloudCover r,
  cloudCoverType = getCloudCoverType r,
  pressure = getPressure r,
  ozone = getOzone r}


getLatitude r = GLatitudeVal $ GFloat $ DS.latitude r
getLongitude r = GLongitudeVal $ GFloat $ DS.longitude r

getTimezone r = GTimezoneVal $ GString $ DS.timezone r

getDay r = undefined

getMonth r = undefined

getYear r = undefined

getCity r = GGothenburg

getTime r = GTimeVal $ GString $ show $ GInt $ DS.time $ DS.currently r

getIcon r = undefined

getPrecipIntensity r = GPrecipIntensityVal $ GFloat $ DS.precipIntensity $ DS.currently r

getPrecipProbability r = GPrecipProbabilityVal $ GFloat $ DS.precipProbability $ DS.currently r

getPrecipType r | v == "rain"  = GRain
                | v == "snow"  = GSnow
                | v == "sleet" = GSleet
                | otherwise    = GPrecipNone
  where v = DS.precipType $ DS.currently r


getTemperature r = GTemperatureVal $ GFloat $ f2c $ DS.temperature $ DS.currently r

getApparentTemperature r =
  GApparentTemperatureVal $ GFloat $ DS.apparentTemperature $ DS.currently r

getTempType r = undefined

getDewPoint r = GDewPointVal $ GFloat $ DS.dewPoint $ DS.currently r

getHumidity r = GHumidityVal $ GFloat $ DS.humidity $ DS.currently r

getHumidityType r = undefined

getWindSpeed r = GWindSpeedVal $ GFloat $ DS.windSpeed $ DS.currently r

getWindSpeedType r = undefined

getWindBearing r = GWindBearingVal $ GFloat $ DS.windBearing $ DS.currently r

getWindBearingType r = undefined

getCloudCover r = GCloudCoverVal $ GFloat $ DS.cloudCover $ DS.currently r

getCloudCoverType r | v <= 0.1  = GClear
                    | v <= 0.5  = GScattered
                    | v <= 0.9  = GBroken
                    | otherwise = GOvercast
                      where v = DS.cloudCover $ DS.currently r

getPressure r = GPressureVal $ GFloat $ DS.pressure $ DS.currently r
getOzone r = GOzoneVal $ GFloat $ DS.ozone $ DS.currently r



f2c :: Double -> Double
f2c f = (fromIntegral (floor  $ (f - 32 ) / 1.8 * 100))/100



