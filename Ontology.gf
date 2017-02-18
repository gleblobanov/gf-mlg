abstract Ontology = {


  {- Location & Time & Icon -}

  cat

    City ;
    Latitude ;
    Longitude ;

    Day ;
    Month ;
    Year ;
    Time ;
    Timezone ;

    Icon ;

  fun

    Gothenburg :   City ;

    LatitudeVal  : Float -> Latitude ;
    LongitudeVal : Float -> Longitude ;

    DayVal :       String -> Day ; 
    MonthVal :     String -> Month ;
    YearVal :      String -> Year ;
    TimeVal     :  String -> Time ;
    TimezoneVal :  String -> Timezone ;

    IconClearDay :          Icon ;
    IconClearNight :        Icon ;
    IconRain :              Icon ;
    IconSnow :              Icon ;
    IconSleet :             Icon ;
    IconWind :              Icon ;
    IconFog :               Icon ;
    IconCloudy :            Icon ;
    IconPartlyCloudyDay :   Icon ;
    IconPartlyCloudyNight : Icon ;
    IconNone :              Icon ;

   


  {- Temperature -}

  cat

    Temperature ;
    ApparentTemperature ;
    TempType ;

  fun

    TemperatureVal :         Float -> Temperature ;
    ApparentTemperatureVal : Float -> ApparentTemperature ;

    ExtremelyHot : TempType ;
    VeryHot :      TempType ;
    Hot :          TempType ;
    VeryWarm :     TempType ;
    Warm :         TempType ;
    Mild :         TempType ;
    Cool :         TempType ;
    Cold :         TempType ;
    VeryCold :     TempType ;
    Freezing :     TempType ;

    
  {- Precipitation -}

  cat 

    PrecipIntensity ;
    Icon ;
    PrecipType ;
    PrecipProbability ;
    
  fun

    PrecipIntensityVal :     Float -> PrecipIntensity;
    PrecipProbabilityVal :   Float -> PrecipProbability;

    Rain :       PrecipType ;
    Snow :       PrecipType ;
    Sleet :      PrecipType ;
    PrecipNone : PrecipType ;


    VeryHigh : PrecipProbability ;
    High :     PrecipProbability ;
    Moderate : PrecipProbability ;
    Low :      PrecipProbability ;
    VeryLow :  PrecipProbability ;


  {- Humidity -}

  cat

    DewPoint ;
    Humidity ;
    HumidityType ;
    
  fun

    DewPointVal :            Float -> DewPoint;
    HumidityVal :            Float -> Humidity ;

    SeverelyUncomofortableHumid : HumidityType ;
    ExtremelyUncomfortableHumid : HumidityType ;
    QuiteUncomfortableHumid :     HumidityType ; 
    SomewhatUncomfortableHumid :  HumidityType ;
    ScarcelyUncomfortableHumid :  HumidityType ;
    ComfortableHumid :            HumidityType ; 
    VeryComfortableHumid :        HumidityType ;
    ScarcelyUncomfortableDry :    HumidityType ;
    HumidityNone :                HumidityType;
    
    
  {- Clouds -}

  cat

    CloudCover ;
    CloudCoverType ;

  fun

    CloudCoverVal :          Float -> CloudCover ;

    Clear : CloudCoverType ;
    Scattered : CloudCoverType ;
    Broken : CloudCoverType ;
    Overcast : CloudCoverType ;

    
  {- Wind -}
    
  cat
    
    WindSpeed ;
    WindSpeedType ;
    WindBearing ;
    WindBearingType ;

  fun
    
    WindSpeedVal :           Float -> WindSpeed ;
    WindBearingVal :         Float -> WindBearing ;

    Calm :           WindSpeedType ;
    LightAir :       WindSpeedType ;
    LightBreeze :    WindSpeedType ;
    GengleBreeze :   WindSpeedType ;
    ModerateBreeze : WindSpeedType ;
    FreshBreeze :    WindSpeedType ;
    StrongBreeze :   WindSpeedType ;
    ModerateGale :   WindSpeedType ;
    FreshGale :      WindSpeedType ;
    StrongGale :     WindSpeedType ;
    WholeGale :      WindSpeedType ;
    Storm :          WindSpeedType ;
    Hurricane :      WindSpeedType ;
    
    N :   WindBearingType ;
    NNE : WindBearingType ;
    NE :  WindBearingType ;
    ENE : WindBearingType ;
    E :   WindBearingType ;
    ESE : WindBearingType ;
    SE :  WindBearingType ;
    SSE : WindBearingType ;
    S :   WindBearingType ;
    SSW : WindBearingType ;
    SW :  WindBearingType ;
    WSW : WindBearingType ;
    W :   WindBearingType ;
    WNW : WindBearingType ;
    NW :  WindBearingType ;
    NNW : WindBearingType ;
    

  {- Pressure -}

  cat

    Pressure ;

  fun

    PressureVal :            Float -> Pressure ;

    
    {- Ozone -}

  cat

    Ozone ;

  fun
    
    OzoneVal :               Float -> Ozone ;
 
  }