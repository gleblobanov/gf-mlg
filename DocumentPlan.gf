abstract DocumentPlan = open DocumentPlanResource in {

-- flags startcat = Phrase ;

cat
    Message ;
    Nucleus ;
    Satellite ;
    -- Constituent ;
    Constituents ;
    -- Title ;
    DocumentPlan ;
    DiscourseRelation ;


fun

  NucleusDP : DocumentPlan -> Nucleus ;
  NucleusM  : Message      -> Nucleus ;

  SatelliteDP : DiscourseRelation -> DocumentPlan -> Satellite ;
  SatelliteM  : DiscourseRelation -> Message      -> Satellite ;

  ConstituentsNS : Nucleus -> Satellite -> Constituents ;

  DocumentPlanCnsts : Constituents -> DocumentPlan ;


cat
    City ;
    -- Date ;
    Temperature ;

fun Kaliningrad, Gothenburg : City ;

fun MessageCityTemperature : City -> Temperature -> Message ;
     

}
