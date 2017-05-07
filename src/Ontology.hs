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
import PGF

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
  averagePrecipIntensity :: Maybe GAveragePrecipIntensity,
  precipProbability :: Maybe GPrecipProbability,
  precipProbabilityType :: Maybe GPrecipProbabilityType,
  precipType :: Maybe GPrecipType,
  averagePrecipType :: Maybe GAverage,
  icon :: Maybe GIcon,
  temperature :: Maybe GTemperature,
  averageTemperature :: Maybe GAverageTemperature,
  apparentTemperature :: Maybe GApparentTemperature,
  tempType :: Maybe GTempType,
  averageTempType :: Maybe GAverage,
  dewPoint :: Maybe GDewPoint,
  humidity :: Maybe GHumidity,
  averageHumidity :: Maybe GAverageHumidity,
  humidityType :: Maybe GHumidityType,
  averageHumidityType :: Maybe GAverage,
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
  averagePrecipIntensity = getAveragePrecipIntensity r,
  precipProbability = getPrecipProbability r,
  precipProbabilityType = getPrecipProbabilityType r,
  precipType = getPrecipType r,
  averagePrecipType = Nothing,
  icon = getIcon r,
  temperature = getTemperature r,
  averageTemperature = getAverageTemperature r,
  apparentTemperature = getApparentTemperature r,
  tempType = getTempType r,
  averageTempType = Nothing,
  dewPoint = getDewPoint r,
  humidity = getHumidity r,
  averageHumidity = getAverageHumidity r,
  humidityType = getHumidityType r,
  averageHumidityType = Nothing,
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

getAveragePrecipIntensity r = Just $ GAveragePrecipIntensityVal $ GFloat 0.1 -- TODO provide a value

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

getAverageTemperature r = Just $ GAverageTemperatureVal $ GFloat 15 -- TODO provide a value

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

getAverageHumidity r = Just $ GAverageHumidityVal $ GFloat 0.1  -- TODO provide a value

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
  where op v | 348.75 <= v || v <= 11.25 = GWindN
             | 11.25 <= v && v <= 33.75 = GWindNNE
             | 33.75 <= v && v <= 56.25 = GWindNE
             | 56.25 <= v && v <=78.75  = GWindENE
             | 78.75 <= v && v <= 101.25 = GWindE
             | 101.25 <= v && v <= 123.75 = GWindESE
             | 123.75 <= v && v <= 146.25 = GWindSE
             | 146.25 <= v && v <= 168.75 = GWindSSE
             | 168.75 <= v && v <= 191.25 = GWindS
             | 191.25 <= v && v <= 213.75 = GWindSSW
             | 213.75 <= v && v <= 236.25 = GWindSW
             | 236.25 <= v && v <= 258.75 = GWindWSW
             | 258.75 <= v && v <= 281.25 = GWindW
             | 281.25 <= v && v <= 303.75 = GWindWNW
             | 303.75 <= v && v <= 326.25 = GWindNW
             | 326.25 <= v && v <= 348.75 = GWindNNW

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



ontologyApplyRules :: Ontology -> Ontology
ontologyApplyRules (Ontology
  latitude
  longitude
  city
  time
  day
  weekday
  month
  year
  timezone
  precipIntensity
  averagePrecipIntensity
  precipProbability
  precipProbabilityType
  precipType
  averagePrecipType
  icon
  temperature
  averageTemperature
  apparentTemperature
  tempType
  averageTempType
  dewPoint
  humidity
  averageHumidity
  humidityType
  averageHumidityType
  windSpeed
  windSpeedType
  windBearingType
  windBearing
  cloudCover
  cloudCoverType
  pressure
  ozone) = Ontology
  latitude
  longitude
  city
  time
  day
  weekday
  month
  year
  timezone
  (infoPrecipType precipIntensity precipIntensity precipType)
  averagePrecipIntensity
  (infoPrecipProbability precipProbability precipProbability precipProbabilityType)
  (infoPrecipProbability precipProbabilityType precipProbability precipProbabilityType)
  (infoPrecipType precipType precipIntensity precipType)
  averagePrecipType'
  icon
  (infoTemperature temperature tempType temperature apparentTemperature)
  averageTemperature
  (infoTemperature apparentTemperature tempType temperature apparentTemperature)
  (infoTemperature tempType tempType temperature apparentTemperature)
  averageTempType'
  (infoDewPointHumidity dewPoint humidity dewPoint humidityType)
  (infoDewPointHumidity humidity humidity dewPoint humidityType)
  averageHumidity
  (infoDewPointHumidity humidityType humidity dewPoint humidityType)
  averageHumidityType'
  (infoWindBearing windSpeed windSpeed windSpeedType windBearingType)
  (infoWindBearing windSpeedType windSpeed windSpeedType windBearingType)
  (infoWindBearing windBearingType windSpeed windSpeedType windBearingType)
  windBearing
  cloudCover
  cloudCoverType
  pressure
  ozone
  where averagePrecipType'   = computeAveragePrecipType averagePrecipIntensity precipIntensity
        averageTempType'     = computeAverageTempType averageTemperature temperature
        averageHumidityType' = computeAverageHumidityType averageHumidity humidity

-- | Computes a value denoting whether precipitation intencity is greater, less, or equal to average one
computeAveragePrecipType :: Maybe GAveragePrecipIntensity -> Maybe GPrecipIntensity -> Maybe GAverage
computeAveragePrecipType Nothing _ = Nothing
computeAveragePrecipType _ Nothing = Nothing
computeAveragePrecipType (Just (GAveragePrecipIntensityVal (GFloat avPrcp))) (Just (GPrecipIntensityVal (GFloat prcp)))
  | ratio == 1 = Just GEqual
  | ratio < 1 && ratio >= 0.9 = Just GSlightlyGreater
  | ratio < 0.9 && ratio >= 0.5 = Just GGreater
  | ratio < 0.5 = Just GRemarkablyGreater
  | ratio > 1 && ratio <= 1.1 = Just GSlightlyLess
  | ratio > 1.1 && ratio <= 1.5 = Just GLess
  | ratio > 1.5 = Just GRemarkablyLess
  where ratio = avPrcp / prcp

-- | Computes a value denoting whether a temperature is greater, less, or equal to an average temperature
computeAverageTempType :: Maybe GAverageTemperature -> Maybe GTemperature -> Maybe GAverage
computeAverageTempType Nothing _ = Nothing
computeAverageTempType _ Nothing = Nothing
computeAverageTempType (Just (GAverageTemperatureVal (GFloat avTemp))) (Just (GTemperatureVal (GFloat temp)))
  | dist == 0  = Just GEqual
  | dist <= 5  && temp > avTemp  = Just GSlightlyGreater
  | dist <= 10 && temp > avTemp  = Just GGreater
  | dist > 10  && temp > avTemp  = Just GRemarkablyGreater
  | dist <= 5  && temp < avTemp  = Just GSlightlyLess
  | dist <= 10 && temp < avTemp  = Just GLess
  | dist > 10  && temp < avTemp  = Just GRemarkablyLess
  where dist = abs $ avTemp - temp

computeAverageHumidityType :: Maybe GAverageHumidity -> Maybe GHumidity -> Maybe GAverage
computeAverageHumidityType Nothing _ = Nothing
computeAverageHumidityType _ Nothing = Nothing
computeAverageHumidityType (Just (GAverageHumidityVal (GFloat avHmd))) (Just (GHumidityVal (GFloat hmd)))
  | ratio == 1 = Just GEqual
  | ratio < 1 && ratio >= 0.9 = Just GSlightlyGreater
  | ratio < 0.9 && ratio >= 0.5 = Just GGreater
  | ratio < 0.5 = Just GRemarkablyGreater
  | ratio > 1 && ratio <= 1.1 = Just GSlightlyLess
  | ratio > 1.1 && ratio <= 1.5 = Just GLess
  | ratio > 1.5 = Just GRemarkablyLess
  where ratio = avHmd / hmd


infoPrecipType :: Maybe a -> Maybe GPrecipIntensity -> Maybe GPrecipType -> Maybe a
infoPrecipType _ Nothing _ = Nothing
infoPrecipType _ _ Nothing = Nothing
infoPrecipType a _ _ = a


infoTemperature :: Maybe a -> Maybe GTempType -> Maybe GTemperature -> Maybe GApparentTemperature -> Maybe a
infoTemperature _ Nothing _ _ = Nothing
infoTemperature _ _ Nothing _ = Nothing
infoTemperature _ _ _ Nothing = Nothing
infoTemperature a _ _ _       = a


infoPrecipProbability :: Maybe a -> Maybe GPrecipProbability -> Maybe GPrecipProbabilityType -> Maybe a
infoPrecipProbability _ Nothing _ = Nothing
infoPrecipProbability _ _ Nothing = Nothing
infoPrecipProbability a _ _       = a


infoDewPointHumidity :: Maybe a -> Maybe GHumidity -> Maybe GDewPoint -> Maybe GHumidityType -> Maybe a
infoDewPointHumidity _ Nothing _ _ = Nothing
infoDewPointHumidity _ _ Nothing _ = Nothing
infoDewPointHumidity _ _ _ Nothing = Nothing
infoDewPointHumidity a _ _ _       = a


infoWindBearing :: Maybe a -> Maybe GWindSpeed -> Maybe GWindSpeedType -> Maybe GWindBearingType -> Maybe a
infoWindBearing _ Nothing _ _ = Nothing
infoWindBearing _ _ Nothing _ = Nothing
infoWindBearing _ _ _ Nothing = Nothing
infoWindBearing a _ _ _       = a


ontologyToList :: Ontology -> [(CId, Maybe Expr)]
ontologyToList (Ontology
  latitude
  longitude
  city
  time
  day
  weekday
  month
  year
  timezone
  precipIntensity
  averagePrecipIntensity
  precipProbability
  precipProbabilityType
  precipType
  averagePrecipType
  icon
  temperature
  averageTemperature
  apparentTemperature
  tempType
  averageTempType
  dewPoint
  humidity
  averageHumidity
  humidityType
  averageHumidityType
  windSpeed
  windSpeedType
  windBearingType
  windBearing
  cloudCover
  cloudCoverType
  pressure
  ozone) =[
  (mkCId "Latitude", Nothing),
  (mkCId "Longitude", Nothing),
  toCIdExpr "City" city,
  toCIdExpr "Time" time,
  toCIdExpr "Day" day,
  toCIdExpr "Weekday" weekday,
  toCIdExpr "Month" month,
  toCIdExpr "Year" year,
  toCIdExpr "Icon" icon,
  -- toCIdExpr "PrecipIntensity" precipIntensity,
  -- toCIdExpr "AveragePrecipIntensity" averagePrecipIntensity,
  -- (mkCId "PrecipType", Nothing),
  -- toCIdExpr "AveragePrecipType" averagePrecipType,
  toCIdExpr "PrecipProbabilityType" precipProbabilityType,
  toCIdExpr "Temperature" temperature,
  toCIdExpr "AverageTemperature" averageTemperature,
  toCIdExpr "ApparentTemperature" apparentTemperature,
  (mkCId "TempType", Nothing),
  toCIdExpr "AverageTempType" averageTempType,
  -- toCIdExpr "DewPoint" dewPoint,
  -- toCIdExpr "Humidity" humidity,
  -- toCIdExpr "AverageHumidity" averageHumidity,
  -- (mkCId "HumidityType", Nothing),
  toCIdExpr "AverageHumidityType" averageHumidityType,
  toCIdExpr "WindSpeed" windSpeed,
  toCIdExpr "WindSpeedType" windSpeedType,
  (mkCId "WindSpeedType", Nothing),
  toCIdExpr "WindBearingType" windBearingType,
  toCIdExpr "CloudCoverType" cloudCoverType,
  toCIdExpr "Pressure" pressure,
  toCIdExpr "Ozone" ozone
  ]

toCIdExpr :: Gf a => String -> Maybe a -> (CId, Maybe Expr)
toCIdExpr s a = (mkCId s, liftM gf a)


