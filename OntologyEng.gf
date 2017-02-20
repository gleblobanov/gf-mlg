concrete OntologyEng of Ontology = concrete WeatherEng of Weather = RSTEng ** open WeatherLexiconEng, LexiconEng, ConstructorsEng, Prelude, ParadigmsEng, SyntaxEng, ResEng in {


  {- Location & Time & Icon -}

  lincat

   
    City = NP ;
    Latitude = NP ;
    Longitude = NP ;

    Day = NP ;
    Month = NP ;
    Year = NP ;
    Time = NP ;
    DateTime = NP ;
    TimeZone = NP ;

    Icon = VP ;


  lin

    Gothenburg = mkNP Gothenburg_PN ; 
    
    LatitudeVal v  = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
    LongitudeVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;

    DayVal v      = lin NP {s     = \\_ => v.s; a = AgP3Sg Neutr} ;
    MonthVal v    = lin NP {s     = \\_ => v.s; a = AgP3Sg Neutr} ;
    YearVal v     = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
    TimeVal v     = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
    DateTimeVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
    TimezoneVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;

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
    IconWind = mkVP windy_A ;
    IconFog = mkVP foggy_A ;
    IconCloudy = mkVP cloudy_A ;
    IconPartlyCloudyDay = mkVP (mkNP a_Det (mkCN (mkAP partly_AdA cloudy_A) day_N)) ;
    IconPartlyCloudyNight = mkVP (mkNP a_Det (mkCN (mkAP partly_AdA cloudy_A) day_N)) ;
    IconNone = mkVP unkown_A ;

  {- Temperature -}

  lincat

    Temperature = NP ;
    ApparentTemperature = NP ;
    TempKind = AP ;

  lin

    TemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; a = AgP3Sg Neutr} ;
    ApparentTemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; a = AgP3Sg Neutr} ;

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
    
    PrecipIntensityVal v = lin NP {s = \\_ => v.s ++ "mm/h"; a = AgP3Sg Neutr} ;
    PrecipProbabilityVal v = lin NP {s = \\_ => v.s ++ "%" ; a = AgP3Sg Neutr} ;


    Rain = mkVP rain_V0 ;
    Snow = mkVP snow_V ;
    Sleet = mkVP sleet_V ;
    PrecipNone = mkVP unkown_A ;


    VeryHigh = mkAP very_AdA high_A ;
    High = mkAP high_A;
    Moderate = mkAP moderate_A;
    Low = mkAP low_A ;
    VeryLow = mkAP very_AdA low_A ;


  {- Humidity -}

  lincat

    DewPoint = NP ;
    Humidiy = NP ;
    HumitityType = NP ;

  lin

   DewPointVal v = lin NP {s = \\_ => v.s ++ "C"; a = AgP3Sg Neutr} ;
   HumidiyVal v = lin NP {s = \\_ => v.s ++ "%"; a = AgP3Sg Neutr} ;

   
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

    CloudCoverVal v = lin NP {s = \\_ => v.s ++ "%"; a = AgP3Sg Neutr} ;

    Clear = mkAP clear_A ;
    Scattered = mkAP scattered_A ;
    Broken = mkAP broken_A ;
    Overcast = mkAP overcast_A ;

    
  {- Wind -}
   
  lincat

  
    WindSpeed = NP ;
    WindSpeedType = VP ;
    WindBearing = NP ;
    WindBearingType = NP ;

    WindSpeedVal v = lin NP {s = \\_ => v.s ++ "km/h"; a = AgP3Sg Neutr} ;
    WindBearingVal v = lin NP {s = \\_ => v.s ++ ""; a = AgP3Sg Neutr} ;

    Calm           = mkVP calmA ;
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

    PressureVal v = lin NP {s = \\_ => v.s ++ "mbar"; a = AgP3Sg Neutr} ;
  
  
 {- Ozone -}

  lincat

    Ozone = NP ;

  lin

    OzoneVal v = lin NP {s = \\_ => v.s ++ "DU"; a = AgP3Sg Neutr} ;

}