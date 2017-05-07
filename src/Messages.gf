abstract Messages = {


  {- Location & Time & Icon -}

  cat

    City ;
    Latitude ;
    Longitude ;

    Day ;
    Weekday ;
    Month ;
    Year ;
    Time ;
    Timezone ;

    Icon ;

  fun

    Osaka      : City ;
    Gothenburg : City ;

    LatitudeVal  : Float -> Latitude ;
    LongitudeVal : Float -> Longitude ;

    DayVal :       String -> Day ; 
    YearVal :      String -> Year ;
    TimeVal     :  String -> Time ;
    TimezoneVal :  String -> Timezone ;

    Monday :    Weekday ;
    Tuesday :   Weekday ;
    Wednesday : Weekday ;
    Thursday :  Weekday ;
    Friday :    Weekday ;
    Saturday :  Weekday ;
    Sunday :    Weekday ;
    
    January :   Month ;
    February :  Month ;
    March :     Month ;
    April :     Month ;
    May :       Month ;
    June :      Month ;
    July :      Month ;
    August :    Month ;
    September : Month ;
    October :   Month ;
    November :  Month ;
    December :  Month ;
    MonthNone : Month ;

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
    AverageTemperature ;
    ApparentTemperature ;
    TempType ;

  fun

    TemperatureVal :         Float -> Temperature ;
    AverageTemperatureVal :  Float -> AverageTemperature ;
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
    AveragePrecipIntensity ;
    PrecipType ;
    PrecipProbability ;
    PrecipProbabilityType ;
    
  fun

    PrecipIntensityVal :     Float -> PrecipIntensity ;
    AveragePrecipIntensityVal : Float -> AveragePrecipIntensity ;
    PrecipProbabilityVal :   Float -> PrecipProbability ;

    Rain :       PrecipType ;
    Snow :       PrecipType ;
    Sleet :      PrecipType ;
    PrecipNone : PrecipType ;


    VeryHigh : PrecipProbabilityType ;
    High :     PrecipProbabilityType ;
    Moderate : PrecipProbabilityType ;
    Low :      PrecipProbabilityType ;
    VeryLow :  PrecipProbabilityType ;


  {- Humidity -}

  cat

    DewPoint ;
    Humidity ;
    AverageHumidity ;
    HumidityType ;

  fun

    DewPointVal :            Float -> DewPoint ;
    HumidityVal :            Float -> Humidity ;
    AverageHumidityVal :     Float -> AverageHumidity ;

    SeverelyUncomofortableHumid : HumidityType ;
    ExtremelyUncomfortableHumid : HumidityType ;
    QuiteUncomfortableHumid :     HumidityType ; 
    SomewhatUncomfortableHumid :  HumidityType ;
    ScarcelyUncomfortableHumid :  HumidityType ;
    ComfortableHumid :            HumidityType ; 
    VeryComfortableHumid :        HumidityType ;
    ScarcelyUncomfortableDry :    HumidityType ;
    HumidityNone :                HumidityType ;
    
    
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
    GentleBreeze :   WindSpeedType ;
    ModerateBreeze : WindSpeedType ;
    FreshBreeze :    WindSpeedType ;
    StrongBreeze :   WindSpeedType ;
    ModerateGale :   WindSpeedType ;
    FreshGale :      WindSpeedType ;
    StrongGale :     WindSpeedType ;
    WholeGale :      WindSpeedType ;
    Storm :          WindSpeedType ;
    Hurricane :      WindSpeedType ;
    
    WindN :   WindBearingType ;
    WindNNE : WindBearingType ;
    WindNE :  WindBearingType ;
    WindENE : WindBearingType ;
    WindE :   WindBearingType ;
    WindESE : WindBearingType ;
    WindSE :  WindBearingType ;
    WindSSE : WindBearingType ;
    WindS :   WindBearingType ;
    WindSSW : WindBearingType ;
    WindSW :  WindBearingType ;
    WindWSW : WindBearingType ;
    WindW :   WindBearingType ;
    WindWNW : WindBearingType ;
    WindNW :  WindBearingType ;
    WindNNW : WindBearingType ;
    

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
 

    {- Averages -}

  cat Average ; 

  data RemarkablyLess : Average ;
       SlightlyLess : Average ;
       Less : Average ;
       Equal : Average ;
       SlightlyGreater : Average ;
       Greater : Average ;
       RemarkablyGreater : Average ;

  -- data Average = RemarkablyLess
  --              | SlightlyLess
  --              | Less
  --              | Equal
  --              | SlightlyGreater
  --              | Greater
  --              | RemarkablyGreater ;


  }