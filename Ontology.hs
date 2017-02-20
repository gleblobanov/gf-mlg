module Ontology where

import qualified DarkSky as DS

import Weather
import Numeric
import Data.Time.Clock.POSIX
import Data.Time.Calendar


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

getDay r = $ posixSecondsToUTCTime $ DS.time r

getMonth r = undefined

getYear r = undefined

getCity r = GGothenburg

getTime r = GTimeVal $ GString $ show $ GInt $ DS.time $ DS.currently r

getIcon r | v == "clear-day" =           GIconClearDay
          | v == "clear-night" =         GIconClearNight
          | v == "rain" =                GIconRain
          | v == "snow" =                GIconSnow
          | v == "sleet" =               GIconSleet
          | v == "wind" =                GIconWind
          | v == "fog" =                 GIconFog
          | v == "cloudy" =              GIconCloudy
          | v == "partly-cloudy-day" =   GIconPartlyCloudyDay
          | v == "partly-cloudy-night" = GIconPartlyCloudyNight
          | otherwise =                  GIconNone
  where v = DS.icon $ DS.currently r


getPrecipIntensity r = GPrecipIntensityVal $ GFloat $ inch2mm $ DS.precipIntensity $ DS.currently r

getPrecipProbability r = GPrecipProbabilityVal $ GFloat $ DS.precipProbability $ DS.currently r

getPrecipType r | v == "rain"  = GRain
                | v == "snow"  = GSnow
                | v == "sleet" = GSleet
                | otherwise    = GPrecipNone
  where v = DS.precipType $ DS.currently r

getTemperature r = GTemperatureVal $ GFloat $ f2c $ DS.temperature $ DS.currently r

getApparentTemperature r =
  GApparentTemperatureVal $ GFloat $ DS.apparentTemperature $ DS.currently r

getTempType r | v >= 40   = GExtremelyHot
              | v >= 35   = GVeryHot
              | v >= 30   = GHot
              | v >= 25   = GVeryWarm
              | v >= 20   = GWarm
              | v >= 15   = GMild
              | v >= 10   = GCool
              | v >= 5    = GCold
              | v >= 0    = GVeryCold
              | otherwise = GFreezing
  where v = f2c $ DS.temperature $ DS.currently r

getDewPoint r = GDewPointVal $ GFloat $ DS.dewPoint $ DS.currently r

getHumidity r = GHumidityVal $ GFloat $ DS.humidity $ DS.currently r

getHumidityType r | 26 <= d            && 73 <= h            = GSeverelyUncomofortableHumid
                  | 24 <= d && d <= 26 && 62 <= h && h <= 72 = GExtremelyUncomfortableHumid
                  | 21 <= d && d <= 24 && 52 <= h && h <= 61 = GQuiteUncomfortableHumid
                  | 18 <= d && d <= 21 && 44 <= h && h <= 51 = GSomewhatUncomfortableHumid
                  | 16 <= d && d <= 18 && 37 <= h && h <= 43 = GScarcelyUncomfortableHumid
                  | 13 <= d && d <= 16 && 31 <= h && h <= 36 = GComfortableHumid
                  | 10 <= d && d <= 12 && 26 <= h && h <= 30 = GVeryComfortableHumid
                  |            d <= 10 &&            h <= 25 = GScarcelyUncomfortableDry
                  | otherwise = GHumidityNone
  where h = DS.humidity $ DS.currently r
        d = f2c $ DS.dewPoint $ DS.currently r

getWindSpeed r = GWindSpeedVal $ GFloat $ DS.windSpeed $ DS.currently r

getWindSpeedType r | v <= 2 =    GCalm
                   | v <= 6 =    GLightAir
                   | v <= 11 =   GLightBreeze
                   | v <= 19 =   GGengleBreeze
                   | v <= 30 =   GModerateBreeze
                   | v <= 39 =   GFreshBreeze
                   | v <= 50 =   GStrongBreeze
                   | v <= 61 =   GModerateGale
                   | v <= 74 =   GFreshGale
                   | v <= 87 =   GStrongGale
                   | v <= 102 =  GWholeGale
                   | v <= 117 =  GStorm
                   | otherwise = GHurricane
  where v = m2km $ DS.windSpeed $ DS.currently r


getWindBearing r = GWindBearingVal $ GFloat $ DS.windBearing $ DS.currently r

getWindBearingType r | 348.75 <= v && v <= 11.25 = GN
                     | 11.25 <= v && v <= 33.75 = GNNE
                     | 33.75 <= v && v <= 56.25 = GNE
                     | 56.25 <= v && v <=78.75  = GENE
                     | 78.75 <= v && v <= 101.25 = GE
                     | 101.25 <= v && v <= 123.75 = GESE
                     | 123.75 <= v && v <= 146.25 = GSE
                     | 146.25 <= v && v <= 168.75 = GSSE
                     | 168.75 <= v && v <= 191.25 = GS
                     | 191.25 <= v && v <= 213.75 = GSSW
                     | 213.75 <= v && v <= 236.25 = GSW
                     | 236.25 <= v && v <= 258.75 = GWSW
                     | 258.75 <= v && v <= 281.25 = GW
                     | 281.25 <= v && v <= 303.75 = GWNW
                     | 303.75 <= v && v <= 326.25 = GNW
                     | 326.25 <= v && v <= 348.75 = GNNW
  where v = DS.windBearing $ DS.currently r

getCloudCover r = GCloudCoverVal $ GFloat $ 10 * $ DS.cloudCover $ DS.currently r

getCloudCoverType r | v <= 0.1  = GClear
                    | v <= 0.5  = GScattered
                    | v <= 0.9  = GBroken
                    | otherwise = GOvercast
                      where v = DS.cloudCover $ DS.currently r

getPressure r = GPressureVal $ GFloat $ DS.pressure $ DS.currently r
getOzone r = GOzoneVal $ GFloat $ DS.ozone $ DS.currently r



f2c :: Double -> Double
f2c f = (fromIntegral (floor  $ (f - 32 ) / 1.8 * 100))/100

m2km :: Double -> Double
m2km m = m * 1.6

inch2mm :: Double -> Double
inch2mm i = i * 25.4
