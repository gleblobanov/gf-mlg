concrete OntologyEng of Ontology = open WeatherExtraEng, WeatherLexiconEng, SyntaxEng, ParadigmsEng in {


  {- Location & Time & Icon -}

  lincat

   
    City = NP ;
    Latitude = NP ;
    Longitude = NP ;

    Day = NP ;
    Month = NP ;
    Year = NP ;
    Time = NP ;
    Timezone = NP ;

    Icon = VP ;
    
    Weekday = NP ;


  lin

    Gothenburg = mkNP Gothenburg_PN ; 
    
    LatitudeVal v  = mkValueNP v.s;
    LongitudeVal v = mkValueNP v.s;

    DayVal v      = mkValueNP v.s ;
    MonthVal v    = mkValueNP v.s ;
    YearVal v     = mkValueNP v.s ;
    TimeVal v     = mkValueNP v.s ;
    TimezoneVal v = mkValueNP v.s ;

    Monday    = mkNP Monday_N ;
    Tuesday   = mkNP Tuesday_N ;
    Wednesday = mkNP Wednesday_N ;
    Thursday  = mkNP Thursday_N ;
    Friday    = mkNP Friday_N ;
    Saturday  = mkNP Saturday_N ;
    Sunday    = mkNP Sunday_N ;
    
    IconClearDay   = mkVP (mkNP a_Det (mkCN clear_A day_N)) ;
    IconClearNight = mkVP (mkNP a_Det (mkCN clear_A night_N)) ;
    IconRain = mkVP rain_V0 ;
    IconSnow = mkVP snow_V ;
    IconSleet = mkVP sleet_V ;
--    IconWind = mkVP windy_A ;
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

    TemperatureVal v = mkUnitNP v.s "C" ;
    ApparentTemperatureVal v = mkUnitNP v.s "C" ;

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
    PrecipProbability = AP ;

  lin
    
    --PrecipIntensityVal v = lin NP {s = \\_ => v.s ++ "mm/h"; a = AgP3Sg Neutr} ;
    --PrecipProbabilityVal v = lin NP {s = \\_ => v.s ++ "%" ; a = AgP3Sg Neutr} ;


    Rain = mkVP rain_V0 ;
    Snow = mkVP snow_V ;
    Sleet = mkVP sleet_V ;
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

   DewPointVal v = mkUnitNP v.s "C";
   HumidityVal v = mkUnitNP v.s "%";

   SeverelyUncomofortableHumid = mkAP severely_AdA uncomfortable_A ;
   ExtremelyUncomfortableHumid = mkAP extremely_AdA uncomfortable_A ;
   QuiteUncomfortableHumid = mkAP quite_Adv uncomfortable_A ; 
   SomewhatUncomfortableHumid = mkAP somewhat_AdA uncomfortable_A ;
   ScarcelyUncomfortableHumid = mkAP scarcely_AdA uncomfortable_A;
--   ComfortableHumid =  mkAP comfortable_A; 
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
    WindBearingType = AdV ;

  lin
    WindSpeedVal v = mkUnitNP v.s "km/h" ;
    WindBearingVal v = mkValueNP v.s ;

    -- Calm           = mkVP calm_A ;
    LightAir       = mkVP (mkCN light_A air_N) ;
    LightBreeze    = mkVP (mkCN light_A breeze_N) ;
    GentleBreeze   = mkVP (mkCN gentle_A breeze_N);
    ModerateBreeze = mkVP (mkCN moderate_A breeze_N);
    FreshBreeze    = mkVP (mkCN fresh_A breeze_N);
--    StrongBreeze   = mkVP (mkCN strong_A breeze_N);
    ModerateGale   = mkVP (mkCN moderate_A gale_N);
    FreshGale      = mkVP (mkCN fresh_A gale_N);
--    StrongGale     = mkVP (mkCN strong_A gale_N);
--    WholeGale      = mkVP (mkCN whole_A gale_N);
    Storm          = mkVP storm_N;
    Hurricane      = mkVP hurricane_N;

    
    N   = mkAdV "N" ;
    NNE = mkAdV "NNE" ;
    NE  = mkAdV "NE" ;
    ENE = mkAdV "ENE" ;
    E   = mkAdV "E" ;
    ESE = mkAdV "ESE" ;
    SE  = mkAdV "SE" ;
    SSE = mkAdV "SSE" ;
    S   = mkAdV "S" ;
    SSW = mkAdV "SSW" ;
    SW  = mkAdV "SW" ;
    WSW = mkAdV "WSW" ;
    W   = mkAdV "W" ;
    WNW = mkAdV "WNW" ;
    NW  = mkAdV "NW" ;
    NNW = mkAdV "NNW" ;



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
