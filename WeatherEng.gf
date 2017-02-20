concrete WeatherEng of Weather = RSTEng ** open WeatherExtraEng, LexiconEng, ConstructorsEng, Prelude, ParadigmsEng, SyntaxEng, ResEng in {


  lin

    InfoLocation city weekday datetime icon =
      mkPhr (mkS (mkAdv on_Prep time) (mkS (mkAdv in_Prep city) (mkS presentTense simultaneousAnt positivePol (mkCl icon)))) ;
      

    InfoTemperature tempType temp appTemp =
      mkPhr (colon (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP tempType)))
               (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) temp))
                                (mkS presentTense simultaneousAnt positivePol (mkCl feel_like_V2 appTemp))))) ;
    

    InfoPrecipNo = mkPhr (mkS (mkS presentTense simultaneousAnt negativePol (mkCl (mkVP (mkNP precipitation_N))))) ; 


    InfoPrecipType precipIntencity precipType
      = mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl precipType)) 
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN preciptitation_N (mkNP intencity_N))) precipIntencity))))) ;


    InfoPrecipProbaility precipProbability = mkPhr ()  ;

    -- It is comfortably humid: relative humidity is 34% and the dew point is 34 C ;
    InfoDewPointHumidity : Humidity -> DewPoint -> HumidityType -> Span ;

    -- The sky is half cloudy.
    InfoSky  : CloudCover -> Span ;

    -- There is calm .  
    InfoWind : WindSpeed -> WindSpeedType -> Span ;
    -- There is NNE strong gale (13 km/h).
    InfoWindBearing : WindSpeed -> WindSpeedType -> WindBearing -> Span ;

    -- The sea-level air pressure is 3 millibars.
    InfoPressure : Pressure -> Span ;


    -- The columnar density of total atmospheric ozon is 3.3 DU.
    InfoOzone       : Ozone -> Span ;    




  -- CityTemp city temp
  --   = mkPhr (mkS (ConstructorsEng.mkAdv in_Prep (SyntaxEng.mkNP city))
  --         (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) temp))) ;



  
  -- InCity city = mkPhr (mkUtt (ConstructorsEng.mkAdv in_Prep (SyntaxEng.mkNP city))) ;

  -- TemperatureIs v              = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det temperature_N) v)) ;
  -- ApparentTemperatureIs v      = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN apparent_A temperature_N)) v)) ;
  -- LatitudeIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det latitude_N) v)) ;
  -- LongitudeIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det longitude_N) v)) ;
  -- PrecipIntensityIs v   = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN precipitation_N (SyntaxEng.mkNP intensity_N))) v)) ;
  -- PrecipProbabilityIs v = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN precipitation_N (SyntaxEng.mkNP probability_N))) v)) ;
  -- DewPointIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN dew_point_N)) v)) ;
  -- HumidityIs v           = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det humidity_N) v)) ;
  -- WindSpeedIs v         = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN wind_N (SyntaxEng.mkNP speed_N))) v)) ;
  -- WindBearingIs v       = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN wind_N (SyntaxEng.mkNP bearing_N))) v)) ;
  -- CloudCoverIs v        = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det (mkCN cloud_N (SyntaxEng.mkNP cover_N))) v)) ;
  -- PressureIs v          = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det pressure_N) v)) ;
  -- OzoneIs v             = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxEng.mkNP theSg_Det ozone_N) v)) ;




}
