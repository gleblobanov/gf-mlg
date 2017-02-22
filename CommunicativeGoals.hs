module CommunicativeGoals where

import Weather
import Ontology as O


sats2satList :: [GSatellite] -> GSatelliteList
sats2satList [s]    = GBSat s
sats2satList (s:ss) = GCSat s (sats2satList ss)


summariseDay :: Ontology -> GSchema
summariseDay o = GBackground infoLocation satellites
  where city = O.city o
        day  = O.day o
        month = O.month o
        year = O.year o
        weekday = O.weekday o
        time = O.time o
        icon = O.icon o
        tempType = O.tempType o
        temperature = O.temperature o
        apparentTemperature = O.apparentTemperature o
        precipType = O.precipType o
        precipIntensity = O.precipIntensity o
        precipProbabilityType = O.precipProbabilityType o
        humidity = O.humidity o
        humidityType = O.humidityType o
        dewPoint = O.dewPoint o
        cloudCoverType = O.cloudCoverType o
        windSpeed = O.windSpeed o
        windSpeedType = O.windSpeedType o
        windBearingType = O.windBearingType o
        pressure = O.pressure o
        ozone = O.ozone o

        infoLocation = GInfoLocation city day month year weekday time icon
        satellites = sats2satList [infoTemperature,
                                   infoPrecipType,
                                   infoPrecipProbability,
                                   infoDewPointHumidity,
                                   infoSky,
                                   infoWindBearing,
                                   infoPressure,
                                   infoOzone]

        infoTemperature = GInfoTemperature tempType temperature apparentTemperature
        infoPrecipType = GInfoPrecipType precipIntensity precipType
        infoPrecipProbability = GInfoPrecipProbaility precipProbabilityType
        infoDewPointHumidity = GInfoDewPointHumidity humidity dewPoint humidityType
        infoSky = GInfoSky cloudCoverType
        infoWindBearing = GInfoWindBearing windSpeed windSpeedType windBearingType
        infoPressure = GInfoPressure pressure
        infoOzone = GInfoOzone ozone

