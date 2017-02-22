abstract Weather = RST, Ontology ** {

  flags
    startcat = Schema ;

  fun

    -- It is a clear day in Gothenburg on Friday, 13 June 2017. 
    InfoLocation    : City -> Time -> Icon -> Nucleus;

    -- It is cold: the temperature is 19 C and it feels like 23 C.
    InfoTemperature : TempType -> Temperature -> ApparentTemperature -> Satellite ;

    -- There is no precipitation 
    InfoPrecipNo : Satellite ;


    -- It is raining, and the precipitation intesity is 22 mm/h.
    InfoPrecipType : PrecipIntensity -> PrecipType -> Satellite ;

    -- The probability of precipitation is low.
    InfoPrecipProbaility : PrecipProbability -> Satellite ;

    -- It is comfortably humid: relative humidity is 34% and the dew point is 34 C ;
    InfoDewPointHumidity : Humidity -> DewPoint -> HumidityType -> Satellite ;

    -- The sky is half cloudy.
    InfoSky  : CloudCover -> Satellite ;

    -- There is no wind.  
    InfoWind : Satellite ;
    -- There is NNE strong gale (13 km/h).
    InfoWindBearing : WindSpeed -> WindSpeedType -> WindBearing -> Satellite ;

    -- The sea-level air pressure is 3 millibars.
    InfoPressure : Pressure -> Satellite ;


    -- The columnar density of total atmospheric ozon is 3.3 DU.
    InfoOzone       : Ozone -> Satellite ;    

    
}
