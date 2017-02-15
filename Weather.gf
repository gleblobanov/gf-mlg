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

  fun CityVal :      String -> City ;
      LatitudeVal :  Float -> Latitude ;
      LongitudeVal : Float -> Longitude ;

      TimeVal :     String -> Time ;
      TimezoneVal : String -> Timezone ;

      PrecipIntensityVal :     Float -> PrecipIntensity;
      PrecipProbabilityVal :   Float -> PrecipProbability;
      TemperatureVal :         Float -> Temperature ;
      ApparentTemperatureVal : Float -> ApparentTemperature ;
      DewPointVal :            Float -> DewPoint;
      HumidiyVal :             Float -> Humidiy ;
      WindSpeedVal :           Float -> WindSpeed ;
      WindBearingVal :         Float -> WindBearing ;
      CloudCoverVal :          Float -> CloudCover ;
      PressureVal :            Float -> Pressure ;
      OzoneVal :               Float -> Ozone ;





      CityTemp : City -> Temperature -> Span ;

      InCity : City -> Span ;

      TemperatureIs :         Temperature -> Span ;
      ApparentTemperatureIs : ApparentTemperature -> Span ;
      LatitudeIs :            Latitude -> Span ;
      LongitudeIs :           Longitude -> Span ;
      PrecipIntensityIs :     PrecipIntensity -> Span ;
      PrecipProbabilityIs :   PrecipProbability -> Span ;
      DewPointIs :            DewPoint -> Span ;
      HumidityIs :             Humidiy -> Span ;
      WindSpeedIs :           WindSpeed -> Span ;
      WindBearingIs :         WindBearing -> Span ;
      CloudCoverIs :          CloudCover -> Span ;
      PressureIs :            Pressure -> Span ;
      OzoneIs :               Ozone -> Span ;



      Freezing : Span ;
      Chilly :   Span ;
      Warm :     Span ; 
      Hot :      Span ;
      Boiling :  Span ;

}
