abstract Weather = {

  cat
    City ;
    Temperature ;
    Message ;

  fun Kaliningrad, Gothenburg : City ;
      TemperatureValue : Float -> Temperature ;

  fun MsgCityTemp : City -> Temperature -> Message ;

}
