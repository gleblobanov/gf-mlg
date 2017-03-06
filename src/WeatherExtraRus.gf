resource WeatherExtraRus = open CatRus, ResRus, Prelude in {
  oper
    colon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ": "  ++ s2.s} ;
    mkUnitNP : Str -> Str -> NP = \v,u -> lin NP {s = \\_ => v ++ u; n = Sg ; p = P1 ; g = PNoGen ; anim = Inanimate ; pron = False } ;
    mkValueNP : Str -> NP = \v -> lin NP {s = \\_ => v; n = Sg ; p = P1 ; g = PNoGen ; anim = Inanimate ; pron = False } ;
    mkAdA : Str -> AdA = \v -> lin AdA {s = v } ;
    mkConj : Str -> Str -> Number -> Conj = \v1,v2,num -> lin Conj { s1 = v1 ; s2 = v2 ; n = num } ;
    mkClNP : NP -> Cl = \ np -> lin Cl { s = \\_ => \\_ => np.s ! PF Nom No NonPoss } ;
    mkN2CN : CN -> N2 = \ cn -> lin N2 { s = \\_ => cn.s ! NF Sg Nom nom ; g = cn.g ; anim = cn.anim ; c2 = { s = "" ; c = Gen } } ;
}