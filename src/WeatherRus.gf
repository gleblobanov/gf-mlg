concrete WeatherRus of Weather = RSTRus, MessagesRus ** open WeatherLexiconRus, WeatherExtraRus, SyntaxRus  in {


  -- Сейчас понедельник, 29 мая, 2017 г. в Гетеборге, Швеция (57.709, 11.975)
  lin InfoLocation weekday day month year time loc lat long icon = dateLocation_Phr
        where
        {
          date_NP :          NP  = mkNPComma weekday (mkNPComma day (mkNPComma month (mkNPComma year time))) ;
          date_S :           S   = mkS presentTense simultaneousAnt positivePol (mkCl (mkVP date_NP)) ;
          location_NP :      NP  = mkNPNoPunct loc (prnths (mkNPComma lat long));
          location_Adv :     Adv = mkAdv v_Prepos_Prep location_NP ;
          -- dateLocation_Phr : Phr = mkPhr (mkS seychas_Adv (mkS date_S location_Adv))
          dateLocation_Phr : Phr = mkPhr (mkS date_S location_Adv)
        };




    -- Температура 19 C, что среднее для этой даты значение . По ощущениям 23 C.
  lin InfoTemperatureShort _ _ temp appTemp = mkPhr (semicolon temp_S appTemp_S)
        where
        {
          appTemp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl appTemp (mkAdv po_Dat_Prep (mkNP aPl_Det oshushenie_N))) ;
          data_Adv : Adv = mkAdv for_Prep (mkNP this_Det data_N) ;
          srednee_AP : AP = mkAP sredniy_dlya_A2 (mkNP this_Det data_N) ;
          znachenie_CN : CN = mkCN srednee_AP (mkCN znachenie_N) ;
          avrg_RS : RS = mkRS (mkTemp presentTense simultaneousAnt) positivePol (mkRCl chto_RP znachenie_CN ) ;
          temp_NP : NP = mkNP temp avrg_RS  ;
          temp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperatura_N) temp_NP)
        } ;
 

    -- Температура 19 C, и 23 C по ощущениям. Это выше среднего (17 С) для этой даты.
  lin InfoTemperature avTempType avTemp temp appTemp = mkPhr (fullstop (conj temp_S i_Conj osh_S) avrg_S)
        where
        {
          temp_S : S = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP theSg_Det temperatura_N) temp) ;
          osh_S  : S = mkS presentTense simultaneousAnt positivePol (mkCl appTemp (mkAdv po_Dat_Prep (mkNP aPl_Det oshushenie_N))) ;

          avrg_VP : VP = mkVP (mkAP ravno_A2 avTemp) ;
          avrg_RS : RS = mkRS (mkTemp presentTense simultaneousAnt) positivePol (mkRCl which_RP avrg_VP) ;
          avrg_NP    : NP  = mkNPNoPunct (mkNP srednee_N) (prnths avTemp) ;
          avrg_Cl    : Cl  = mkCl (mkNP this_Det) (mkVP (mkAvrg avrg_NP avTempType)) ;

          data_Adv : Adv = mkAdv for_Prep (mkNP this_Det data_N) ;
          avrg_S     : S   = mkS data_Adv (mkS presentTense simultaneousAnt positivePol avrg_Cl)
        } ;




  lin  InfoPrecipType precipIntencity precipType
      = mkPhr (mkS and_Conj (mkListS (mkS presentTense simultaneousAnt positivePol precipType)
                                (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN intensivnost_N2 (mkNP aPl_Det osadki_N))) precipIntencity)))) ;


 lin   InfoPrecipProbability precipProbability =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN veroyatnost_N2 (mkNP aPl_Det osadki_N))) precipProbability))  ;



    

    -- Относительная влажность 34% и точка росы 34 С. Это выше среднего (43% и 45 С соответственно) для этой даты.

  lin InfoDewPointHumidity avrgType avrgHmdt hmdt avrgDwPnt dwPnt = mkPhr (fullstop (conj rltHmdt_S i_Conj dwPnt_S) avrg_S)
        where
        {
          rltHmdt_S       : S  = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP vlazhnost_N) hmdt) ;
          dwPnt_S         : S  = mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN tochka_N2 (mkNP rosa_N))) dwPnt) ;


          avrgVals_NP : NP = mkNP (mkNPConj avrgHmdt i_Conj avrgDwPnt) sootvetstvenno_Adv ;
          avrg_NP    : NP  = mkNPNoPunct (mkNP srednee_N) (prnths avrgVals_NP) ;
          avrg_Cl    : Cl  = mkCl (mkNP this_Det) (mkVP (mkAvrg avrg_NP avrgType)) ;

          data_Adv : Adv = mkAdv for_Prep (mkNP this_Det data_N) ;
          avrg_S     : S   = mkS data_Adv (mkS presentTense simultaneousAnt positivePol avrg_Cl) 
        } ;
      


   lin InfoSky cloudCoverType = mkPhr (mkS presentTense simultaneousAnt positivePol (mkClNP cloudCoverType))  ;
 
  lin  InfoWindBearing windSpeed windSpeedType windBearingType =
         mkPhr  (mkS presentTense simultaneousAnt positivePol
                   (mkCl
                      (mkNP
                            (mkCN (mkN2CN windSpeedType)
                               (mkNP (mkCN windBearingType napravlenie_N))))
                      (mkVP
                         (mkVP dut_V)
                         (mkAdv
                            so_Inst_Prep
                            (mkNP
                               (mkCN (mkCN skorost_N) windSpeed)))))) ;


  lin  InfoWindCalm _ _ _ = mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkVP (mkAdv net_Gen_Prep (mkNP veter_N))))) ; 

 lin   InfoPressure pressure =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN (mkCN atmosphernij_A davlenie_N) (mkAdv na_PreposVNa_Prep (mkNP (mkCN uroven_N2 (mkNP more_N)))))) pressure)) ;

  lin  InfoOzone ozone =
      mkPhr (mkS presentTense simultaneousAnt positivePol (mkCl (mkNP (mkCN koncentraciya_N2 (mkNP (mkCN atmosphernij_A ozon_N)))) ozone)) ;










}
