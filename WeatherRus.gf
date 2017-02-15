concrete WeatherRus of Weather = RSTRus ** open ConstructorsRus, Prelude, ParadigmsRus, SyntaxRus, ResRus in {

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

  CityVal v = mkPN "Калининград" masculine singular inanimate ;

  LatitudeVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  LongitudeVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  TimeVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  TimezoneVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  PrecipIntensityVal v = lin NP {s = \\_ => v.s ++ "мм/ч"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  PrecipProbabilityVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  TemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  ApparentTemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  DewPointVal v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  HumidiyVal v = lin NP {s = \\_ => v.s ++ "%"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  WindSpeedVal v = lin NP {s = \\_ => v.s ++ "м/с"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  WindBearingVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  CloudCoverVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  PressureVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;
  OzoneVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;


  CityTemp city temp
    = mkPhr (mkS (ConstructorsRus.mkAdv in_Prep (SyntaxRus.mkNP city))
          (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det temperature_N) temp))) ;

  InCity city = mkPhr (mkUtt (ConstructorsRus.mkAdv in_Prep (SyntaxRus.mkNP city))) ;

  TemperatureIs v              = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det temperature_N) v)) ;
  ApparentTemperatureIs v      = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN apparent_A temperature_N)) v)) ;
  LatitudeIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det latitude_N) v)) ;
  LongitudeIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det longitude_N) v)) ;
  PrecipIntensityIs v   = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN precipitation_N (SyntaxRus.mkNP intensity_N))) v)) ;
  PrecipProbabilityIs v = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN precipitation_N (SyntaxRus.mkNP probability_N))) v)) ;
  DewPointIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN dew_point_N)) v)) ;
  HumidityIs v           = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det humidity_N) v)) ;
  WindSpeedIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN wind_N (SyntaxRus.mkNP speed_N))) v)) ;
  WindBearingIs v       = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN wind_N (SyntaxRus.mkNP bearing_N))) v)) ;
  CloudCoverIs v        = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN cloud_N (SyntaxRus.mkNP cover_N))) v)) ;
  PressureIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det pressure_N) v)) ;
  OzoneIs v             = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det ozone_N) v)) ;

  Freezing = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP freezing_A))) ;
  Chilly = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP chilly_A))) ;
  Warm = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP warm_A))) ; 
  Hot = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP hot_A))) ;  
  Boiling = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkAP very_AdA hot_A) ))) ;



oper


  apparent_A = mkA "кажущийся" ;
  freezing_A = mkA "холодный" ;
  chilly_A   = mkA "прохладный" ;
  warm_A  = mkA "теплый" ;
  hot_A = mkA "жаркий" ;


  wind_N = mkN "ветер" ;
  temperature_N = mkN "температура" ;
  latitude_N = mkN "широта" ;
  longitude_N = mkN "долгота" ;
  precipitation_N = mkN "осадки" ;
  intensity_N = mkN "интенсивность" ;
  probability_N = mkN "вероятность" ;
  dew_point_N = mkN "точка росы" ;
  humidity_N = mkN "влажность" ;
  speed_N = mkN "скорость" ;
  bearing_N = mkN "уклон" ;
  cover_N = mkN "поверхность" ;
  pressure_N = mkN "давление" ;
  ozone_N = mkN "озон" ;
  cloud_N = mkN "облако" ;









}
