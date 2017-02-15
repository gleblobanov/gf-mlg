concrete WeatherRus of Weather = open ConstructorsRus, Prelude, ParadigmsRus, SyntaxRus, ResRus in {

lincat
  City = PN ;
  Temperature = NP ;

lin
  Kaliningrad = mkPN "Калининград" masculine singular inanimate ;
  Gothenburg  = mkPN "Гетеборг" masculine singular inanimate ;

  TemperatureValue v = lin NP {s = \\_ => v.s ++ "C"; n = Sg; p = P3;
                               g = PNoGen; anim=Inanimate; pron=False} ;

  MsgCityTemp city temp
    = mkS (ConstructorsRus.mkAdv (mkPrep "в" prepositional) (SyntaxRus.mkNP city))
          (mkS presentTense simultaneousAnt positivePol (mkCl (SyntaxRus.mkNP theSg_Det temperature_N) temp)) ;

oper
  temperature_N = mkN "температура" ;

}
