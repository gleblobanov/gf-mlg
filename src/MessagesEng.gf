concrete MessagesEng of Messages = open WeatherExtraEng, WeatherLexiconEng, SyntaxEng, ParadigmsEng in {


  {- Location & Time & Icon -}

  lincat

    Location  = NP ;
    City      = NP ;
    Country   = NP ;
    Latitude  = NP ;
    Longitude = NP ;

    Day      = NP ;
    Weekday  = NP ;
    Month    = NP ;
    Year     = NP ;
    Time     = NP ;
    Timezone = NP ;

    Icon = VP ;
    


  lin

    LocationVal v = mkValueNP v.s ;
    CityVal v = mkValueNP v.s ;
    CountryVal v = mkValueNP v.s ;
    
    LatitudeVal v  = mkValueNP v.s;
    LongitudeVal v = mkValueNP v.s;

    DayVal v      = mkValueNP v.s ;
    YearVal v     = mkValueNP v.s ;
    TimeVal v     = mkValueNP v.s ;
    TimezoneVal v = mkValueNP v.s ;

    Monday    = mkNP Monday_PN ;
    Tuesday   = mkNP Tuesday_PN ;
    Wednesday = mkNP Wednesday_PN ;
    Thursday  = mkNP Thursday_PN ;
    Friday    = mkNP Friday_PN ;
    Saturday  = mkNP Saturday_PN ;
    Sunday    = mkNP Sunday_PN ;

    January   = mkNP January_PN ;
    February  = mkNP February_PN ;
    March     = mkNP March_PN ;
    April     = mkNP April_PN ;
    May       = mkNP May_PN ;
    June      = mkNP June_PN ;
    July      = mkNP July_PN ;
    August    = mkNP August_PN ;
    September = mkNP September_PN ;
    October   = mkNP October_PN ;
    November  = mkNP November_PN ;
    December  = mkNP December_PN ;
    MonthNone = mkNP empty_N ;
    
    IconClearDay   = mkVP (mkNP a_Det (mkCN clear_A day_N)) ;
    IconClearNight = mkVP (mkNP a_Det (mkCN clear_A night_N)) ;
    IconRain = progressiveVP (mkVP rain_V0) ;
    IconSnow = progressiveVP (mkVP snow_V) ;
    IconSleet = progressiveVP (mkVP sleet_V) ;
    IconWind = mkVP windy_A ;
    IconFog = mkVP foggy_A ;
    IconCloudy = mkVP cloudy_A ;
    IconPartlyCloudyDay = mkVP (mkNP a_Det (mkCN (mkAP partly_AdA cloudy_A) day_N)) ;
    IconPartlyCloudyNight = mkVP (mkNP a_Det (mkCN (mkAP partly_AdA cloudy_A) day_N)) ;
    IconNone = mkVP unknown_A ;

  {- Temperature -}

  lincat

    Temperature = NP ;
    ApparentTemperature = NP ;
    AverageTemperature = NP ;
    AverageTempType = Avrg ;
    TempType = AP ;

    
  lin

    TemperatureVal v = mkUnitNP v.s "\176C" ;
    ApparentTemperatureVal v = mkUnitNP v.s "\176C" ;
    AverageTemperatureVal v  = mkUnitNP v.s "\176C" ;
    AverageTempTypeVal v = v ;

    ExtremelyHot = mkAP extremely_AdA hot_A ;
    VeryHot = mkAP very_AdA hot_A ;
    Hot = mkAP hot_A ;
    VeryWarm = mkAP very_AdA warm_A ;
    Warm = mkAP warm_A ;
    Mild = mkAP mild_A ;
    Cool = mkAP cool_A ;
    Cold =  mkAP cold_A ;
    VeryCold = mkAP very_AdA cold_A ;
    Freezing = mkAP freezing_A ;


  {- Precipitation -}

  lincat
    
    PrecipIntensity = NP ;
    PrecipType = VP ;
    PrecipProbability = NP ;
    PrecipProbabilityType = AP ;

  lin
    
    PrecipIntensityVal v = mkUnitNP v.s "mm/h";
    PrecipProbabilityVal v = mkUnitNP v.s "%";


    Rain = progressiveVP (mkVP rain_V0) ;
    Snow = progressiveVP (mkVP snow_V) ;
    Sleet = (mkVP sleet_V) ;
    PrecipNone = mkVP unknown_A ;


    VeryHigh = mkAP very_AdA high_A ;
    High = mkAP high_A;
    Moderate = mkAP moderate_A;
    Low = mkAP low_A ;
    VeryLow = mkAP very_AdA low_A ;


  {- Humidity -}

  lincat

    DewPoint = NP ;
    AverageDewPoint = NP ;
    Humidity = NP ;
    AverageHumidity = NP ;
    AverageHumidityType = Avrg ;

  lin

   DewPointVal v = mkUnitNP v.s "\176C";
   AverageDewPointVal v  = mkUnitNP v.s "\176C" ;
   HumidityVal v = mkUnitNP v.s "%";
   AverageHumidityVal v = mkUnitNP v.s "%";
   AverageHumidityTypeVal v  = v ;

   -- SeverelyUncomofortableHumid = mkAP severely_AdA uncomfortable_A ;
   -- ExtremelyUncomfortableHumid = mkAP extremely_AdA uncomfortable_A ;
   -- QuiteUncomfortableHumid = mkAP quite_Adv uncomfortable_A ; 
   -- SomewhatUncomfortableHumid = mkAP somewhat_AdA uncomfortable_A ;
   -- ScarcelyUncomfortableHumid = mkAP scarcely_AdA uncomfortable_A;
   -- ComfortableHumid =  mkAP comfortable_A; 
   -- VeryComfortableHumid = mkAP very_AdA uncomfortable_A;
   -- ScarcelyUncomfortableDry = mkAP quite_Adv uncomfortable_A;
   -- HumidityNone = mkAP quite_Adv uncomfortable_A;
    

   {- Clouds -}

  lincat

    CloudCover = NP ;
    CloudCoverType = AP ;

  lin 

    CloudCoverVal v = mkUnitNP v.s "%";

    Clear = mkAP clear_A ;
    Scattered = mkAP scattered_A ;
    Broken = mkAP broken_A ;
    Overcast = mkAP overcast_A ;

    
  {- Wind -}
   
  lincat

  
    WindSpeed = Adv ;
    WindSpeedType = NP ;
    WindBearing = NP ;
    WindBearingType = Adv ;

  lin
    WindSpeedVal v = mkUnitAdv "at " (mkUnitAdv v.s "km/h").s ;
    WindBearingVal v = mkValueNP v.s ;

    Calm           = mkNP the_Det (mkCN calm_A air_N) ;
    LightAir       = mkNP a_Det (mkCN light_A air_N) ;
    LightBreeze    = mkNP a_Det (mkCN light_A breeze_N) ;
    GentleBreeze   = mkNP a_Det (mkCN gentle_A breeze_N);
    ModerateBreeze = mkNP a_Det (mkCN moderate_A breeze_N);
    FreshBreeze    = mkNP a_Det (mkCN fresh_A breeze_N);
    StrongBreeze   = mkNP a_Det (mkCN strong_A breeze_N);
    ModerateGale   = mkNP a_Det (mkCN moderate_A gale_N);
    FreshGale      = mkNP a_Det (mkCN fresh_A gale_N);
    StrongGale     = mkNP a_Det (mkCN strong_A gale_N);
    WholeGale      = mkNP a_Det (mkCN whole_A gale_N);
    Storm          = mkNP a_Det storm_N;
    Hurricane      = mkNP a_Det hurricane_N;

    
    WindN   = mkAdv "in N" ;
    WindNNE = mkAdv "in NNE" ;
    WindNE  = mkAdv "in NE" ;
    WindENE = mkAdv "in ENE" ;
    WindE   = mkAdv "in E" ;
    WindESE = mkAdv "in ESE" ;
    WindSE  = mkAdv "in SE" ;
    WindSSE = mkAdv "in SSE" ;
    WindS   = mkAdv "in S" ;
    WindSSW = mkAdv "in SSW" ;
    WindSW  = mkAdv "in SW" ;
    WindWSW = mkAdv "in WSW" ;
    WindW   = mkAdv "in W" ;
    WindWNW = mkAdv "in WNW" ;
    WindNW  = mkAdv "in NW" ;
    WindNNW = mkAdv "in NNW" ;



  {- Pressure -}

  lincat   

    Pressure = NP ;

  lin
    PressureVal v = mkUnitNP v.s "mbar";

  
 {- Ozone -}

  lincat

    Ozone = NP ;

  lin

    OzoneVal v = mkUnitNP v.s "DU";



  {- Averages -}

  param Avrg = avrgRL
             | avrgSL
             | avrgL
             | avrgE
             | avrgSG
             | avrgG
             | avrgRG ;


  lincat Average = Avrg ;

  lin 
    RemarkablyLess    = avrgRL ;
    SlightlyLess      = avrgSL ;
    Less              = avrgL ;
    Equal             = avrgE ;
    SlightlyGreater   = avrgSG ;
    Greater           = avrgG ;
    RemarkablyGreater = avrgRG ;


  oper mkAvrg : NP -> Avrg -> AP
         = \ np, avrg -> case avrg of {
           avrgRL => mkAP much_AdA (mkAP low_A np) ;       -- much lower
           avrgL  => mkAP low_A np ;                       -- lower
           avrgSL => mkAP slightly_AdA (mkAP low_A np)  ;  -- slightly lower
           avrgE  => mkAP equal_to_A2 np ;                 -- equal to
           avrgSG => mkAP slightly_AdA (mkAP high_A np)  ; -- slightly higher
           avrgG  => mkAP high_A np  ;                     -- higher
           avrgRG  => mkAP much_AdA (mkAP high_A np) } ;   -- much higher

}
