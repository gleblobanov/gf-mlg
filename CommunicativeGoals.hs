module CommunicativeGoals where

import DarkSky
import Weather
import Ontology

getTempPerception :: Ontology -> GSpan
getTempPerception o | temp <= 0  = GFreezing
                    | temp <= 15 = GChilly
                    | temp <= 25 = GWarm
                    | temp <= 35 = GHot
                    | otherwise = GBoiling
                      where (GTemperatureVal (GFloat temp)) = temperature o


temperaturePerception :: Ontology -> GSchema
temperaturePerception o = GNonVolitionalCause (GNuc' n) (GBSat $ GSat s)
  where
    n = GCircumstance (GNuc $ getTempPerception o) (GBSat (GSat $ GInCity (city o)))
    s = GTemperatureIs (temperature o)


summariseDay :: Ontology -> GSchema
summariseDay o = GJoint $ (GJCNuc (GNuc' $ temperaturePerception o)
                       (GJCNuc nApparentTemperature
                        (GJCNuc nLatitude
                         (GJCNuc nLongitude
                          (GJCNuc nPrecipIntensity
                           (GJCNuc nPrecipProbability
                            (GJCNuc nDewPoint
                             (GJCNuc nHumidity
                              (GJCNuc nWindSpeed
                               (GJCNuc nWindBearing
                                (GJCNuc nCloudCover
                                 (GJCNuc nPressure
                                  (GJBNuc nOzone)))))))))))))
  where nTemperature = GNuc $ GTemperatureIs $ temperature o
        nApparentTemperature = GNuc $ GApparentTemperatureIs $ apparentTemperature o
        nLatitude = GNuc $ GLatitudeIs $ latitude o
        nLongitude = GNuc $ GLongitudeIs $ longitude o
        nPrecipIntensity = GNuc $ GPrecipIntensityIs $ precipIntensity o
        nPrecipProbability = GNuc $ GPrecipProbabilityIs $ precipProbability o
        nDewPoint = GNuc $ GDewPointIs $ dewPoint o
        nHumidity = GNuc $ GHumidityIs $ humidity o
        nWindSpeed = GNuc $ GWindSpeedIs $ windSpeed o
        nWindBearing = GNuc $ GWindBearingIs $ windBearing o
        nCloudCover = GNuc $ GCloudCoverIs $ cloudCover o
        nPressure = GNuc $ GPressureIs $ pressure o
        nOzone = GNuc $ GOzoneIs $ ozone o

