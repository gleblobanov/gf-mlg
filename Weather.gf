abstract Weather = RST, Ontology ** {

  
  fun


    -- It is a clear day in Gothenburg on Friday, 13 June 2017. 
    InfoLocation    : City -> Time -> Icon -> Span;

    -- It is cold: the temperature is 19 C and it feels like 23 C.
    InfoTemperature : TempType -> Temperature -> ApparentTemperature -> Span ;

    -- There is no precipitation 
    InfoPrecipNo : Span ;


    -- It is raining, and the precipitation intesity is 22 mm/h.
    InfoPrecipType : PrecipIntensity -> PrecipType -> Span ;

    -- The probability of precipitation is low.
    InfoPrecipProbaility : PrecipProbability -> Span ;

    -- It is comfortably humid: relative humidity is 34% and the dew point is 34 C ;
    InfoDewPointHumidity : Humidity -> DewPoint -> HumidityType -> Span ;

    -- The sky is half cloudy.
    InfoSky  : CloudCover -> Span ;

    -- There is no wind.  
    InfoWind : Span ;
    -- There is NNE strong gale (13 km/h).
    InfoWindBearing : WindSpeed -> WindSpeedType -> WindBearing -> Span ;

    -- The sea-level air pressure is 3 millibars.
    InfoPressure : Pressure -> Span ;


    -- The columnar density of total atmospheric ozon is 3.3 DU.
    InfoOzone       : Ozone -> Span ;    

    
}
