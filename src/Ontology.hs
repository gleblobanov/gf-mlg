module Ontology where

import qualified DarkSky as DS

import Control.Monad
import Data.Maybe
import Weather
import Numeric
import Data.Time.Clock
import Data.Time.Clock.POSIX
import Data.Time.LocalTime
import Data.Time.Format

data Ontology = Ontology {
  latitude :: Maybe GLatitude,
  longitude :: Maybe GLongitude,
  city :: Maybe GCity,
  time :: Maybe GTime,
  day :: Maybe GDay,
  weekday :: Maybe GWeekday,
  month :: Maybe GMonth,
  year :: Maybe GYear,
  timezone :: Maybe GTimezone,
  precipIntensity :: Maybe GPrecipIntensity,
  precipProbability :: Maybe GPrecipProbability,
  precipProbabilityType :: Maybe GPrecipProbabilityType,
  precipType :: Maybe GPrecipType,
  icon :: Maybe GIcon,
  temperature :: Maybe GTemperature,
  apparentTemperature :: Maybe GApparentTemperature,
  tempType :: Maybe GTempType,
  dewPoint :: Maybe GDewPoint,
  humidity :: Maybe GHumidity,
  humidityType :: Maybe GHumidityType,
  windSpeed :: Maybe GWindSpeed,
  windSpeedType :: Maybe GWindSpeedType,
  windBearingType :: Maybe GWindBearingType,
  windBearing :: Maybe GWindBearing,
  cloudCover :: Maybe GCloudCover,
  cloudCoverType :: Maybe GCloudCoverType,
  pressure :: Maybe GPressure,
  ozone :: Maybe GOzone }

type City = String

extractOntology :: DS.Response -> City-> Ontology
extractOntology r c = Ontology {
  latitude = getLatitude r,
  longitude = getLongitude r,
  city = getCity c,
  time = getTime r,
  day = getDay r,
  weekday = getWeekday r,
  month = getMonth r,
  year = getYear r,
  timezone = getTimezone r,
  precipIntensity = getPrecipIntensity r,
  precipProbability = getPrecipProbability r,
  precipProbabilityType = getPrecipProbabilityType r,
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


getLatitude r = applyToResponseField r DS.latitude (GLatitudeVal . GFloat)

getLongitude r = applyToResponseField r DS.longitude (GLongitudeVal . GFloat)

getTimezone r = applyToResponseField r DS.timezone (GTimezoneVal . GString)

getWeekday r = applyToDataPointField r DS.currently DS.time op
  where op v = weekday
          where ztime   = makeZTime v
                weekday' = formatTime defaultTimeLocale "%u" ztime
                weekday = case weekday' of
                  "1" -> GMonday
                  "2" -> GTuesday
                  "3" -> GWednesday
                  "4" -> GThursday
                  "5" -> GFriday
                  "6" -> GSaturday
                  "7" -> GSunday


getDay r = applyToDataPointField r DS.currently DS.time op
  where op v = GDayVal $ GString day
          where ztime   = makeZTime v
                day     = formatTime defaultTimeLocale "%e" ztime

getMonth r = applyToDataPointField r DS.currently DS.time op
  where op v = month
          where ztime   = makeZTime v
                month'  = formatTime defaultTimeLocale "%m" ztime
                month = case month' of
                  "01"  -> GJanuary
                  "02"  -> GFebruary
                  "03"  -> GMarch
                  "04"  -> GApril
                  "05"  -> GMay
                  "06"  -> GJune
                  "07"  -> GJuly
                  "08"  -> GAugust
                  "09"  -> GSeptember
                  "10"  -> GOctober
                  "11"  -> GNovember
                  "12"  -> GDecember
                  _     -> GMonthNone


getYear r = applyToDataPointField r DS.currently DS.time op
  where op v = GYearVal $ GString day
          where ztime   = makeZTime v
                day     = formatTime defaultTimeLocale "%Y" ztime

getTime r = applyToDataPointField r DS.currently DS.time op
  where op v = GTimeVal $ GString t
          where ztime = makeZTime v
                t     = formatTime defaultTimeLocale "%R" ztime

makeZTime v = ztime
  where utctime = posixSecondsToUTCTime $ fromIntegral v
        tz      = hoursToTimeZone 1
        ztime   = utcToZonedTime tz utctime


getCity c = Just $ case c of
  "Gothenburg" -> GGothenburg
  "Osaka"      -> GOsaka

gothenburg = "57.6962901,11.978816"
osaka = "34.678395,135.4601305"


getIcon :: DS.Response -> Maybe GIcon
getIcon r = applyToDataPointField r DS.currently DS.icon op
  where op icon | icon == "clear-day" = GIconClearDay
                | icon == "clear-night" =  GIconClearNight
                | icon == "rain" = GIconRain
                | icon == "snow" =  GIconSnow
                | icon == "sleet" = GIconSleet
                | icon == "wind" = GIconWind
                | icon == "fog" = GIconFog
                | icon == "cloudy" = GIconCloudy
                | icon == "partly-cloudy-day" = GIconPartlyCloudyDay
                | icon == "partly-cloudy-night" = GIconPartlyCloudyNight
                | otherwise = GIconNone

getPrecipIntensity r = applyToDataPointField r DS.currently DS.precipIntensity op
  where op v = GPrecipIntensityVal $ GFloat $ inch2mm v


getPrecipProbability r = applyToDataPointField r DS.currently DS.precipProbability op
  where op v = GPrecipProbabilityVal $ GFloat v

getPrecipProbabilityType r = applyToDataPointField r DS.currently DS.precipProbability op
  where op v | v <= 0.2  = GVeryLow
             | v <= 0.4  = GLow
             | v <= 0.6  = GModerate
             | v <= 0.8  = GHigh
             | otherwise = GVeryHigh

getPrecipType r = applyToDataPointField r DS.currently DS.precipType op
  where op v | v == "rain"  = GRain
             | v == "snow"  = GSnow
             | v == "sleet" = GSleet
             | otherwise    = GPrecipNone

getTemperature r = applyToDataPointField r DS.currently DS.temperature op
  where op v = GTemperatureVal $ GFloat $ f2c v


getApparentTemperature r = applyToDataPointField r DS.currently DS.apparentTemperature op
  where op v = GApparentTemperatureVal $ GFloat $ f2c v
        

getTempType r = applyToDataPointField r DS.currently DS.apparentTemperature op
  where op v | v' >= 40   = GExtremelyHot
             | v' >= 35   = GVeryHot
             | v' >= 30   = GHot
             | v' >= 25   = GVeryWarm
             | v' >= 20   = GWarm
             | v' >= 15   = GMild
             | v' >= 10   = GCool
             | v' >= 5    = GCold
             | v' >= 0    = GVeryCold
             | otherwise = GFreezing
          where v' = f2c v


getDewPoint r = applyToDataPointField r DS.currently DS.dewPoint (GDewPointVal . GFloat . f2c)


getHumidity r = applyToDataPointField r DS.currently DS.humidity (GHumidityVal . GFloat . (100 *))


getHumidityType :: DS.Response -> Maybe GHumidityType
getHumidityType r =
  let currentlyMaybe = DS.currently r
  in case currentlyMaybe of
    Just currently ->
      let humidityMaybe = DS.humidity currently
      in case humidityMaybe of
        Just humidity ->
          let dewPointMaybe = DS.dewPoint currently
          in case dewPointMaybe of
            Just dewPoint -> Just $ getPerception humidity dewPoint
            Nothing -> Nothing
        Nothing -> Nothing
    Nothing -> Nothing

getPerception h d | 26 <= d            && 73 <= h            = GSeverelyUncomofortableHumid
                  | 24 <= d && d <= 26 && 62 <= h && h <= 72 = GExtremelyUncomfortableHumid
                  | 21 <= d && d <= 24 && 52 <= h && h <= 61 = GQuiteUncomfortableHumid
                  | 18 <= d && d <= 21 && 44 <= h && h <= 51 = GSomewhatUncomfortableHumid
                  | 16 <= d && d <= 18 && 37 <= h && h <= 43 = GScarcelyUncomfortableHumid
                  | 13 <= d && d <= 16 && 31 <= h && h <= 36 = GComfortableHumid
                  | 10 <= d && d <= 12 && 26 <= h && h <= 30 = GVeryComfortableHumid
                  |            d <= 10 &&            h <= 25 = GScarcelyUncomfortableDry
                  | otherwise = GHumidityNone


getWindSpeed r = applyToDataPointField r DS.currently DS.windSpeed (GWindSpeedVal . GFloat . m2km)


getWindSpeedType r = applyToDataPointField r DS.currently DS.windSpeed op
  where op v | v' <= 2 =   GCalm
             | v' <= 6 =   GLightAir
             | v' <= 11 =  GLightBreeze
             | v' <= 19 =  GGentleBreeze
             | v' <= 30 =  GModerateBreeze
             | v' <= 39 =  GFreshBreeze
             | v' <= 50 =  GStrongBreeze
             | v' <= 61 =  GModerateGale
             | v' <= 74 =  GFreshGale
             | v' <= 87 =  GStrongGale
             | v' <= 102 = GWholeGale
             | v' <= 117 = GStorm
             | otherwise = GHurricane
          where v' = m2km v


getWindBearing r = applyToDataPointField r DS.currently DS.windBearing (GWindBearingVal . GFloat)

getWindBearingType r = applyToDataPointField r DS.currently DS.windBearing op
  where op v | 348.75 <= v || v <= 11.25 = GN
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

getCloudCover r = applyToDataPointField r DS.currently DS.cloudCover (GCloudCoverVal . GFloat . (10 *))

getCloudCoverType r = applyToDataPointField r DS.currently DS.cloudCover op
  where op v | v <= 0.1  = GClear
             | v<= 0.5  = GScattered
             | v <= 0.9  = GBroken
             | otherwise = GOvercast


getPressure r = applyToDataPointField r DS.currently DS.pressure (GPressureVal . GFloat)
getOzone r = applyToDataPointField r DS.currently DS.ozone (GOzoneVal . GFloat)



f2c :: Double -> Double
f2c f = fromIntegral (floor  $ (f - 32 ) / 1.8 * 100) / 100

m2km :: Double -> Double
m2km m = fromIntegral (floor  $ m * 1.6 * 100) / 100

inch2mm :: Double -> Double
inch2mm i = fromIntegral (floor  $ i * 25.4 * 100) / 100

applyToDataPointField :: DS.Response -> (DS.Response -> Maybe DS.DataPoint) -> (DS.DataPoint -> Maybe a) -> (a -> b) -> Maybe b
applyToDataPointField r f1 f2 op = let datapointMaybe = f1 r in case datapointMaybe of
  Just currently -> let m = f2 currently in liftM op m
  Nothing -> Nothing

applyToResponseField :: DS.Response -> (DS.Response -> Maybe a) -> (a -> b) -> Maybe b
applyToResponseField r f op = let m = f r in liftM op m
