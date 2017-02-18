abstract RST = {

  cat Span ;      -- A text span
      Nucleus ;   -- Nucleus of a schema
      NucleusList ;
      JointNucleusList ;
      Satellite ; -- Satellite of a schema
      SatelliteList ;


      Schema ;
      
  fun



    Nuc0 : Nucleus ;
    Nuc' : Schema -> Nucleus   ;
    Nuc  : Span   -> Nucleus   ;

    Sat0 : Satellite ;
    Sat' : Schema -> Satellite ;  
    Sat  : Span   -> Satellite ;

    BNuc : Nucleus -> NucleusList ;
    CNuc : Nucleus -> NucleusList -> NucleusList ;

    JBNuc : Nucleus -> JointNucleusList ;
    JCNuc : Nucleus -> JointNucleusList -> JointNucleusList ;

    BSat : Satellite -> SatelliteList ;
    CSat : Satellite -> SatelliteList -> SatelliteList ;

    
    Circumstance : Nucleus -> SatelliteList -> Schema ;

    Solutionhood : Nucleus -> SatelliteList -> Schema ;

    Elaboration  : Nucleus -> SatelliteList -> Schema ;

    Background   : Nucleus -> SatelliteList -> Schema ;

    VolitionalCause     : Nucleus -> SatelliteList -> Schema ;
    NonVolitionalCause  : Nucleus -> SatelliteList -> Schema ;
    VolitionalResult    : Nucleus -> SatelliteList -> Schema ;
    NonVolitionalResult : Nucleus -> SatelliteList -> Schema ;
    Purpose             : Nucleus -> SatelliteList -> Schema ;

    Enablement     : Nucleus -> SatelliteList -> Schema ;
    Motivation     : Nucleus -> SatelliteList -> Schema ;

    Evidence       : Nucleus -> SatelliteList -> Schema ;
    Justify        : Nucleus -> SatelliteList -> Schema ;

    Antithesis     : Nucleus -> SatelliteList -> Schema ;
    Concession     : Nucleus -> SatelliteList -> Schema ;

    Condition      : Nucleus -> SatelliteList -> Schema ;
    Otherwise      : Nucleus -> SatelliteList -> Schema ;

    Interpretation : Nucleus -> SatelliteList -> Schema ;
    Evaluation     : Nucleus -> SatelliteList -> Schema ;

    Restatement    : Nucleus -> SatelliteList -> Schema ;
    Summary        : Nucleus -> SatelliteList -> Schema ;

    Contrast : Nucleus -> Nucleus  -> Schema ;

    Joint    : JointNucleusList -> Schema ;
    Sequence : NucleusList -> Schema ;
    
    
}