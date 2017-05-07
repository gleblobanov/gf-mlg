abstract Weather = RST, Messages, Logic ** {

  flags startcat = DocumentPlan ;

 {- Goal -}

  fun WeatherReport : Schema Background Nucleus Head -> DocumentPlan ;




  -- It is a clear day in Gothenburg on Friday, 13 June 2017. 
  fun InfoLocation : City -> Day -> Month -> Year -> Weekday -> Time -> Icon -> Schema Leaf Nucleus Head ;


  {- Temperature -}


  fun isEqual : Average -> Type ;
  def isEqual Equal = True ;

  fun notEqual : Average -> Type ;
  def notEqual RemarkablyLess = True ;
      notEqual SlightlyLess = True ;
      notEqual Less = True ; 
      notEqual SlightlyGreater = True ;
      notEqual Greater = True ; 
      notEqual RemarkablyGreater  = True ;
      notEqual Equal = False ;


  -- The temperature is 19 C, which is normal for this date, and it feels like 23 C.
  fun InfoTemperature : (span : Span) -> (a : Average) -> isEqual a -> Temperature -> ApparentTemperature -> Schema Leaf span Tail ;


  -- The temperature is 19 C and it feels like 23 C. It is higher than average for this date, which is 17 C.
  fun InfoTemperatureAverage : (span : Span) -> (a : Average) -> notEqual a  -> AverageTemperature -> Temperature -> ApparentTemperature -> Schema Interpretation span Tail ;
  def InfoTemperatureAverage s x1 _ x2 x3 x4 = mkInterpretation Leaf Leaf s Tail (NucTemperatureAndApparentTemperature x3 x4) (SatAverageTemperature x1 x2) ;

  fun NucTemperatureAndApparentTemperature : Temperature -> ApparentTemperature -> Schema Leaf Nucleus Tail;
  fun SatAverageTemperature : Average -> AverageTemperature -> Schema Leaf Satellite Tail;




    -- It is raining, and the precipitation intesity is 22 mm/h.
    -- InfoPrecipType : AveragePrecipType -> AveragePrecipIntencity -> PrecipIntensity -> Satellite ;

    -- The probability of precipitation is low.
    -- InfoPrecipProbability : PrecipProbabilityType -> Satellite ;

    -- It is comfortably humid: relative humidity is 34% and the dew point is 34 C ;
    -- InfoDewPointHumidity : AverageHumidityType -> AverageHumidity -> Humidity -> DewPoint -> HumidityType -> Satellite ;

    -- The sky is half cloudy.
    -- InfoSky  : CloudCoverType -> Satellite ;

    -- There is NNE strong gale (13 km/h).
    -- InfoWindBearing : WindSpeed -> WindSpeedType -> WindBearingType -> Satellite ;

    -- The sea-level air pressure is 3 millibars.
    -- InfoPressure : Pressure -> Satellite ;

    -- The columnar density of total atmospheric ozon is 3.3 DU.
    -- InfoOzone       : Ozone -> Satellite ;    


}
