abstract Weather = RST ** {

  cat
    Latitude ;
    Longitude ;
    City ;

    Time ;
    Timezone ;

    PrecipIntensity ;
    PrecipProbability ;
    Temperature ;
    ApparentTemperature ;
    DewPoint ;
    Humidiy ;
    WindSpeed ;
    WindBearing ;
    CloudCover ;
    Pressure ;
    Ozone ;

  fun CityVal : String -> City ;
      LatitudeVal : Float -> Latitude ;
      LongitudeVal : Float -> Longitude ;


      TimeVal : String -> Time ;
      TimezoneVal : String -> Timezone ;

      PrecipIntensityVal : Float -> PrecipIntensity;
      PrecipProbabilityVal : Float -> PrecipProbability;
      TemperatureVal : Float -> Temperature ;
      ApparentTemperatureVal : Float -> ApparentTemperature ;
      DewPointVal : Float -> DewPoint;
      HumidiyVal : Float -> Humidiy ;
      WindSpeedVal : Float -> WindSpeed ;
      WindBearingVal : Float -> WindBearing ;
      CloudCoverVal : Float -> CloudCover ;
      PressureVal : Float -> Pressure ;
      OzoneVal : Float -> Ozone ;


  fun CityTemp : City -> Temperature -> Span ;

      InCity : City -> Span ;

      TempIs : Temperature -> Span ;

      Freezing : Span ;
      Chilly : Span ;
      Warm : Span ; 
      Hot : Span ;
      Boiling : Span ;

}
