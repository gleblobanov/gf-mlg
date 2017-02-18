concrete RSTEng of RST = open Prelude, ParadigmsEng, SyntaxEng, ResEng in {


  lincat

    Span = Phr;
    Nucleus = Phr ;
    NucleusList = Phr ;
    JointNucleusList = Phr ;
    Satellite = Phr ;
    SatelliteList = Phr ;
    Schema = Phr ;


  lin

    Nuc0   = lin Phr { s = "" } ;
    Nuc' n = lin Phr n ;
    Nuc  n = lin Phr n ;

    Sat0   = lin Phr { s = "" } ;
    Sat' s = lin Phr s ;
    Sat  s = lin Phr s ;


    BNuc n = n ;
    CNuc n nl = lin Phr { s = n.s  ++ nl.s } ;


    JBNuc n = n ;
    JCNuc n nl = lin Phr { s = n.s ++ "\n" ++ nl.s } ;


    BSat s = s ;
    CSat s' sl = lin Phr { s = s'.s ++ sl.s } ;

    
    Circumstance n sl = lin Phr { s = n.s ++ sl.s } ;

    Solutionhood n sl = lin Phr { s = n.s ++ sl.s } ;

    Elaboration  n sl = lin Phr { s = n.s ++ sl.s } ;

    Background   n sl = lin Phr { s = n.s ++ sl.s } ;

    VolitionalCause      n sl = lin Phr { s = n.s ++ sl.s } ;
    NonVolitionalCause   n sl = lin Phr { s = n.s ++ because_Subj.s ++ sl.s } ;
    VolitionalResult     n sl = lin Phr { s = n.s ++ sl.s } ;
    NonVolitionalResult  n sl = lin Phr { s = n.s ++ sl.s } ;
    Purpose              n sl = lin Phr { s = n.s ++ sl.s } ;

    Enablement n sl = lin Phr { s = n.s ++ sl.s } ;
    Motivation n sl = lin Phr { s = n.s ++ sl.s } ;

    Evidence n sl = lin Phr { s = n.s ++ sl.s } ;
    Justify n sl = lin Phr { s = n.s ++ sl.s } ;

    Antithesis n sl = lin Phr { s = n.s ++ sl.s } ;
    Concession n sl = lin Phr { s = n.s ++ sl.s } ;

    Condition n sl = lin Phr { s = n.s ++ sl.s } ;
    Otherwise n sl = lin Phr { s = n.s ++ sl.s } ;

    Interpretation  n sl = lin Phr { s = n.s ++ sl.s } ;
    Evaluation n sl = lin Phr { s = n.s ++ sl.s } ;

    Restatement n sl = lin Phr { s = n.s ++ sl.s } ;
    Summary  n sl = lin Phr { s = n.s ++ sl.s } ;    

    Contrast n1 n2 = lin Phr { s = n1.s ++ n2.s } ;

    Joint nl = nl ; 
    Sequence nl = nl ;
    
 

    
}
