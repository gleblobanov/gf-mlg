abstract Weather = DocumentPlan ** {


  cat
    City ;
    Temperature ;

  fun Kaliningrad_PN, Gothenburg_PN : City ;
      TemperatureStr : String -> Temperature ;

      temperature_N : N ;
      c_N : N ;




  fun MsgCityTemp : City -> Temperature -> Utt ;
      MsgEmpt : Utt ; 

}