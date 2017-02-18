abstract Weather = RST, Ontology ** {

  
  fun


    -- Friday, 13 June 2017 is clear and warm in Gothenburg. 
    InfoLocation    : City -> Day -> Month -> Year -> Time -> Icon -> TempType -> Span;

    -- The temperature is 19 C and it feels like 23 C.
    InfoTemperature : Temperature -> ApparentTemperature -> Span ;

    -- There is no precipitation 
    InfoPrecipNo   : PrecipIntensity -> Span ;

    -- It is raining with low precipitation intesity (22 inches per hour).
    InfoPrecipType : PrecipIntensity -> PrecipType -> Span ;

    -- The probability of precipitation is low.
    InfoPrecipProbaility : PrecipProbability -> Span ;

    -- It is comfortable: relative humidity is 34% and the dew point is 34 C ;
    InfoDewPointHumidity : Humidity -> DewPoint -> HumidityType -> Span ;

    -- The sky is half cloudy.
    InfoSky  : CloudCover -> Span ;

    -- There is calm .  
    InfoWind : WindSpeed -> WindSpeedType -> Span ;
    -- There is NNE strong gale (13 km/h).
    InfoWindBearing : WindSpeed -> WindSpeedType -> WindBearing -> Span ;

    -- The sea-level air pressure is 3 millibars.
    InfoPressure : Pressure -> Span ;


    -- The columnar density of total atmospheric ozon is 3.3 DU.
    InfoOzone       : Ozone -> Span ;    

    

   
    
    mkCityTemp : City -> Temperature -> Span ;

     
    
    AppTemp : ApparentTemperature -> Span ;

    InCity : City -> Span ;

    TemperatureIs :         Temperature -> Span ;
    ApparentTemperatureIs : ApparentTemperature -> Span ;
    LatitudeIs :            Latitude -> Span ;
    LongitudeIs :           Longitude -> Span ;
    PrecipIntensityIs :     PrecipIntensity -> Span ;
    PrecipProbabilityIs :   PrecipProbability -> Span ;
    DewPointIs :            DewPoint -> Span ;
    HumidityIs :            Humidity -> Span ;
    WindSpeedIs :           WindSpeed -> Span ;
    WindBearingIs :         WindBearing -> Span ;
    CloudCoverIs :          CloudCover -> Span ;
    PressureIs :            Pressure -> Span ;
    OzoneIs :               Ozone -> Span ;




    WearClothes : TempType -> Span ;

    TempTypeIs : TempType -> Span ;


}
