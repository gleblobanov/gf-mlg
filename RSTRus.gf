concrete RSTRus of RST = open Prelude, ParadigmsRus, SyntaxRus, ResRus in {


  lincat

    Span = Phr ;
    Nucleus = S ;
    NucleusList = S ;
    JointNucleusList = S ;
    Satellite = S ;
    SatelliteList = S ;
    Schema = S ;


  lin

    Nuc0   = lin S { s = "" } ;
    Nuc' n = lin S n ;
    Nuc  n = lin S n ;

    Sat0   = lin S { s = "" } ;
    Sat' s = lin S s ;
    Sat  s = lin S s ;


    BNuc n = n ;
    CNuc n nl = lin S { s = n.s  ++ nl.s } ;


    JBNuc n = n ;
    JCNuc n nl = lin S { s = n.s ++ "\n" ++ nl.s } ;


    BSat s = s ;
    CSat s' sl = lin S { s = s'.s ++ sl.s } ;

    
    Circumstance n sl = lin S { s = n.s ++ sl.s } ;

    Solutionhood n sl = lin S { s = n.s ++ sl.s } ;

    Elaboration  n sl = lin S { s = n.s ++ sl.s } ;

    Background   n sl = lin S { s = n.s ++ sl.s } ;

    VolitionalCause      n sl = lin S { s = n.s ++ sl.s } ;
    NonVolitionalCause   n sl = lin S { s = n.s ++ because_Subj.s ++ sl.s } ;
    VolitionalResult     n sl = lin S { s = n.s ++ sl.s } ;
    NonVolitionalResult  n sl = lin S { s = n.s ++ sl.s } ;
    Purpose              n sl = lin S { s = n.s ++ sl.s } ;

    Enablement n sl = lin S { s = n.s ++ sl.s } ;
    Motivation n sl = lin S { s = n.s ++ sl.s } ;

    Evidence n sl = lin S { s = n.s ++ sl.s } ;
    Justify n sl = lin S { s = n.s ++ sl.s } ;

    Antithesis n sl = lin S { s = n.s ++ sl.s } ;
    Concession n sl = lin S { s = n.s ++ sl.s } ;

    Condition n sl = lin S { s = n.s ++ sl.s } ;
    Otherwise n sl = lin S { s = n.s ++ sl.s } ;

    Interpretation  n sl = lin S { s = n.s ++ sl.s } ;
    Evaluation n sl = lin S { s = n.s ++ sl.s } ;

    Restatement n sl = lin S { s = n.s ++ sl.s } ;
    Summary  n sl = lin S { s = n.s ++ sl.s } ;    

    Contrast n1 n2 = lin S { s = n1.s ++ n2.s } ;

    Joint nl = nl ; 
    Sequence nl = nl ;
    
 

    
}