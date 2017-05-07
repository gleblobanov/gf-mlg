concrete WeatherEng of Weather = RSTEng, MessagesEng ** open WeatherLexiconEng, WeatherExtraEng, SyntaxEng in {


  lin

    InfoLocation city day month year weekday time icon = mkText (mkS (mkAdv empty_Conj (mkAdv on_Prep (mkNP comma_Conj weekday (mkNP empty_Conj day (mkNP empty_Conj month year)))) (mkAdv at_Prep time)) (mkS (mkAdv in_Prep city) (mkS presentTense simultaneousAnt positivePol (mkCl icon)))) ;


    -- The temperature is 19 C, which is average for this date, and it feels like 23 C.
    NucInfoTemperature temp appTemp = mkText (mkS and_Conj (mkListS temp_S appTemp_S))
      where { appTemp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ;
              avrg_RS : RS = mkRS (mkTemp presentTense simultaneousAnt) positivePol (mkRCl which_RP average_A) ;
              date_Adv : Adv = mkAdv for_Prep (mkNP this_Det date_N) ;
              temp_NP : NP = mkNP (mkNP temp avrg_RS) date_Adv ;
              temp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp_NP) ; } ;
      


    -- The temperature is 19 C, and it feels like 23 C.
    NucTemperatureAndApparentTemperature temp appTemp = mkText (mkS and_Conj (mkListS temp_S appTemp_S))
      where { temp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp) ;
              appTemp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ; } ;

    -- It is higher than average temperature for this date, which is 17 C.
    SatAverageTemperature avTempType avTemp = mkText s
      where { avrg_RS : RS = mkRS (mkTemp presentTense simultaneousAnt) positivePol (mkRCl which_RP avTemp) ;
              date_Adv : Adv = mkAdv for_Prep (mkNP this_Det date_N) ;
              temp_NP : NP = mkNP (mkNP (mkNP a_Det (mkCN avTempType temperature_N)) date_Adv) avrg_RS ;
              avrg_Cl : Cl = mkCl (mkVP temp_NP) ;
              s : S = mkS presentTense simultaneousAnt positivePol avrg_Cl ; };


    -- InfoPrecipType precipIntencity precipType
      -- = mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl precipType))
                                -- (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN precipitation_N (mkNP intensity_N))) precipIntencity)))) ;


    InfoPrecipProbability precipProbability =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN probability_N (mkAdv of_Prep (mkNP precipitation_N)))) precipProbability))  ;


    -- InfoDewPointHumidity humidity dewPoint humidityType =
      -- mkPhr (colon (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP humidity_N) (mkVP humidityType)))
               -- (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN relative_A humidity_N)) humidity))
                                -- (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det dew_point_N) dewPoint))))) ;
    
    InfoSky cloudCoverType = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det sky_N) (mkVP cloudCoverType)))  ;
 


    InfoWindNo = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP no_Quant wind_N))) ;
    InfoWindBearing windSpeed windSpeedType windBearingType =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkWind windSpeedType windBearingType windSpeed))) ;


    InfoPressure pressure =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN sea_N (mkNP (mkCN level_N (mkNP (mkCN air_N (mkNP pressure_N))))))) pressure)) ;

    InfoOzone ozone =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN (mkCN columnar_A density_N) (mkAdv of_Prep (mkNP (mkCN atmospheric_A ozone_N))))) ozone)) ;

  oper
    mkWind : VP -> Adv -> NP -> VP = \ vp, adv, np -> mkVP (mkVP vp (mkAdv empty_Prep np)) adv ;

}
