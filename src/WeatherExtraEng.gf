resource WeatherExtraEng = open CatEng, ResEng in {
  oper
    colon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ": "  ++ s2.s} ;
    semicolon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ "; "  ++ s2.s} ;
    mkUnitNP : Str -> Str -> NP = \v,u -> lin NP {s = \\_ => v ++ u; a = AgP3Sg Neutr} ;
    mkValueNP : Str -> NP = \v -> lin NP {s = \\_ => v; a = AgP3Sg Neutr} ;
}
