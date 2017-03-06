concrete WeatherRus of Weather = RSTRus, OntologyRus ** open SyntaxRus, WeatherLexiconRus, WeatherExtraRus in {


  lin

    InfoLocation city day month year weekday time icon = mkPhr (mkS (mkAdv empty_Conj (mkAdv v_Acc_Prep (mkNP comma_Conj weekday (mkNP empty_Conj day (mkNP empty_Conj month year)))) (mkAdv empty_Prep time)) (mkS (mkAdv v_Prepos_Prep city) (mkS presentTense simultaneousAnt positivePol (mkCl icon)))) ;



    InfoTemperature tempType temp appTemp =
      mkPhr (colon (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP tempType)))
               (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP temperatura_N) temp))
                                (mkS presentTense simultaneousAnt positivePol (mkCl appTemp (mkAdv po_Dat_Prep (mkNP aPl_Det oshushenie_N))))))) ;
    

    InfoPrecipNo = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkAdv net_Gen_Prep (mkNP aPl_Det osadki_N))))) ; 


    InfoPrecipType precipIntencity precipType
      = mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol precipType)
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN intensivnost_N2 (mkNP aPl_Det osadki_N))) precipIntencity)))) ;


    InfoPrecipProbability precipProbability =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN veroyatnost_N2 (mkNP aPl_Det osadki_N))) precipProbability))  ;


    InfoDewPointHumidity humidity dewPoint humidityType =
      mkPhr (colon (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP vlazhnost_N) (mkVP humidityType)))
               (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN otnositelnij_A vlazhnost_N)) humidity))
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN tochka_N2 (mkNP rosa_N))) dewPoint))))) ;


    InfoSky cloudCoverType = mkPhr (mkS presentTense simultaneousAnt positivePol (mkClNP cloudCoverType))  ;
 


    InfoWindNo = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkAdv net_Gen_Prep (mkNP veter_N))))) ; 

    InfoWindBearing windSpeed windSpeedType windBearingType =
      mkPhr  (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP aSg_Det (mkCN (mkN2CN windSpeedType) (mkNP (mkCN windBearingType napravlenie_N)))) (mkVP (mkVP dut_V) (mkAdv so_Inst_Prep (mkNP (mkCN (mkCN skorost_N) windSpeed)))))) ;


    InfoPressure pressure =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN (mkCN atmosphernij_A davlenie_N) (mkAdv na_PreposVNa_Prep (mkNP (mkCN uroven_N2 (mkNP more_N)))))) pressure)) ;

    InfoOzone ozone =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN koncentraciya_N2 (mkNP (mkCN atmosphernij_A ozon_N)))) ozone)) ;


-- lin

--   CityVal v = mkPN "Калининград" masculine singular inanimate ;

--   LatitudeVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   LongitudeVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   TimeVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   TimezoneVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   PrecipIntensityVal v = lin NP {s = \\_ => v.s ++ "мм/ч"; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   PrecipProbabilityVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   TemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   ApparentTemperatureVal v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   DewPointVal v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   HumidiyVal v = lin NP {s = \\_ => v.s ++ "%"; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   WindSpeedVal v = lin NP {s = \\_ => v.s ++ "м/с"; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   WindBearingVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   CloudCoverVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   PressureVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;
--   OzoneVal v = lin NP {s = \\_ => v.s; n = Sg; p = P3;
--                                g = PNoGen; anim=Inanimate; pron=False} ;


--   CityTemp city temp
--     = mkPhr (mkS (ConstructorsRus.mkAdv in_Prep (SyntaxRus.mkNP city))
--           (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det temperature_N) temp))) ;

--   InCity city = mkPhr (mkUtt (ConstructorsRus.mkAdv in_Prep (SyntaxRus.mkNP city))) ;

--   TemperatureIs v              = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det temperature_N) v)) ;
--   ApparentTemperatureIs v      = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN apparent_A temperature_N)) v)) ;
--   LatitudeIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det latitude_N) v)) ;
--   LongitudeIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det longitude_N) v)) ;
--   PrecipIntensityIs v   = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN precipitation_N (SyntaxRus.mkNP intensity_N))) v)) ;
--   PrecipProbabilityIs v = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN precipitation_N (SyntaxRus.mkNP probability_N))) v)) ;
--   DewPointIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN dew_point_N)) v)) ;
--   HumidityIs v           = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det humidity_N) v)) ;
--   WindSpeedIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN wind_N (SyntaxRus.mkNP speed_N))) v)) ;
--   WindBearingIs v       = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN wind_N (SyntaxRus.mkNP bearing_N))) v)) ;
--   CloudCoverIs v        = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det (mkCN cloud_N (SyntaxRus.mkNP cover_N))) v)) ;
--   PressureIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det pressure_N) v)) ;
--   OzoneIs v             = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det ozone_N) v)) ;

--   Freezing = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP freezing_A))) ;
--   Chilly = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP chilly_A))) ;
--   Warm = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP warm_A))) ; 
--   Hot = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP hot_A))) ;  
--   Boiling = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkAP very_AdA hot_A) ))) ;











}
