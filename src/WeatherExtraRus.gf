resource WeatherExtraRus = open CatRus, ResRus, Prelude in {
  oper
    colon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ": "  ++ s2.s} ;
    conj : S -> Conj -> S -> S = \ s1, c, s2 -> lin S { s= s1.s ++ c.s1 ++ s2.s} ;
    mkUnitNP : Str -> Str -> NP = \v,u -> lin NP {s = \\_ => v ++ u; n = Sg ; p = P1 ; g = PNoGen ; anim = Inanimate ; pron = False } ;
    mkValueNP : Str -> NP = \v -> lin NP {s = \\_ => v; n = Sg ; p = P1 ; g = PNoGen ; anim = Inanimate ; pron = False } ;
    mkAdA : Str -> AdA = \v -> lin AdA {s = v } ;
    mkConj : Str -> Str -> Number -> Conj = \v1,v2,num -> lin Conj { s1 = v1 ; s2 = v2 ; n = num } ;
    mkClNP : NP -> Cl = \ np -> lin Cl { s = \\_ => \\_ => np.s ! PF Nom No NonPoss } ;
    mkN2CN : CN -> N2 = \ cn -> lin N2 { s = \\_ => cn.s ! NF Sg Nom nom ; g = cn.g ; anim = cn.anim ; c2 = { s = "" ; c = Gen } } ;
    fullstop : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ ". "  ++ s2.s} ;
    chto_RP : RP = lin RP {s = \\_ =>\\_ =>\\_ => "что" } ;
    semicolon : S -> S -> S = \ s1, s2 -> lin S { s= s1.s ++ "; "  ++ s2.s} ;
    mkUnitAdv : Str -> Str -> Adv = \v,u -> lin Adv {s = v ++ u} ;
    RClAdv : RCl -> Adv -> RCl = \ rcl , adv -> lin RCl {s = \\ x1 , x2 , x3 , x4, x5 => rcl.s ! x1 ! x2 ! x3 ! x4 ! x5 ++ adv.s ; c = rcl.c } ; -- TODO change name
    mkS : S -> Adv -> S = \ s', a -> lin S { s = s'.s ++ a.s } ;
    prnths : NP -> NP = \ np -> lin NP {s = \\ x => "(" ++ np.s ! x ++ ")"  ; n = np.n ; p = np.p ;
           g = np.g ; anim = np.anim ;  pron = np.pron  } ;
    -- mkAdv : Prep -> NP -> Adv = \ prep, np = lin Adv {s = prep.s ++ np.s} ;
    mkNPComma : NP -> NP -> NP = \ np1, np2 -> lin NP { s = table {pf => np1.s ! pf ++ "," ++ np2.s ! pf} ; n = Pl ; p = np1.p ;
           g = np1.g ; anim = np1.anim ;  pron = np1.pron } ;
    mkNPConj : NP -> Conj -> NP -> NP = \ np1, c, np2 -> lin NP { s = table {pf => np1.s ! pf ++ c.s1 ++ np2.s ! pf} ; n = Pl ; p = np1.p ;
           g = np1.g ; anim = np1.anim ;  pron = np1.pron } ;

    mkNPNoPunct : NP -> NP -> NP = \ np1, np2 -> lin NP { s = table {pf => np1.s ! pf ++ " " ++ np2.s ! pf} ; n = Pl ; p = np1.p ;
           g = np1.g ; anim = np1.anim ;  pron = np1.pron } ;
    mkAP' : AP -> NP -> AP = \ap,np -> lin AP {s = table {af => (ap.s ! af ++ (np.s ! (PF Gen No NonPoss))) } ; p = ap.p } ;



}