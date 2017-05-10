concrete WeatherEng of Weather = RSTEng, MessagesEng ** open WeatherLexiconEng, WeatherExtraEng, SyntaxEng in {

  -- On Friday, 8 May, 2017, 14:07 in Gothenburg, Sweden (57.7089° N, 11.9746° E), it is sunny.
  lin InfoLocation weekday day month year time loc lat long icon = dateLocation_Phr
        where
        {
          date_NP :          NP  = mkNPComma weekday (mkNPComma day (mkNPComma month (mkNPComma year time))) ;
          date_Adv :         Adv = mkAdv on_Prep date_NP ;
          location_NP :      NP  = mkNPNoPunct loc (prnths (mkNPComma lat long));
          location_Adv :     Adv = mkAdv in_Prep location_NP ;
          icon_S :           S   = mkS presentTense simultaneousAnt positivePol (mkCl icon) ;
          dateLocation_Phr : Phr = mkPhr (mkS date_Adv (mkS location_Adv icon_S))
        };


    -- The temperature is 19 C, which is an average for this date, and it feels like 23 C.
  lin InfoTemperatureShort temp appTemp = mkPhr (mkS and_Conj (mkListS temp_S appTemp_S))
        where
        {
          appTemp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ;
          date_Adv : Adv = mkAdv for_Prep (mkNP this_Det date_N) ;
          avrg_RS : RS = mkRS (mkTemp presentTense simultaneousAnt) positivePol (RClAdv (mkRCl which_RP' average_A) date_Adv) ;
          temp_NP : NP = mkNP temp avrg_RS  ;
          temp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp_NP)
        } ;
      

    -- The temperature is 19 C, and it feels like 23 C. For this date, it is higher than average , which is 17 C.
  lin InfoTemperatureAverage avTempType avTemp temp appTemp = mkPhr (fullstop tempAppTemp_S avrg_S)
        where
        {
          temp_S        : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp) ;
          appTemp_S     : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ; 
          tempAppTemp_S : S = mkS and_Conj (mkListS temp_S appTemp_S) ;
          
          avrgVal_RS : RS  = mkRS (mkTemp presentTense simultaneousAnt) positivePol (mkRCl which_RP' avTemp) ;
          avrg_NP    : NP  = mkNP (mkNP average_N) avrgVal_RS ;
          avrg_Cl    : Cl  = mkCl (mkVP (mkAvrg avrg_NP avTempType)) ;
          date_Adv   : Adv = mkAdv for_Prep (mkNP this_Det date_N) ;
          avrg_S     : S   = mkS date_Adv (mkS presentTense simultaneousAnt positivePol avrg_Cl)
        } ;


    -- It is raining, and the precipitation intesity is 22 mm/h.
  lin InfoPrecipType precipIntensity precipType =
        mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl precipType))
                               (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN precipitation_N (mkNP intensity_N))) precipIntensity)))) ;

    -- The probability of precipitation is low.
  lin InfoPrecipProbability precipProbability =
        mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN probability_N (mkAdv of_Prep (mkNP precipitation_N)))) precipProbability))  ;


    -- Relative humidity is 34% and the dew point is 34 C; it is higher than average, which is 43% and 45 C respectively.
  lin InfoDewPointHumidity avrgType avrgHmdt hmdt avrgDwPnt dwPnt = mkPhr (semicolon hmdtDwPnt_S avrgHmdtDwPnt_S)
        where
        {
          rltHmdt_S       : S  = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN relative_A humidity_N)) hmdt) ;
          dwPnt_S         : S  = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP dew_point_N) dwPnt) ;
          hmdtDwPnt_S     : S  = mkS and_Conj rltHmdt_S dwPnt_S ;
                
          hmdtDwPnt_RCl   : RCl = RClAdv (mkRCl which_RP' (mkNP and_Conj avrgHmdt avrgDwPnt)) respectively_Adv ;
          hmdtDwPnt_RS    : RS  = mkRS (mkTemp presentTense simultaneousAnt) positivePol hmdtDwPnt_RCl ;
          avrg_NP         : NP  = mkNP (mkNP average_N) hmdtDwPnt_RS ;
          avrgHmdtCmp_Cl  : Cl  = mkCl (mkVP (mkAvrg avrg_NP avrgType)) ;
          avrgHmdtDwPnt_S : S   = mkS presentTense simultaneousAnt positivePol avrgHmdtCmp_Cl
        } ;
      

    -- The sky is half cloudy.
  lin InfoSky cloudCoverType = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det sky_N) (mkVP cloudCoverType)))  ;
 

    -- The air is calm.
  lin InfoWindCalm = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP the_Det air_N) (mkVP calm_A))) ;

    -- A strong gale blows in NNE at speed 13 km/h.
  lin InfoWindBearing windSpeed windSpeedType windBearingType = mkPhr windBlowsDrctSpd_S
        where
        {
          windBlows_Cl : Cl = mkCl windSpeedType blow_V ;
          windBlows_S  : S = mkS presentTense simultaneousAnt positivePol windBlows_Cl ;
          windBlowsDrctSpd_S : S = mkS (mkS windBlows_S windBearingType) windSpeed
        } ;

    -- The sea-level air pressure is 3 millibars.
  lin InfoPressure pressure =
        mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN sea_N (mkNP (mkCN level_N (mkNP (mkCN air_N (mkNP pressure_N))))))) pressure)) ;

    -- The columnar density of total atmospheric ozon is 3.3 DU.
  lin InfoOzone ozone =
        mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN (mkCN columnar_A density_N) (mkAdv of_Prep (mkNP (mkCN atmospheric_A ozone_N))))) ozone)) ;


}
