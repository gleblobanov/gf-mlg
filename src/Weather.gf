abstract Weather = RST, Messages, Logic ** {

  flags startcat = Schema ;





  -- On Friday, 8 May, 2017, 14:07 in Gothenburg, Sweden (57.7089° N, 11.9746° E), it is sunny.
  fun InfoLocation : Weekday -> Day -> Month -> Year -> Time -> Location -> Latitude -> Longitude -> Icon -> Nucleus ;

  {- Temperature -}

  -- The temperature is 19 C and it feels like 23 C. It is higher than average for this date, which is 17 C.
  fun InfoTemperature : AverageTempType -> AverageTemperature -> Temperature -> ApparentTemperature -> Satellite ;
  def InfoTemperature (AverageTempTypeVal Equal) x1 x2 x3 =  InfoTemperatureShort (AverageTempTypeVal Equal) x1 x2 x3 ;

  -- The temperature is 19 C, which is normal for this date, and it feels like 23 C.
  fun InfoTemperatureShort : AverageTempType -> AverageTemperature -> Temperature -> ApparentTemperature -> Satellite  ;



    -- It is raining, and the precipitation intesity is 22 mm/h.
    InfoPrecipType : PrecipIntensity -> PrecipType -> Satellite ;

    -- The probability of precipitation is 15%.
    InfoPrecipProbability : PrecipProbability -> Satellite ;

    -- Relative humidity is 34% and the dew point is 34 C; it is higher than average, which is 43% and 45 C respectively.
    InfoDewPointHumidity : AverageHumidityType -> AverageHumidity -> Humidity -> AverageDewPoint -> DewPoint -> Satellite ;

    -- The sky is half cloudy.
    InfoSky  : CloudCoverType -> Satellite ;


  {- Wind -}

  -- A strong gale blows in NNE at speed 13 km/h.
  fun InfoWindBearing : WindSpeed -> WindSpeedType -> WindBearingType -> Satellite ;
  def InfoWindBearing x1 Calm x3 = InfoWindCalm x1 Calm x3;

  -- The air is calm.
  fun InfoWindCalm : WindSpeed -> WindSpeedType -> WindBearingType -> Satellite ;




    -- The sea-level air pressure is 3 millibars.
    InfoPressure : Pressure -> Satellite ;

    -- The columnar density of total atmospheric ozon is 3.3 DU.
    InfoOzone       : Ozone -> Satellite ;    



}
