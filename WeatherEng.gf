concrete WeatherEng of Weather = RSTEng, OntologyEng ** open WeatherLexiconEng, WeatherExtraEng, SyntaxEng in {


  lin

    InfoLocation city day month year weekday time icon = mkPhr (mkS (mkAdv empty_Conj (mkAdv on_Prep (mkNP comma_Conj weekday (mkNP empty_Conj day (mkNP empty_Conj month year)))) (mkAdv at_Prep time)) (mkS (mkAdv in_Prep city) (mkS presentTense simultaneousAnt positivePol (mkCl icon)))) ;


    InfoTemperature tempType temp appTemp =
      mkPhr (colon (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP tempType)))
               (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp))
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp))))) ;
    

    InfoPrecipNo = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP no_Quant precipitation_N))) ; 


    InfoPrecipType precipIntencity precipType
      = mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl precipType))
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN precipitation_N (mkNP intensity_N))) precipIntencity)))) ;


    InfoPrecipProbaility precipProbability =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN probability_N (mkAdv of_Prep (mkNP precipitation_N)))) precipProbability))  ;

    InfoDewPointHumidity humidity dewPoint humidityType =
      mkPhr (colon (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP humidity_N) (mkVP humidityType)))
               (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN relative_A humidity_N)) humidity))
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det dew_point_N) dewPoint))))) ;
    
    InfoSky cloudCoverType = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det sky_N) (mkVP cloudCoverType)))  ;
 


    InfoWindNo = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP no_Quant wind_N))) ;
    InfoWindBearing windSpeed windSpeedType windBearingType =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkWind windSpeedType windBearingType))) ;


    InfoPressure pressure =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN sea_N (mkNP (mkCN level_N (mkNP (mkCN air_N (mkNP pressure_N))))))) pressure)) ;

    InfoOzone ozone =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN (mkCN columnar_A density_N) (mkAdv of_Prep (mkNP (mkCN atmospheric_A ozone_N))))) ozone)) ;

  oper
    mkWind : VP -> Adv -> VP = \ v, a -> mkVP v a ;

}
