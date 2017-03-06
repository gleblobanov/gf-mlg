resource WeatherLexiconRus = open LexiconRus, ParadigmsRus, ResRus, WeatherExtraRus in {

  oper


    dut_V = mkV
      Imperfective
      "дую"
      "дуешь"
      "дует"
      "дуем"
      "дуете"
      "дуют"
      "дул"
      "дуй"
      "дуть"  ;


    
    idti_V = mkV
      Imperfective
      "иду"
      "идешь"
      "идет"
      "идем"
      "идете"
      "идут"
      "шел"
      "иди"
      "ходить"  ;

    idti_V2 = mkV2 idti_V "" Nom ;

    -- sleet_V         = mkV "sleet" ;
    -- feel_like_V2    = mkV2 feel_V like_Prep ;
    -- feel_V          = mkV "feel" ;
    -- rain_V0         = LexiconEng.rain_V0 ;

    -- strong_A        = mkA "strong" ;
    -- calm_A          = mkA "calm" ;
    -- whole_A         = mkA "whole" ;

    moroznij_A = mkA "морозный" ;
    holodnij_A = mkA "холодный" ;
    prohladnij_A = mkA "прохладный" ; 
    zharkij_A       = mkA "жаркий" ;
    teplyj_A        = mkA "теплый" ;
    myagkij_A       = mkA "мягкий" ;
    -- atmospheric_A   = mkA "atmospheric" ;
    -- columnar_A      = mkA "columnar" ;
    kazhushijsya_A      = mkA "кажущийся" ;  --  Privet, menya zovut Gleb. Ya pishu translitom, potomuchto po-russki my pishem translitom posle revolyucii uzhe bolshe sta let.
    freezing_A      = mkA "холодный" ;
    chilly_A        = mkA "прохладный" ;
    oblachnij_A     = mkA "облачный" ;
    tumannij_A         = mkA "туманный" ;

    dozhdlivo_Adv = mkAdv "дождливо" ;
    snezhno_Adv   = mkAdv "снежно" ;
    vetrenno_Adv  = mkAdv "ветренно" ;
    tumanno_Adv   = mkAdv "туманно" ;
    oblachno_Adv  = mkAdv "облачно" ;

    chastichno_AdA = mkAdA "частично" ;
    chrezvychajno_AdA = mkAdA "чрезвычайно" ;
    ochen_AdA = mkAdA "очень" ;

    yasnyj_A         = mkA "ясный" ;
    
    neizvestniy_A  = mkA "неизвестный" ;
    visokij_A      = mkA "высокий" ;
    nizkij_A       = mkA "низкий" ;
    umerennij_A    = mkA "умеренный" ;
    nekomfortnij_A = mkA "некомфортный" ;
    komfortnij_A   = mkA "комфортный" ;
    otdelnij_A     = mkA "отдельный" ;
    razorvannij_A    = mkA "разорванный" ;
    sploshnoj_A      = mkA "сплошной" ;

    otnositelnij_A      = mkA "относительный" ;

    tihij_A = mkA "тихий" ;
    legkij_A = mkA "легкий" ;
    slabij_A = mkA "слабый" ;
    svezhij_A = mkA "свежий" ;
    silnij_A = mkA "сильный" ;
    krepkij_A = mkA "крепкий" ;
    zhestokij_A = mkA "жестокий" ; 
    atmosphernij_A = mkA "атмосферный" ;

    
    N_A   = mkA "северный" ;
    NNE_A = mkA "северо-северо-восточный" ;
    NE_A  = mkA "северо-восточный" ;
    ENE_A = mkA "востоко-северо-восточный" ;
    E_A   = mkA "восточный" ;
    ESE_A = mkA "востоко-юго-восточный" ;
    SE_A  = mkA "юго-восточный" ;
    SSE_A = mkA "юго-юго-восточный" ;
    S_A   = mkA "южный" ;
    SSW_A = mkA "юго-юго-западный" ;
    SW_A  = mkA "юго-западный" ;
    WSW_A = mkA "западо-юго-западный" ;
    W_A   = mkA "западный" ;
    WNW_A = mkA "западо-северо-западный" ;
    NW_A  = mkA "северо-западный" ;
    NNW_A = mkA "северо-северо-западный" ;



    
    opasno_AdA  = mkAdA "опасно" ;
    krajne_AdA = mkAdA "крайне" ;
    otchasti_AdA  = mkAdA "отчасти" ;
    edva_AdA  = mkAdA "едва" ;
    dovolno_AdA = mkAdA "довольно" ;


    oshushenie_N = mkN "ощущение" ;


    storm_N = mkN
      "шторм" -- nomSg
      "шторма" -- genSg
      "шторму" -- datSg
      "шторм" -- accSg
      "штормом" -- instSg
      "шторме" -- preposSg
      "шторме" -- prepos2Sg
      "шторма" -- nomPl
      "штормов" -- genPl
      "штормам" -- datPl
      "шторма" -- accPl
      "штормами" -- instPl
      "штормах" -- preposPl
      Masc 
      Inanimate ;



    shtil_N = mkN
      "штиль" -- nomSg
      "штиля" -- genSg
      "штилю" -- datSg
      "штиль" -- accSg
      "штилем" -- instSg
      "штиле" -- preposSg
      "штиле" -- prepos2Sg
      "штиле" -- nomPl
      "штилей" -- genPl
      "штилям" -- datPl
      "штили" -- accPl
      "штилями" -- instPl
      "штилях" -- preposPl
      Masc 
      Inanimate ;



    

    oblako_N =  mkN
      "облако" -- nomSg
      "облака" -- genSg
      "облаку" -- datSg
      "облаке" -- accSg
      "облаком" -- instSg облачностию
      "облаке" -- preposSg
      "облаке" -- prepos2Sg
      "облака" -- nomPl
      "облаков" -- genPl
      "облакам" -- datPl
      "облака" -- accPl
      "облаками" -- instPl
      "облаках" -- preposPl
      Neut 
      Inanimate ;




    
    oblachnost_N =  mkN
      "облачность" -- nomSg
      "облачности" -- genSg
      "облачности" -- datSg
      "облачность" -- accSg
      "облачностью" -- instSg облачностию
      "облачности" -- preposSg
      "облачности" -- prepos2Sg
      "" -- nomPl
      "" -- genPl
      "" -- datPl
      "" -- accPl
      "" -- instPl
      "" -- preposPl
      Fem 
      Inanimate ;




    
    tochka_N2 = mkN2 tochka_N ;
    tochka_N = mkN
      "точка" -- nomSg
      "точки" -- genSg
      "точке" -- datSg
      "точку" -- accSg
      "точкой" -- instSg точкою
      "точке" -- preposSg
      "точке" -- prepos2Sg
      "точки" -- nomPl
      "точек" -- genPl
      "точкам" -- datPl
      "точки" -- accPl
      "точками" -- instPl
      "точках" -- preposPl
      Fem 
      Inanimate ;

 rosa_N = mkN
      "роса" -- nomSg
      "росы" -- genSg
      "росе" -- datSg
      "росу" -- accSg
      "росой" -- instSg точкою росою
      "росе" -- preposSg
      "росе" -- prepos2Sg
      "росы" -- nomPl
      "рос" -- genPl
      "росам" -- datPl
      "росы" -- accPl
      "росами" -- instPl
      "росах" -- preposPl
      Fem 
      Inanimate ;


    dozhd_N = mkN
      "дождь" -- nomSg
      "дождя" -- genSg
      "дождю" -- datSg
      "дождь" -- accSg
      "дождем" -- instSg
      "дожде" -- preposSg
      "дожде" -- prepos2Sg
      "дожди" -- nomPl
      "дождей" -- genPl
      "дождям" -- datPl
      "дожди" -- accPl
      "дождями" -- instPl
      "дождях" -- preposPl
      Masc
      Inanimate ;



    sneg_N = mkN
      "снег" -- nomSg
      "снега" -- genSg
      "снегу" -- datSg
      "снег" -- accSg
      "снегом" -- instSg
      "снеге" -- preposSg
      "снегу" -- prepos2Sg
      "снега" -- nomPl
      "снегов" -- genPl
      "снегам" -- datPl
      "снега" -- accPl
      "снегами" -- instPl
      "снегах" -- preposPl
      Masc
      Inanimate ;

    plotnost_N = mkN
      "плотность" -- nomSg
      "плотности" -- genSg
      "плотности" -- datSg
      "плотность" -- accSg
      "плотностью" -- instSg плотностию
      "плотности" -- preposSg
      "плотности" -- prepos2Sg

      "плотности" -- nomPl
      "плотностей" -- genPl
      "плотностям" -- datPl
      "плотности" -- accPl
      "плотностями" -- instPl
      "плотностях" -- preposPl
      Fem
      Inanimate ;

    osadki_N = mkN
      "" -- nomSg
      "" -- genSg
      "" -- datSg
      "" -- accSg
      "" -- instSg
      "" -- preposSg
      "" -- prepos2Sg
      "осадки" -- nomPl
      "осадков" -- genPl
      "осадкам" -- datPl
      "осадки" -- accPl
      "осадками" -- instPl
      "осадках" -- preposPl
      Masc
      Inanimate ;


    breeze_N = mkN
      "бриз" -- nomSg
      "бриза" -- genSg
      "бризу" -- datSg
      "бриз" -- accSg
      "бризом" -- instSg
      "бризе" -- preposSg
      "бризе" -- prepos2Sg
      "" -- nomPl
      "" -- genPl
      "" -- datPl
      "" -- accPl
      "" -- instPl
      "" -- preposPl
      Masc
      Inanimate ;

    burya_N = mkN
      "буря" -- nomSg
      "бури" -- genSg
      "буре" -- datSg
      "бурю" -- accSg
      "бурей" -- instSg бурею
      "буре" -- preposSg
      "буре" -- prepos2Sg
      "бури" -- nomPl
      "бурь" -- genPl
      "бурям" -- datPl
      "бури" -- accPl
      "бурями" -- instPl
      "бурях" -- preposPl
      Fem
      Inanimate ;


    shtorm_N = mkN
      "шторм" -- nomSg
      "шторма" -- genSg
      "шторму" -- datSg
      "шторм" -- accSg
      "штормом" -- instSg
      "шторме" -- preposSg
      "шторме" -- prepos2Sg
      "шторма" -- nomPl
      "штормов" -- genPl
      "штормам" -- datPl
      "шторма" -- accPl
      "штормами" -- instPl
      "штормах" -- preposPl
      Masc
      Inanimate ;



    uragan_N = mkN
      "ураган" -- nomSg
      "урагана" -- genSg
      "урагану" -- datSg
      "ураган" -- accSg
      "ураганом" -- instSg
      "урагане" -- preposSg
      "урагане" -- prepos2Sg
      "ураганы" -- nomPl
      "ураганов" -- genPl
      "ураганам" -- datPl
      "ураганы" -- accPl
      "ураганами" -- instPl
      "ураганах" -- preposPl
      Masc
      Inanimate ;


    vozduh_N = mkN
      "воздух" -- nomSg
      "воздуха" -- genSg
      "воздуху" -- datSg
      "воздух" -- accSg
      "воздухом" -- instSg
      "воздухе" -- preposSg
      "воздухе" -- prepos2Sg
      "воздухи" -- nomPl
      "воздухов" -- genPl
      "воздухам" -- datPl
      "воздухи" -- accPl
      "воздухами" -- instPl
      "воздухах" -- preposPl
      Masc
      Inanimate ;


    shirota_N= mkN
      "широта" -- nomSg
      "широты" -- genSg
      "широте" -- datSg
      "широту" -- accSg
      "широтой" -- instSg широтою
      "широте" -- preposSg
      "широте" -- prepos2Sg
      "широты" -- nomPl
      "широт" -- genPl
      "широтам" -- datPl
      "широты" -- accPl
      "широтами" -- instPl
      "широтах" -- preposPl
      Fem
      Inanimate ;

    dolgota_N = mkN
      "долгота" -- nomSg
      "долготы" -- genSg
      "долготе" -- datSg
      "долготу" -- accSg
      "долготой" -- instSg долготою
      "долготе" -- preposSg
      "долготе" -- prepos2Sg
      "долготы" -- nomPl
      "долгот" -- genPl
      "долготам" -- datPl
      "долготы" -- accPl
      "долготами" -- instPl
      "долготах" -- preposPl
      Fem
      Inanimate ;


    temperatura_N = mkN
      "температура" -- nomSg
      "температуры" -- genSg
      "температуре" -- datSg
      "температуру" -- accSg
      "температурой" -- instSg температурою
      "температуре" -- preposSg
      "температуре" -- prepos2Sg
      "температуры" -- nomPl
      "температур" -- genPl
      "температурам" -- datPl
      "температуры" -- accPl
      "температурами" -- instPl
      "температурах" -- preposPl
      Fem
      Inanimate ;


    intensivnost_N2 = mkN2 intensivnost_N ;
    intensivnost_N = mkN
       "интенсивность" -- nomSg
       "интенсивности" -- genSg
       "интенсивности" -- datSg
       "интенсивность" -- accSg
       "интенсивностью" -- instSg интенсивностию
       "интенсивности" -- preposSg
       "интенсивности" -- prepos2Sg
       "интенсивности" -- nomPl
       "интенсивностей" -- genPl
       "интенсивностям" -- datPl
       "интенсивности" -- accPl
       "интенсивностями" -- instPl
       "интенсивностях" -- preposPl
       Fem
       Inanimate ;

  veroyatnost_N2 = mkN2 veroyatnost_N ;
  veroyatnost_N = mkN
    "вероятность" -- nomSg
    "вероятности" -- genSg
    "вероятности" -- datSg
    "вероятность" -- accSg
    "вероятностью" -- instSg вероятностию
    "вероятности" -- preposSg
    "вероятности" -- prepos2Sg
    "вероятности" -- nomPl
    "вероятностей" -- genPl
    "вероятностям" -- datPl
    "вероятности" -- accPl
    "вероятностями" -- instPl
    "вероятностях" -- preposPl
    Fem
    Inanimate ;

   vlazhnost_N= mkN
      "влажность" -- nomSg
      "влажности" -- genSg
      "влажности" -- datSg
      "влажность" -- accSg
      "влажностью" -- instSg влажностию
      "влажности" -- preposSg
      "влажности" -- prepos2Sg
      "влажности" -- nomPl
      "влажностей" -- genPl
      "влажностям" -- datPl
      "влажности" -- accPl
      "влажностями" -- instPl
      "влажностях" -- preposPl
      Fem
      Inanimate ;

  skorost_N = mkN
      "скорость" -- nomSg
      "скорости" -- genSg
      "скорости" -- datSg
      "скорость" -- accSg
      "скоростью" -- instSg скоростию
      "скорости" -- preposSg
      "скорости" -- prepos2Sg
      "скорости" -- nomPl
      "скоростей" -- genPl
      "скоростям" -- datPl
      "скорости" -- accPl
      "скоростями" -- instPl
      "скоростях" -- preposPl
      Fem
      Inanimate ;



  napravlenie_N = mkN
      "направление" -- nomSg
      "направления" -- genSg
      "направлению" -- datSg
      "направление" -- accSg
      "направлением" -- instSg
      "направлении" -- preposSg
      "направлении" -- prepos2Sg
      "направления" -- nomPl
      "направлений" -- genPl
      "направлениям" -- datPl
      "направления" -- accPl
      "направлениями" -- instPl
      "направлениях" -- preposPl
      Neut 
      Inanimate ;



  cover_N = mkN
      "покров" -- nomSg
      "покрова" -- genSg
      "покрову" -- datSg
      "покров" -- accSg
      "покровом" -- instSg
      "покрове" -- preposSg
      "покрове" -- prepos2Sg
      "покровы" -- nomPl
      "покровов" -- genPl
      "покровам" -- datPl
      "покровы" -- accPl
      "покровами" -- instPl
      "покровах" -- preposPl
      Masc
      Inanimate ;

  koncentraciya_N2 = mkN2 koncentraciya_N ;
  koncentraciya_N = mkN
      "концентрация" -- nomSg
      "концентрации" -- genSg
      "концентрации" -- datSg
      "концентрацию" -- accSg
      "концентрацией" -- instSg концентрациею
      "концентрации" -- preposSg
      "концентрации" -- prepos2Sg
      "концентрации" -- nomPl
      "концентраций" -- genPl
      "концентрациям" -- datPl
      "концентрации" -- accPl
      "концентрациями" -- instPl
      "концентрациях" -- preposPl
      Fem 
      Inanimate ;

 

  davlenie_N = mkN
      "давление" -- nomSg
      "давления" -- genSg
      "давлению" -- datSg
      "давление" -- accSg
      "давлением" -- instSg
      "давлении" -- preposSg
      "давлении" -- prepos2Sg
      "давления" -- nomPl
      "давлений" -- genPl
      "давлениям" -- datPl
      "давления" -- accPl
      "давлениями" -- instPl
      "давлениях" -- preposPl
      Neut 
      Inanimate ;


  ozon_N = mkN
      "озон" -- nomSg
      "озона" -- genSg
      "озону" -- datSg
      "озон" -- accSg
      "озоном" -- instSg
      "озоне" -- preposSg
      "" -- prepos2Sg
      "" -- nomPl
      "" -- genPl
      "" -- datPl
      "" -- accPl
      "" -- instPl
      "" -- preposPl
      Masc
      Inanimate ;


    uroven_N2 = mkN2 uroven_N ;
    uroven_N = mkN
      "уровень" -- nomSg
      "уровня" -- genSg
      "уровню" -- datSg 
      "уровень" -- accSg
      "уровнем" -- instSg
      "уровне" -- preposSg
      "уровне" -- prepos2Sg
      "уровни" -- nomPl
      "уровней" -- genPl
      "уровням" -- datPl
      "уровни" -- accPl
      "уровнями" -- instPl
      "уровнях" -- preposPl
      Masc
      Inanimate ;


    more_N = mkN
      "море" -- nomSg
      "моря" -- genSg
      "морю" -- datSg 
      "море" -- accSg
      "морем" -- instSg
      "море" -- preposSg
      "море" -- prepos2Sg
      "моря" -- nomPl
      "морей" -- genPl
      "морям" -- datPl
      "моря" -- accPl
      "морями" -- instPl
      "морях" -- preposPl
      Neut
      Inanimate ;


    nebo_N = mkN
      "небо" -- nomSg
      "неба" -- genSg
      "небу" -- datSg 
      "небо" -- accSg
      "небом" -- instSg
      "небе" -- preposSg
      "небе" -- prepos2Sg
      "небеса" -- nomPl
      "небес" -- genPl
      "небесам" -- datPl
      "небеса" -- accPl
      "небесами" -- instPl
      "небесах" -- preposPl
      Neut
      Inanimate ;

 
    veter_N = mkN
      "ветер" -- nomSg
      "ветра" -- genSg
      "ветру" -- datSg 
      "ветер" -- accSg
      "ветром" -- instSg
      "ветре" -- preposSg
      "ветру" -- prepos2Sg
      "ветры" -- nomPl ветра
      "ветров" -- genPl
      "ветрам" -- datPl
      "ветра" -- accPl
      "ветрами" -- instPl
      "ветрах" -- preposPl
      Masc
      Inanimate ;
 

    den_N = mkN
      "день" -- nomSg
      "дня" -- genSg дню
      "дню" -- datSg 
      "дня" -- accSg
      "днём" -- instSg
      "дне" -- preposSg
      "дне" -- prepos2Sg
      "дни" -- nomPl
      "дней" -- genPl
      "дням" -- datPl
      "дней" -- accPl
      "днями" -- instPl
      "днях" -- preposPl
      Masc
      Inanimate ;

 
    noch_N = mkN
      "ночь" -- nomSg
      "ночи" -- genSg
      "ночи" -- datSg 
      "ночь" -- accSg
      "ночью" -- instSg
      "ночи" -- preposSg
      "ночи" -- prepos2Sg
      "ночи" -- nomPl
      "ночей" -- genPl
      "ночам" -- datPl
      "ночи" -- accPl
      "ночами" -- instPl
      "ночах" -- preposPl
      Fem
      Inanimate ;

 


    Gothenburg_PN = mkPN "Гётеборг" Masc Sg Inanimate ;
    Osaka_PN      = mkPN "Осака" Fem Sg Inanimate ;







  ponedelnik_N = mkN
      "понедельник" -- nomSg
      "понедельника" -- genSg
      "понедельнику" -- datSg 
      "понедельник" -- accSg
      "понедельником" -- instSg
      "понедельнике" -- preposSg
      "понедельнике" -- prepos2Sg
      "понедельники" -- nomPl
      "понедельников" -- genPl
      "понедельникам" -- datPl
      "понедельники" -- accPl
      "понедельниками" -- instPl
      "понедельниках" -- preposPl
      Masc
      Inanimate ;

  vtornik_N = mkN
      "вторник" -- nomSg
      "вторника" -- genSg
      "вторнику" -- datSg 
      "вторник" -- accSg
      "вторником" -- instSg
      "вторнике" -- preposSg
      "вторнике" -- prepos2Sg
      "вторники" -- nomPl
      "вторников" -- genPl
      "вторникам" -- datPl
      "вторники" -- accPl
      "вторниками" -- instPl
      "вторниках" -- preposPl
      Masc
      Inanimate ;

  sreda_N = mkN
      "среда" -- nomSg
      "среды" -- genSg
      "среде" -- datSg 
      "среду" -- accSg
      "средой" -- instSg средою
      "среде" -- preposSg
      "среде" -- prepos2Sg
      "среды" -- nomPl
      "сред" -- genPl
      "средам" -- datPl
      "среды" -- accPl
      "средами" -- instPl
      "средах" -- preposPl
      Fem
      Inanimate ;

  chetverg_N = mkN
      "четверг" -- nomSg
      "четверга" -- genSg
      "четвергу" -- datSg 
      "четверг" -- accSg
      "четвергом" -- instSg
      "четверге" -- preposSg
      "четверге" -- prepos2Sg
      "четверги" -- nomPl
      "четвергов" -- genPl
      "четвергам" -- datPl
      "четверги" -- accPl
      "четвергами" -- instPl
      "четвергах" -- preposPl
      Masc
      Inanimate ;

  pyatnicza_N = mkN
      "пятница" -- nomSg
      "пятницы" -- genSg
      "пятнице" -- datSg 
      "пятницу" -- accSg
      "пятницей" -- instSg пятницею
      "пятнице" -- preposSg
      "пятнице" -- prepos2Sg
      "пятницы" -- nomPl
      "пятниц" -- genPl
      "пятницам" -- datPl
      "пятницы" -- accPl
      "пятницами" -- instPl
      "пятницах" -- preposPl
      Fem
      Inanimate ;

  subbota_N = mkN
      "суббота" -- nomSg
      "субботы" -- genSg
      "субботе" -- datSg 
      "субботу" -- accSg
      "субботой" -- instSg субботою
      "субботе" -- preposSg
      "субботе" -- prepos2Sg
      "субботы" -- nomPl
      "суббот" -- genPl
      "субботам" -- datPl
      "субботы" -- accPl
      "субботами" -- instPl
      "субботах" -- preposPl
      Fem
      Inanimate ;

  voskresene_N = mkN
      "воскресение" -- nomSg
      "воскресения" -- genSg
      "воскресению" -- datSg 
      "воскресение" -- accSg
      "воскресением" -- instSg
      "воскресении" -- preposSg
      "воскресении" -- prepos2Sg
      "воскресения" -- nomPl
      "воскресений" -- genPl
      "воскресениям" -- datPl
      "воскресения" -- accPl
      "воскресениями" -- instPl
      "воскресениях" -- preposPl
      Neut
      Inanimate ;


  yanvar_N = mkN
      "январь" -- nomSg
      "января" -- genSg
      "январю" -- datSg 
      "январь" -- accSg
      "январем" -- instSg
      "январе" -- preposSg
      "январе" -- prepos2Sg
      "январи" -- nomPl
      "январей" -- genPl
      "январям" -- datPl
      "январи" -- accPl
      "январями" -- instPl
      "январях" -- preposPl
      Masc
      Inanimate ;

 
  fevral_N = mkN
      "февраль" -- nomSg
      "февраля" -- genSg
      "февралю" -- datSg 
      "февраль" -- accSg
      "февралем" -- instSg
      "феврале" -- preposSg
      "феврале" -- prepos2Sg
      "феврали" -- nomPl
      "февралей" -- genPl
      "февралям" -- datPl
      "феврали" -- accPl
      "февралями" -- instPl
      "февралях" -- preposPl
      Masc
      Inanimate ;

 
  mart_N = mkN
      "март" -- nomSg
      "марта" -- genSg
      "марту" -- datSg 
      "март" -- accSg
      "мартом" -- instSg
      "марте" -- preposSg
      "марте" -- prepos2Sg
      "марты" -- nomPl
      "мартов" -- genPl
      "мартам" -- datPl
      "марты" -- accPl
      "мартами" -- instPl
      "мартах" -- preposPl
      Masc
      Inanimate ;

  
  aprel_N = mkN
      "апрель" -- nomSg
      "апреля" -- genSg
      "апрелю" -- datSg 
      "апрель" -- accSg
      "апрелем" -- instSg
      "апреле" -- preposSg
      "апреле" -- prepos2Sg
      "апрели" -- nomPl
      "апрелей" -- genPl
      "апрелям" -- datPl
      "апрели" -- accPl
      "апрелями" -- instPl
      "апрелях" -- preposPl
      Masc
      Inanimate ;


  maj_N = mkN
    "май" -- nomSg
    "мая" -- genSg
    "маю" -- datSg 
    "май" -- accSg
    "маем" -- instSg
    "мае" -- preposSg
    "мае" -- prepos2Sg
    "маи" -- nomPl
    "маев" -- genPl
    "маям" -- datPl
    "маи" -- accPl
    "маями" -- instPl
    "маях" -- preposPl
    Masc
    Inanimate ;


 
  iyun_N = mkN
      "июнь" -- nomSg
      "июня" -- genSg
      "июню" -- datSg 
      "июнь" -- accSg
      "июнем" -- instSg
      "июне" -- preposSg
      "июне" -- prepos2Sg
      "июни" -- nomPl
      "июней" -- genPl
      "июням" -- datPl
      "июни" -- accPl
      "июнями" -- instPl
      "июнях" -- preposPl
      Masc
      Inanimate ;

 
  iyul_N = mkN
      "июль" -- nomSg
      "июля" -- genSg
      "июлю" -- datSg 
      "июль" -- accSg
      "июлем" -- instSg
      "июле" -- preposSg
      "июле" -- prepos2Sg
      "июли" -- nomPl
      "июлей" -- genPl
      "июлям" -- datPl
      "июли" -- accPl
      "июлями" -- instPl
      "июля" -- preposPl
      Masc
      Inanimate ;

 
  avgust_N = mkN
      "август" -- nomSg
      "августа" -- genSg
      "августу" -- datSg 
      "август" -- accSg
      "августом" -- instSg
      "августе" -- preposSg
      "августе" -- prepos2Sg
      "августы" -- nomPl
      "августов" -- genPl
      "августам" -- datPl
      "августы" -- accPl
      "августами" -- instPl
      "августах" -- preposPl
      Masc
      Inanimate ;

 
  sentyabr_N = mkN
      "сентябрь" -- nomSg
      "сентября" -- genSg
      "сентябрю" -- datSg 
      "сентябрь" -- accSg
      "сентябрем" -- instSg
      "сентябре" -- preposSg
      "сентябре" -- prepos2Sg
      "сентябри" -- nomPl
      "сентябрей" -- genPl
      "сентябрям" -- datPl
      "сентябри" -- accPl
      "сентябрями" -- instPl
      "сентябрях" -- preposPl
      Masc
      Inanimate ;

 
  oktyabr_N = mkN
      "октябрь" -- nomSg
      "октября" -- genSg
      "октябрю" -- datSg 
      "октябрь" -- accSg
      "октябрём" -- instSg
      "октябре" -- preposSg
      "октябре" -- prepos2Sg
      "октябри" -- nomPl
      "октябрей" -- genPl
      "октябрям" -- datPl
      "октябри" -- accPl
      "октябрями" -- instPl
      "октябрях" -- preposPl
      Masc
      Inanimate ;

 
  noyabr_N = mkN
      "ноябрь" -- nomSg
      "ноября" -- genSg
      "ноябрю" -- datSg 
      "ноябрь" -- accSg
      "ноябрём" -- instSg
      "ноябре" -- preposSg
      "ноябре" -- prepos2Sg
      "ноябри" -- nomPl
      "ноябрей" -- genPl
      "ноябрям" -- datPl
      "ноябри" -- accPl
      "ноябрями" -- instPl
      "ноябрях" -- preposPl
      Masc
      Inanimate ;

 
  decabr_N = mkN
      "декабрь" -- nomSg
      "декабря" -- genSg
      "декабрю" -- datSg 
      "декабрь" -- accSg
      "декабрём" -- instSg
      "декабре" -- preposSg
      "декабре" -- prepos2Sg
      "декабри" -- nomPl
      "декабрей" -- genPl
      "декабрям" -- datPl
      "декабри" -- accPl
      "декабрями" -- instPl
      "декабрях" -- preposPl
      Masc 
      Inanimate ;


    empty_N = mkN "" ;
    empty_Conj = mkConj "" "" Sg ;
    comma_Conj = mkConj "" "," Sg ;

    s_Gen_Prep  = mkPrep "с" Gen ;
    s_Acc_Prep  = mkPrep "с" Acc ;
    s_Inst_Prep = mkPrep "с" Inst ;

    so_Gen_Prep  = mkPrep "со" Gen ;
    so_Acc_Prep  = mkPrep "со" Acc ;
    so_Inst_Prep = mkPrep "со" Inst ;

    v_Acc_Prep = mkPrep "в" Acc ;
    v_Prepos_Prep = mkPrep "в" (Prepos PrepVNa) ;

    po_Dat_Prep = mkPrep "по" Dat ;
    po_Acc_Prep = mkPrep "по" Acc ;
    po_Prepos_Prep = mkPrep "по" (Prepos PrepOther) ;

    na_Acc_Prep       = mkPrep "на" Acc ;
    na_Prepos_Prep    = mkPrep "на" (Prepos PrepOther) ;
    na_PreposVNa_Prep = mkPrep "на" (Prepos PrepVNa) ;

    net_Gen_Prep = mkPrep "нет" Gen ;

    empty_Prep = mkPrep "" Nom ;
}
