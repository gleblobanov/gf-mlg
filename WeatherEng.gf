concrete WeatherEng of Weather = GrammarEng ** open ParadigmsEng in {

lincat
  
  City = PN ;
  Temperature = Str ;  

lin
    
  Kaliningrad_PN = mkPN "Kaliningrad" ;
  Gothenburg_PN  = mkPN "Gothenburg" ;

  temperature_N = mkN "temperature" ;

  TemperatureStr s' = s'.s ;

  c_N = mkN "C" ;
   
  MsgCityTemp city temp
    = UttS
    (AdvS (PrepNP (mkPrep "in") (UsePN city))
       (UseCl (TTAnt TPres ASimul) GrammarEng.PPos (PredVP (DetCN (DetQuant DefArt NumSg) (UseN temperature_N)) (UseComp (CompCN (AdjCN (PositA (mkA temp)) (UseN c_N)))))));


   MsgEmpt = { s = [] } ;

}
