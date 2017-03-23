module CommunicativeGoals where

import Weather
import Ontology as O
import Data.Maybe

sats2satList :: [GSatellite] -> GSatelliteList
sats2satList [s]    = GBSat s
sats2satList (s:ss) = GCSat s (sats2satList ss)


summariseDay :: Ontology -> GSchema
summariseDay o = undefined
-- summariseDay o = GBackground infoLocation satellites
--   where city = O.city o
--         day  = O.day o
--         month = O.month o
--         year = O.year o
--         weekday = O.weekday o
--         time = O.time o
--         icon = O.icon o
--         tempType = O.tempType o
--         temperature = O.temperature o
--         apparentTemperature = O.apparentTemperature o
--         precipType = O.precipType o
--         precipIntensity = O.precipIntensity o
--         precipProbabilityType = O.precipProbabilityType o
--         humidity = O.humidity o
--         humidityType = O.humidityType o
--         dewPoint = O.dewPoint o
--         cloudCoverType = O.cloudCoverType o
--         windSpeed = O.windSpeed o
--         windSpeedType = O.windSpeedType o
--         windBearingType = O.windBearingType o
--         pressure = O.pressure o
--         ozone = O.ozone o

--         infoLocation = if isJust city &&
--                           isJust day &&
--                           isJust month &&
--                           isJust year &&
--                           isJust weekday &&
--                           isJust time &&
--                           isJust icon
--                        then GInfoLocation
--                             (fromJust city)
--                             (fromJust day)
--                             (fromJust month)
--                             (fromJust year)
--                             (fromJust weekday)
--                             (fromJust time)
--                             (fromJust icon)
--                        else GEmptyNucleus
--         satellites = sats2satList [infoTemperature,
--                                    infoPrecipType,
--                                    infoPrecipProbability,
--                                    infoDewPointHumidity,
--                                    infoSky,
--                                    infoWindBearing,
--                                    infoPressure,
--                                    infoOzone]
--         infoTemperature = if isJust tempType &&
--                              isJust temperature &&
--                              isJust apparentTemperature
--                           then GInfoTemperature
--                                (fromJust tempType)
--                                (fromJust temperature)
--                                (fromJust apparentTemperature)
--                           else GEmptySatellite
--         infoPrecipType = if isJust precipIntensity &&
--                             isJust precipType
--                          then GInfoPrecipType
--                               (fromJust precipIntensity)
--                               (fromJust precipType)
--                          else GEmptySatellite
--         infoPrecipProbability = maybe GEmptySatellite GInfoPrecipProbability precipProbabilityType
--         infoDewPointHumidity = if isJust humidity &&
--                                   isJust dewPoint &&
--                                   isJust humidityType
--                                then GInfoDewPointHumidity
--                                     (fromJust humidity)
--                                     (fromJust dewPoint)
--                                     (fromJust humidityType)
--                                else GEmptySatellite
--         infoSky = maybe GEmptySatellite GInfoSky cloudCoverType
--         infoWindBearing = if isJust windSpeed &&
--                              isJust windSpeedType &&
--                              isJust windBearingType
--                           then GInfoWindBearing
--                                (fromJust windSpeed)
--                                (fromJust windSpeedType)
--                                (fromJust windBearingType)
--                           else GEmptySatellite
--         infoPressure = maybe GEmptySatellite GInfoPressure pressure
--         infoOzone = maybe GEmptySatellite GInfoOzone ozone

