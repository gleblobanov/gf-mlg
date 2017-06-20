concrete WeatherEng of Weather = RSTEng, MessagesEng ** open WeatherParams, WeatherLexiconEng, WeatherExtraEng, SyntaxEng in {


  -- It is Monday, 29, May, 2017, 16:58 in Gothenburg, Sweden (57.709, 11.975).
  lin InfoLocation weekday day month year time loc lat long icon =
        table
        {
          PrsnTns => dateLocation_Phr ;
          FtrTns => dateLocation_Phr 
        }
        where
        {
          date_NP :          NP  = mkNPComma weekday (mkNPComma day (mkNPComma month (mkNPComma year time))) ;
          date_Adv :         Adv = mkAdv on_Prep date_NP ;
          location_NP :      NP  = mkNPNoPunct loc (prnths (mkNPComma lat long));
          location_Adv :     Adv = mkAdv in_Prep location_NP ;
          -- icon_S :           S   = mkS presentTense simultaneousAnt positivePol (mkCl icon) ;
          date_S :           S   = mkS presentTense simultaneousAnt positivePol (mkCl (mkVP date_NP)) ;
          dateLocation_Phr : Phr = mkPhr (mkS date_S location_Adv)
        };


    -- The temperature is 19 C, which is an average for this date, and it feels like 23 C.
  lin InfoTemperatureShort _ _ temp appTemp =
        table
        {
          PrsnTns => mkPhr (mkS and_Conj (mkListS temp_S appTemp_S)) ;
          FtrTns => mkPhr (mkS and_Conj (mkListS temp_S' appTemp_S')) 
        }
        where
        {
          appTemp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ;
          appTemp_S' : S = mkS futureTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ;
          date_Adv : Adv = mkAdv for_Prep (mkNP this_Det date_N) ;
          avrg_RS : RS = mkRS (mkTemp presentTense simultaneousAnt) positivePol (RClAdv (mkRCl which_RP' average_A) date_Adv) ;
          temp_NP : NP = mkNP temp avrg_RS  ;
          temp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp_NP) ;
          temp_S' : S = mkS futureTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp_NP)
        } ;
      

    -- The temperature is 19 C, and it feels like 23 C. For this date, it is higher than average , which is 17 C.
  lin InfoTemperature avTempType avTemp temp appTemp = 
        table
        {
          
          PrsnTns =>  mkPhr (fullstop tempAppTemp_S avrg_S)  ;
          FtrTns => mkPhr (fullstop tempAppTemp_S' avrg_S') 
        }
        where
        {
          temp_S        : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp) ;
          temp_S'        : S = mkS futureTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperature_N) temp) ;

          appTemp_S     : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ; 
          appTemp_S'     : S = mkS futureTense simultaneousAnt positivePol (mkCl (mkNP it_Pron) feel_like_V2 appTemp) ; 
          tempAppTemp_S : S = mkS and_Conj (mkListS temp_S appTemp_S) ;
          tempAppTemp_S' : S = mkS and_Conj (mkListS temp_S' appTemp_S') ;
          
          avrgVal_RS : RS  = mkRS (mkTemp presentTense simultaneousAnt) positivePol (mkRCl which_RP' avTemp) ;
          avrg_NP    : NP  = mkNP (mkNP average_N) avrgVal_RS ;
          avrg_Cl    : Cl  = mkCl (mkVP (mkAvrg avrg_NP avTempType)) ;
          date_Adv   : Adv = mkAdv for_Prep (mkNP this_Det date_N) ;
          avrg_S     : S   = mkS date_Adv (mkS presentTense simultaneousAnt positivePol avrg_Cl) ;
          avrg_S'     : S   = mkS date_Adv (mkS futureTense simultaneousAnt positivePol avrg_Cl)
        } ;


    -- It is raining, and the precipitation intesity is 22 mm/h.
  lin InfoPrecipType precipIntensity precipType =
        table
        {
          PrsnTns => mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol (mkCl precipType))
                               (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN precipitation_N (mkNP intensity_N))) precipIntensity)))) ;
          FtrTns =>  mkPhr (mkS and_Conj (mkListS (mkS futureTense simultaneousAnt positivePol (mkCl precipType))
                               (mkS futureTense simultaneousAnt positivePol (mkCl (mkNP (mkCN precipitation_N (mkNP intensity_N))) precipIntensity))))
        } ;

    -- The probability of precipitation is low.
  lin InfoPrecipProbability precipProbability =
        table
        {
          PrsnTns => mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN probability_N (mkAdv of_Prep (mkNP precipitation_N)))) precipProbability)) ;
          FtrTns =>  mkPhr (mkS futureTense simultaneousAnt positivePol (mkCl (mkNP (mkCN probability_N (mkAdv of_Prep (mkNP precipitation_N)))) precipProbability))
        }
        where
        {
          phr : Phr = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN probability_N (mkAdv of_Prep (mkNP precipitation_N)))) precipProbability))  ;
        } ;

    -- Relative humidity is 34% and the dew point is 34 C; it is higher than average, which is 43% and 45 C respectively.
  lin InfoDewPointHumidity avrgType avrgHmdt hmdt avrgDwPnt dwPnt = 
        table
        {
          PrsnTns => mkPhr (semicolon hmdtDwPnt_S avrgHmdtDwPnt_S) ;
          FtrTns =>  mkPhr (semicolon hmdtDwPnt_S' avrgHmdtDwPnt_S')
        }
        where
        {
          rltHmdt_S       : S  = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN relative_A humidity_N)) hmdt) ;
          rltHmdt_S'       : S  = mkS futureTense simultaneousAnt positivePol (mkCl (mkNP (mkCN relative_A humidity_N)) hmdt) ;
          dwPnt_S         : S  = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP the_Det dew_point_N) dwPnt) ;
          dwPnt_S'         : S  = mkS futureTense simultaneousAnt positivePol (mkCl (mkNP the_Det dew_point_N) dwPnt) ;
          hmdtDwPnt_S     : S  = mkS and_Conj rltHmdt_S dwPnt_S ;
          hmdtDwPnt_S'     : S  = mkS and_Conj rltHmdt_S' dwPnt_S' ;
                
          hmdtDwPnt_RCl   : RCl = RClAdv (mkRCl which_RP' (mkNP and_Conj avrgHmdt avrgDwPnt)) respectively_Adv ;
          hmdtDwPnt_RS    : RS  = mkRS (mkTemp presentTense simultaneousAnt) positivePol hmdtDwPnt_RCl ;
          avrg_NP         : NP  = mkNP (mkNP average_N) hmdtDwPnt_RS ;
          avrgHmdtCmp_Cl  : Cl  = mkCl (mkVP (mkAvrg avrg_NP avrgType)) ;
          avrgHmdtDwPnt_S : S   = mkS presentTense simultaneousAnt positivePol avrgHmdtCmp_Cl ;
          avrgHmdtDwPnt_S' : S   = mkS futureTense simultaneousAnt positivePol avrgHmdtCmp_Cl
        } ;
      

    -- The sky is half cloudy.
  lin InfoSky cloudCoverType =
      table
        {
          PrsnTns => mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det sky_N) (mkVP cloudCoverType)))  ;
          FtrTns =>  mkPhr (mkS futureTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det sky_N) (mkVP cloudCoverType))) 
        } ;


    -- The air is calm.
  lin InfoWindCalm _ _ _ = 
      table
        {
          PrsnTns => mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP the_Det air_N) (mkVP calm_A))) ;
          FtrTns =>  mkPhr (mkS futureTense simultaneousAnt positivePol (mkCl (mkNP the_Det air_N) (mkVP calm_A))) 
        } ;


    -- A strong gale blows in NNE at speed 13 km/h.
  lin InfoWindBearing windSpeed windSpeedType windBearingType =
      table
        {
          PrsnTns => mkPhr windBlowsDrctSpd_S ;
          FtrTns => mkPhr windBlowsDrctSpd_S' 
        }
        where
        {
          windBlows_Cl : Cl = mkCl windSpeedType blow_V ;
          windBlows_S  : S = mkS presentTense simultaneousAnt positivePol windBlows_Cl ;
          windBlowsDrctSpd_S : S = mkS (mkS windBlows_S windBearingType) windSpeed ;
          windBlows_S'  : S = mkS futureTense simultaneousAnt positivePol windBlows_Cl ;
          windBlowsDrctSpd_S' : S = mkS (mkS windBlows_S' windBearingType) windSpeed

        } ;

    -- The sea-level air pressure is 3 millibars.
  lin InfoPressure pressure =
        table
        {
          PrsnTns => mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN sea_N (mkNP (mkCN level_N (mkNP (mkCN air_N (mkNP pressure_N))))))) pressure))  ;
          FtrTns => mkPhr (mkS futureTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN sea_N (mkNP (mkCN level_N (mkNP (mkCN air_N (mkNP pressure_N))))))) pressure)) 
        } ;
        

    -- The columnar density of total atmospheric ozon is 3.3 DU.
  lin InfoOzone ozone =
        table
        {
          PrsnTns => mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN (mkCN columnar_A density_N) (mkAdv of_Prep (mkNP (mkCN atmospheric_A ozone_N))))) ozone)) ;
          FtrTns => mkPhr (mkS futureTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det (mkCN (mkCN columnar_A density_N) (mkAdv of_Prep (mkNP (mkCN atmospheric_A ozone_N))))) ozone))
        } ;

}
