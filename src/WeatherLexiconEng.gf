resource WeatherLexiconEng = open LexiconEng, ParadigmsEng in {

  oper

    blow_V = mkV "blow" ;
    snow_V = mkV "snow" ;
    sleet_V = mkV "sleet" ;
    feel_like_V2 = mkV2 feel_V like_Prep ;
    feel_V = mkV "feel" ;
    rain_V0         = LexiconEng.rain_V0 ;

    remarkably_high_A = mkA "remarkably high" ; -- TODO Transform to AP
    slightly_high_A  = mkA "slightly high" ; -- TODO Transform to AP
    remarkably_low_A   = mkA "remarkably low" ; -- TODO Transform to AP
    slightly_low_A     = mkA "slightly low" ; -- TODO Transform to AP

    equal_A         = mkA "equal" ;
    equal_to_A2     = mkA2 equal_A to_Prep ;
    strong_A        = mkA "strong" ;
    calm_A          = mkA "calm" ;
    whole_A         = mkA "whole" ;
    cold_A          = LexiconEng.cold_A ;
    hot_A           = LexiconEng.hot_A ;
    warm_A          = LexiconEng.warm_A ;
    atmospheric_A   = mkA "atmospheric" ;
    columnar_A      = mkA "columnar" ;
    apparent_A      = mkA "apparent" ;
    freezing_A      = mkA "freezing" ;
    chilly_A        = mkA "chilly" ;
    boiling_A       = mkA "boiling" ;
    cloudy_A        = mkA "cloudy" ;
    foggy_A         = mkA "foggy" ;
    clear_A         = mkA "clear" ;
    unknown_A       = mkA "unknown" ;
    mild_A          = mkA "mild" ;
    cool_A          = mkA "cool" ;
    high_A          = mkA "high" ;
    low_A           = mkA "low" ;
    moderate_A      = mkA "moderate" ;
    uncomfortable_A = mkA "uncomfortable" ;
    comfortable_A   = mkA "comfortable" ;
    scattered_A     = mkA "scattered" ;
    broken_A        = mkA "broken" ;
    overcast_A      = mkA "overcast" ;
    light_A         = mkA "light" ;
    gentle_A        = mkA "gentle" ;
    fresh_A         = mkA "fresh" ;
    relative_A      = mkA "relative" ;
    windy_A         = mkA "windy" ;
    average_A       = mkN "average" ;

    partly_AdA    = mkAdA "partly" ;
    extremely_AdA = mkAdA "extremely" ;
    severely_AdA  = mkAdA "severely" ;
    somewhat_AdA  = mkAdA "somewhat" ;
    scarcely_AdA  = mkAdA "scarcely" ;
    quite_AdA     = mkAdA "quite" ;
    moderately_AdA = mkAdA "moderately" ;
    slightly_AdA = mkAdA "slightly" ;
    much_AdA = mkAdA "much" ;

    respectively_Adv = mkAdv "respectively" ;

    date_N          = mkN "date" ;
    average_N       = mkN "average" ;
    density_N       = mkN "density" ;
    precipitation_N = mkN "precipitation" ;
    breeze_N        = mkN "breeze" ;
    gale_N          = mkN "gale" ;
    storm_N         = mkN "storm" ;
    hurricane_N     = mkN "storm" ;
    air_N           = mkN "air" ;
    temperature_N   = mkN "temperature" ;
    Latitude_n      = mkN "latitude" ;
    longitude_N     = mkN "longitude" ;
    intensity_N     = mkN "intensity" ;
    probability_N   = mkN "probability" ;
    dew_point_N     = mkN "dew point" ;
    humidity_N      = mkN "humidity" ;
    speed_N         = mkN "speed" ;
    bearing_N       = mkN "bearing" ;
    cover_N         = mkN "cover" ;
    pressure_N      = mkN "pressue"  ;
    ozone_N         = mkN "ozone" ;

    Monday_PN        = mkPN "Monday" ;
    Tuesday_PN       = mkPN "Tuesday" ;
    Wednesday_PN     = mkPN "Wednesday" ;
    Thursday_PN      = mkPN "Thursday" ;
    Friday_PN        = mkPN "Friday" ;
    Saturday_PN      = mkPN "Saturday" ;
    Sunday_PN        = mkPN "Sunday" ;

    January_PN   = mkPN "January" ;
    February_PN  = mkPN "February" ;
    March_PN     = mkPN "March" ;
    April_PN     = mkPN "April" ;
    May_PN       = mkPN "May" ;
    June_PN      = mkPN "June" ;
    July_PN      = mkPN "July" ;
    August_PN    = mkPN "August" ;
    September_PN = mkPN "September" ;
    October_PN   = mkPN "October" ;
    November_PN  = mkPN "November" ;
    December_PN  = mkPN "December" ;
 
    Gothenburg_PN = mkPN "Gothenburg" ;
    Osaka_PN      = mkPN "Osaka" ;

    level_N         = mkN "level" ;
    sea_N           = LexiconEng.sea_N ;
    sky_N           = LexiconEng.sky_N ;
    wind_N          = LexiconEng.wind_N ;
    day_N           = LexiconEng.day_N ;
    night_N         = LexiconEng.night_N ;

    empty_N = mkN "" ;

    to_Prep = mkPrep "to" ;
    of_Prep = mkPrep "of" ;
    at_Prep = mkPrep "at" ;
    like_Prep = mkPrep "like" ;
    empty_Prep = mkPrep "" ;
    below_Prep = mkPrep "below" ;
    above_Prep = mkPrep "above" ;
    near_Prep = mkPrep "near" ;

    empty_Conj = mkConj "" ;
    comma_Conj = mkConj "," ;
} 
