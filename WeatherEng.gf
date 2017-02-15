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
  LatitudeVal v = lin NP {s = \\_ => v.s ++ "lat"; a = AgP3Sg Neutr} ;
  LongitudeVal v = lin NP {s = \\_ => v.s ++ "long"; a = AgP3Sg Neutr} ;

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
    = mkPhr (mkS (ConstructorsEng.mkAdv (mkPrep "in") (SyntaxEng.mkNP city))
          (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) temp))) ;


  InCity city = mkPhr (mkUtt (ConstructorsEng.mkAdv (mkPrep "in") (SyntaxEng.mkNP city))) ;

  TempIs temp = mkPhr ( mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) temp)) ;

  Freezing = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkA "freezing")))) ;
  Chilly = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkA "chilly")))) ;
  Warm = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP warm_A))) ; 
  Hot = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP hot_A))) ;  
  Boiling = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkA "boiling")))) ;




oper
  temperature_N = mkN "temperature" ;

}
