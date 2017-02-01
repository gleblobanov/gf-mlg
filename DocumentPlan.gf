abstract DocumentPlan = open DocumentPlanResource in {

-- flags startcat = Phrase ;

cat
    Message ;
    -- Constituent ;
    Constituents ;
    -- Title ;
    DocumentPlan ;
    DiscourseRelation ;


fun
  
  ConstituentsNclStl : DocumentPlan -> DiscourseRelation -> DocumentPlan -> Constituents ;

  DocumentPlanCnsts : Constituents -> DocumentPlan ;

cat
    City ;
    -- Date ;
    Temperature ;

fun Kaliningrad, Gothenburg : City ;

fun MessageCityTemperature : City -> Temperature -> Message ;
     

}
