resource DocumentPlanResource = {

 param DiscRel = Elaboration | Exemplification | Contrast | NarrativeSequence ;

 oper verbalizeDR : DiscRel -> { SStr} = \dr

  