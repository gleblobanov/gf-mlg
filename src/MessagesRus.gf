concrete MessagesRus of Messages = open WeatherLexiconRus, WeatherExtraRus, SyntaxRus in {


  {- Location & Time & Icon -}

  lincat

    Location  = NP ;
    City      = NP ;
    Country   = NP ;
    Latitude  = NP ;
    Longitude = NP ;

    Day      = NP ;
    Weekday  = NP ;
    Month    = NP ;
    Year     = NP ;
    Time     = NP ;
    Timezone = NP ;

    Icon = VP ;

   lin

    LocationVal v = mkValueNP v.s ;
    CityVal v = mkValueNP v.s ;
    CountryVal v = mkValueNP v.s ;
    
    LatitudeVal v  = mkValueNP v.s;
    LongitudeVal v = mkValueNP v.s;

    DayVal v      = mkValueNP v.s ;
    YearVal v     = mkValueNP v.s ;
    TimeVal v     = mkValueNP v.s ;
    TimezoneVal v = mkValueNP v.s ;

    Monday    = mkNP ponedelnik_N ;
    Tuesday   = mkNP vtornik_N ;
    Wednesday = mkNP sreda_N ;
    Thursday  = mkNP chetverg_N ;
    Friday    = mkNP pyatnicza_N ;
    Saturday  = mkNP subbota_N ;
    Sunday    = mkNP voskresene_N ;

    January   = mkNP yanvar_N ;
    February  = mkNP fevral_N ;
    March     = mkNP mart_N ;
    April     = mkNP aprel_N ;
    May       = mkNP maj_N ;
    June      = mkNP iyun_N ;
    July      = mkNP iyul_N ;
    August    = mkNP avgust_N ;
    September = mkNP sentyabr_N ;
    October   = mkNP oktyabr_N ;
    November  = mkNP noyabr_N ;
    December  = mkNP decabr_N ;
    MonthNone = mkNP empty_N ;
    
    IconClearDay   = mkVP (mkNP aSg_Det (mkCN yasnyj_A den_N)) ;
    IconClearNight = mkVP (mkNP aSg_Det (mkCN yasnyj_A noch_N)) ;
    IconRain = mkVP dozhdlivo_Adv ;
    IconSnow = mkVP snezhno_Adv ;
    IconSleet = mkVP idti_V2 (mkNP aSg_Det (mkCN dozhd_N (mkAdv so_Inst_Prep (mkNP sneg_N)))) ;
    IconWind = mkVP vetrenno_Adv ;
    IconFog = mkVP tumanno_Adv ;
    IconCloudy = mkVP oblachno_Adv ;
    IconPartlyCloudyDay   = mkVP (mkNP aSg_Det (mkCN (mkAP chastichno_AdA oblachnij_A) den_N)) ;
    IconPartlyCloudyNight = mkVP (mkNP aSg_Det (mkCN (mkAP chastichno_AdA oblachnij_A) noch_N)) ;
    IconNone = mkVP neizvestniy_A ;

  {- Temperature -}

  lincat

    Temperature = NP ;
    ApparentTemperature = NP ;
    AverageTemperature = NP ;
    AverageTempType = Avrg ;
    TempType = AP ;

  lin

    TemperatureVal v = mkUnitNP v.s "\176C" ;
    ApparentTemperatureVal v = mkUnitNP v.s "\176C" ;
    AverageTemperatureVal v  = mkUnitNP v.s "\176C" ;
    AverageTempTypeVal v = v ;

    ExtremelyHot = mkAP chrezvychajno_AdA zharkij_A ;
    VeryHot = mkAP ochen_AdA zharkij_A ;
    Hot = mkAP zharkij_A  ;
    VeryWarm = mkAP ochen_AdA teplyj_A ;
    Warm = mkAP teplyj_A ;
    Mild = mkAP myagkij_A ;
    Cool = mkAP prohladnij_A ;
    Cold =  mkAP holodnij_A ;
    VeryCold = mkAP ochen_AdA holodnij_A ;
    Freezing = mkAP moroznij_A ;


  {- Precipitation -}

  lincat
    
    PrecipIntensity = NP ;
    PrecipType = Cl ;
    PrecipProbability = NP ;
    PrecipProbabilityType = AP ;

  lin
    
    PrecipIntensityVal v = mkUnitNP v.s "мм/ч";
    PrecipProbabilityVal v = mkUnitNP v.s "%";


    Rain = mkCl (mkNP aSg_Det dozhd_N) idti_V ;
    Snow = mkCl (mkNP aSg_Det sneg_N) idti_V ;
    Sleet = mkCl (mkNP aSg_Det (mkCN sneg_N (mkAdv s_Inst_Prep (mkNP aSg_Det dozhd_N)))) idti_V ;
    PrecipNone = mkCl (mkVP neizvestniy_A) ;


    VeryHigh = mkAP ochen_AdA visokij_A ;
    High = mkAP visokij_A;
    Moderate = mkAP umerennij_A;
    Low = mkAP nizkij_A ;
    VeryLow = mkAP ochen_AdA nizkij_A ;


  {- Humidity -}

  lincat

    DewPoint = NP ;
    AverageDewPoint = NP ;
    Humidity = NP ;
    AverageHumidity = NP ;
    AverageHumidityType = Avrg ;

  lin

   DewPointVal v = mkUnitNP v.s "\176C";
   AverageDewPointVal v  = mkUnitNP v.s "\176C" ;
   HumidityVal v = mkUnitNP v.s "%";
   AverageHumidityVal v = mkUnitNP v.s "%";
   AverageHumidityTypeVal v  = v ;

   -- SeverelyUncomofortableHumid = mkAP opasno_AdA nekomfortnij_A ;
   -- ExtremelyUncomfortableHumid = mkAP krajne_AdA nekomfortnij_A ;
   -- QuiteUncomfortableHumid = mkAP dovolno_AdA nekomfortnij_A; 
   -- SomewhatUncomfortableHumid = mkAP otchasti_AdA nekomfortnij_A;
   -- ScarcelyUncomfortableHumid = mkAP edva_AdA nekomfortnij_A;
   -- ComfortableHumid =  mkAP komfortnij_A; 
   -- VeryComfortableHumid = mkAP ochen_AdA komfortnij_A;
   -- ScarcelyUncomfortableDry = mkAP dovolno_AdA nekomfortnij_A;
   -- HumidityNone = mkAP dovolno_AdA nekomfortnij_A;
    

   {- Clouds -}

  lincat

    CloudCover = NP ;
    CloudCoverType = NP ;

  lin 

    CloudCoverVal v = mkUnitNP v.s "%";

    Clear     = mkNP aSg_Det (mkCN yasnyj_A nebo_N ) ;
    Scattered = mkNP aPl_Det (mkCN otdelnij_A oblako_N) ;
    Broken    = mkNP aPl_Det (mkCN razorvannij_A oblako_N) ;
    Overcast  = mkNP aPl_Det (mkCN sploshnoj_A oblako_N) ;

    
 --  {- Wind -}
   
  lincat

  
    WindSpeed       = NP ;
    WindSpeedType   = CN ;
    WindBearing     = NP ;
    WindBearingType = AP ;

  lin
    WindSpeedVal v = mkUnitNP v.s "км/ч" ;
    WindBearingVal v = mkValueNP v.s ;

    Calm           = mkCN shtil_N ;
    LightAir       = mkCN tihij_A veter_N ;
    LightBreeze    = mkCN legkij_A veter_N ;
    GentleBreeze   = mkCN slabij_A veter_N ;
    ModerateBreeze = mkCN umerennij_A veter_N ;
    FreshBreeze    = mkCN svezhij_A veter_N ;
    StrongBreeze   = mkCN silnij_A veter_N ;
    ModerateGale   = mkCN krepkij_A veter_N ;
    FreshGale      = mkCN (mkAP ochen_AdA krepkij_A) veter_N ;
    StrongGale     = mkCN storm_N ;
    WholeGale      = mkCN silnij_A storm_N ;
    Storm          = mkCN zhestokij_A storm_N ;
    Hurricane      = mkCN uragan_N ;

    
    WindN   = mkAP N_A ;
    WindNNE = mkAP NNE_A ;
    WindNE  = mkAP NE_A ;
    WindENE = mkAP ENE_A ;
    WindE   = mkAP E_A ;
    WindESE = mkAP ESE_A ;
    WindSE  = mkAP SE_A ;
    WindSSE = mkAP SSE_A ;
    WindS   = mkAP S_A ;
    WindSSW = mkAP SSW_A ;
    WindSW  = mkAP SW_A ;
    WindWSW = mkAP WSW_A ;
    WindW   = mkAP W_A ;
    WindWNW = mkAP WNW_A ;
    WindNW  = mkAP NW_A ;
    WindNNW = mkAP NNW_A ;



  {- Pressure -}

  lincat   

    Pressure = NP ;

  lin
    PressureVal v = mkUnitNP v.s "мбар";

  
 {- Ozone -}

  lincat

    Ozone = NP ;

  lin

    OzoneVal v = mkUnitNP v.s "DU";


  {- Averages -}

  param Avrg = avrgRL
             | avrgSL
             | avrgL
             | avrgE
             | avrgSG
             | avrgG
             | avrgRG ;


  lincat Average = Avrg ;

  lin 
    RemarkablyLess    = avrgRL ;
    SlightlyLess      = avrgSL ;
    Less              = avrgL ;
    Equal             = avrgE ;
    SlightlyGreater   = avrgSG ;
    Greater           = avrgG ;
    RemarkablyGreater = avrgRG ;


  oper mkAvrg : NP -> Avrg -> AP
         = \ np, avrg -> case avrg of {
           avrgRL => mkAP gorazdo_AdA (mkAP' (comparAP nizkij_A) np) ;       -- гораздо ниже
           avrgL  => mkAP' (comparAP nizkij_A) np ;                       -- ниже
           avrgSL => mkAP nemnogo_AdA (mkAP' (comparAP nizkij_A) np)  ;  -- немного ниже
           avrgE  => mkAP ravno_A2 np ;                 -- равно
           avrgSG => mkAP nemnogo_AdA (mkAP' (comparAP visokij_A) np)  ; -- немного выше
           avrgG  => mkAP' (comparAP visokij_A) np  ;                     -- выше
           avrgRG  => mkAP gorazdo_AdA (mkAP' (comparAP visokij_A) np) } ;   -- гораздо выше

}
