concrete DocumentPlanEng of DocumentPlan = GrammarEng ** open DocumentPlanResource, Structural, Prelude in {

lincat
  DR = DiscRel ;
  TS = DiscRel => PConj ;
  
lin

  TNclStl t1 dr t2 = { s = toUpperFirst (t1.s) ++ "." ++ toUpperFirst ((ts dr).s) ++ toLowerFirst t2.s } ;  


  Msg2Text u = { s = toUpperFirst u.s ++ "." }

  Elbr = Elaboration ;
  Exmp = Exemplification ;
  Cntr = Contrast ;
  Sqnc = NarrativeSequence ;
  Empt = Empty ;

  ts = table { Elaboration => namely_PConj ;
               Exemplification => for_example_PConj ; 
               Contrast => but_PConj ;
               NarrativeSequence => and_PConj ; 
               Empty => NoPConj ;
  }

  namely_PConj = PConjConj (mkConj "namely") ;
  for_example_PConj = PConjConj (mkConj "for example") ;
  and_PConj = PConjConj and_Conj ;
  
 
}
