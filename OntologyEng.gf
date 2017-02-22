concrete OntologyEng of Ontology = open WeatherExtraEng, WeatherLexiconEng, SyntaxEng, ParadigmsEng in {


  {- Location & Time & Icon -}

  lincat

   
    City = NP ;
    Latitude = NP ;
    Longitude = NP ;

    Day = NP ;
    Weekday = NP ;
    Month = NP ;
    Year = NP ;
    Time = NP ;
    Timezone = NP ;

    Icon = VP ;
    


  lin

    Gothenburg = mkNP Gothenburg_PN ; 
    
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
    TempType = AP ;

  lin

    TemperatureVal v = mkUnitNP v.s "\176C" ;
    ApparentTemperatureVal v = mkUnitNP v.s "\176C" ;

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
    Humidity = NP ;
    HumidityType = AP ;

  lin

   DewPointVal v = mkUnitNP v.s "\176C";
   HumidityVal v = mkUnitNP v.s "%";

   SeverelyUncomofortableHumid = mkAP severely_AdA uncomfortable_A ;
   ExtremelyUncomfortableHumid = mkAP extremely_AdA uncomfortable_A ;
   QuiteUncomfortableHumid = mkAP quite_Adv uncomfortable_A ; 
   SomewhatUncomfortableHumid = mkAP somewhat_AdA uncomfortable_A ;
   ScarcelyUncomfortableHumid = mkAP scarcely_AdA uncomfortable_A;
   ComfortableHumid =  mkAP comfortable_A; 
   VeryComfortableHumid = mkAP very_AdA uncomfortable_A;
   ScarcelyUncomfortableDry = mkAP quite_Adv uncomfortable_A;
   HumidityNone = mkAP quite_Adv uncomfortable_A;
    

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

  
    WindSpeed = NP ;
    WindSpeedType = VP ;
    WindBearing = NP ;
    WindBearingType = Adv ;

  lin
    WindSpeedVal v = mkUnitNP v.s "km/h" ;
    WindBearingVal v = mkValueNP v.s ;

    Calm           = mkVP calm_A ;
    LightAir       = mkVP (mkCN light_A air_N) ;
    LightBreeze    = mkVP (mkCN light_A breeze_N) ;
    GentleBreeze   = mkVP (mkCN gentle_A breeze_N);
    ModerateBreeze = mkVP (mkCN moderate_A breeze_N);
    FreshBreeze    = mkVP (mkCN fresh_A breeze_N);
    StrongBreeze   = mkVP (mkCN strong_A breeze_N);
    ModerateGale   = mkVP (mkCN moderate_A gale_N);
    FreshGale      = mkVP (mkCN fresh_A gale_N);
    StrongGale     = mkVP (mkCN strong_A gale_N);
    WholeGale      = mkVP (mkCN whole_A gale_N);
    Storm          = mkVP storm_N;
    Hurricane      = mkVP hurricane_N;

    
    N   = mkAdv "N" ;
    NNE = mkAdv "NNE" ;
    NE  = mkAdv "NE" ;
    ENE = mkAdv "ENE" ;
    E   = mkAdv "E" ;
    ESE = mkAdv "ESE" ;
    SE  = mkAdv "SE" ;
    SSE = mkAdv "SSE" ;
    S   = mkAdv "S" ;
    SSW = mkAdv "SSW" ;
    SW  = mkAdv "SW" ;
    WSW = mkAdv "WSW" ;
    W   = mkAdv "W" ;
    WNW = mkAdv "WNW" ;
    NW  = mkAdv "NW" ;
    NNW = mkAdv "NNW" ;



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

}
