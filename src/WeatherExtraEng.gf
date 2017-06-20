resource WeatherExtraEng = open CatEng, ResEng, SyntaxEng in {
  oper
    colon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ": "  ++ s2.s} ;
    fullstop : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ". "  ++ s2.s} ;
    semicolon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ "; "  ++ s2.s} ;
    mkUnitNP : Str -> Str -> NP = \v,u -> lin NP {s = \\_ => v ++ u; a = AgP3Sg Neutr} ;
    mkUnitAdv : Str -> Str -> Adv = \v,u -> lin Adv {s = v ++ u} ;
    mkValueNP : Str -> NP = \v -> lin NP {s = \\_ => v; a = AgP3Sg Neutr} ;
    which_RP' : RP = lin RP {s = \\_ => "which";  a = RNoAg } ;
    RClAdv : RCl -> Adv -> RCl = \ rcl , adv -> lin RCl {s = \\ x1 , x2 , x3 , x4 => rcl.s ! x1 ! x2 !x3 ! x4 ++ adv.s ; c = rcl.c } ; -- TODO change name
    mkS : S -> Adv -> S = \ s', a -> lin S { s = s'.s ++ a.s } ;
    prnths : NP -> NP = \ np -> lin NP {s = \\ x => "(" ++ np.s ! x ++ ")" ; a = np.a } ;
    -- mkAdv : Prep -> NP -> Adv = \ prep, np = lin Adv {s = prep.s ++ np.s} ;
    mkNPComma : NP -> NP -> NP = \ np1, np2 -> lin NP { s = table {c => np1.s ! c ++ "," ++ np2.s ! c} ; a = AgP1 Pl } ; -- TODO what is AgP1 ? 
    mkNPNoPunct : NP -> NP -> NP = \ np1, np2 -> lin NP { s = table {c => np1.s ! c ++ " " ++ np2.s ! c} ; a = AgP1 Pl } ; -- TODO what is AgP1 ? 



}
