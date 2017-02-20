resource WeatherExtraEng = open SyntaxEng in {
  oper

    colon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ": "  ++ s2.s} ;

}