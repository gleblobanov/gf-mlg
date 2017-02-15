concrete WeatherEng of Weather = RSTEng ** open LexiconEng, ConstructorsEng, Prelude, ParadigmsEng, SyntaxEng, ResEng in {

lincat
    Latitude = NP ;
    Longitude = NP ;
    City = PN ;

    Time = NP ;
    Timezone = NP;

    PrecipIntensity = NP ;
    PrecipProbability = NP ;
    Temperature = NP ;
    ApparentTemperature = NP ;
    DewPoint = NP ;
    Humidiy = NP ;
    WindSpeed = NP ;
    WindBearing = NP ;
    CloudCover = NP ;
    Pressure = NP ;
    Ozone = NP ;


lin

  CityVal v = mkPN "Gothenburg" ;
  LatitudeVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
  LongitudeVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;

  TimeVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
  TimezoneVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;

  PrecipIntensityVal v = lin NP {s = \\_ => v.s ++ "mm/h"; a = AgP3Sg Neutr} ;
  PrecipProbabilityVal v = lin NP {s = \\_ => v.s; a = AgP3Sg Neutr} ;
  TemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; a = AgP3Sg Neutr} ;
  ApparentTemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; a = AgP3Sg Neutr} ;
  DewPointVal v = lin NP {s = \\_ => v.s ++ "C"; a = AgP3Sg Neutr} ;
  HumidiyVal v = lin NP {s = \\_ => v.s ++ "%"; a = AgP3Sg Neutr} ;
  WindSpeedVal v = lin NP {s = \\_ => v.s ++ ""; a = AgP3Sg Neutr} ;
  WindBearingVal v = lin NP {s = \\_ => v.s ++ ""; a = AgP3Sg Neutr} ;
  CloudCoverVal v = lin NP {s = \\_ => v.s ++ ""; a = AgP3Sg Neutr} ;
  PressureVal v = lin NP {s = \\_ => v.s ++ ""; a = AgP3Sg Neutr} ;
  OzoneVal v = lin NP {s = \\_ => v.s ++ ""; a = AgP3Sg Neutr} ;




  CityTemp city temp
    = mkPhr (mkS (ConstructorsEng.mkAdv in_Prep (SyntaxEng.mkNP city))
          (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) temp))) ;


  InCity city = mkPhr (mkUtt (ConstructorsEng.mkAdv in_Prep (SyntaxEng.mkNP city))) ;

  TemperatureIs v              = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) v)) ;
  ApparentTemperatureIs v      = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN apparent_A temperature_N)) v)) ;
  LatitudeIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det latitude_N) v)) ;
  LongitudeIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det longitude_N) v)) ;
  PrecipIntensityIs v   = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN precipitation_N (SyntaxEng.mkNP intensity_N))) v)) ;
  PrecipProbabilityIs v = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN precipitation_N (SyntaxEng.mkNP probability_N))) v)) ;
  DewPointIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN dew_point_N)) v)) ;
  HumidityIs v           = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det humidity_N) v)) ;
  WindSpeedIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN wind_N (SyntaxEng.mkNP speed_N))) v)) ;
  WindBearingIs v       = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN wind_N (SyntaxEng.mkNP bearing_N))) v)) ;
  CloudCoverIs v        = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN cloud_N (SyntaxEng.mkNP cover_N))) v)) ;
  PressureIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det pressure_N) v)) ;
  OzoneIs v             = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det ozone_N) v)) ;

  Freezing = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP freezing_A))) ;
  Chilly = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP chilly_A))) ;
  Warm = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP warm_A))) ; 
  Hot = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP hot_A))) ;  
  Boiling = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP boiling_A))) ;




oper

  apparent_A = mkA "apparent" ;
  freezing_A = mkA "freezing" ;
  chilly_A   = mkA "chilly" ;
  boiling_A  = mkA "boiling" ;
  
  temperature_N = mkN "temperature" ;
  latitude_N = mkN "latitude" ;
  longitude_N = mkN "longitude" ;
  precipitation_N = mkN "precipitation" ;
  intensity_N = mkN "intensity" ;
  probability_N = mkN "probability" ;
  dew_point_N = mkN "dew point" ;
  humidity_N = mkN "humidity" ;
  speed_N = mkN "speed" ;
  bearing_N = mkN "bearing" ;
  cover_N = mkN "cover" ;
  pressure_N = mkN "pressue" ;
  ozone_N = mkN "ozone" ;
}
