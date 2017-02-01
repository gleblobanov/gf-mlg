resource DocumentPlanResource = {

 param DiscRel = Elaboration | Exemplification | Contrast | NarrativeSequence | Empty ;

 oper verbalizeDR : DiscRel -> { s : Str }
        = \dr -> { s = table { Elaboration       => "; namely, " ;
                               Exemplification   => "; for example, " ; 
                               Constrast         => "; contrarily, " ;
                               NarrativeSequence => ", and" ;
                               Empty             => ""  } ! dr } ;

 } 