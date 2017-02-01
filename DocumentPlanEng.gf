concrete DocumentPlanEng of DocumentPlan = open DocumentPlanResource, GrammarEng, ResEng in {

lincat
  Message = {s : Str} ;
  DocumentPlan = { s : Str ; cnsts : Constituents } ;
  DiscourseRelation = DiscRel ;
  Constituents = { s : Str ; ncl : DocumentPlan ; dr : DiscRel ; stl : DocumentPlan } ;

lin

  ConstituentsNclStl ncl' dr' stl' = { s = ncl'.s ++ verbalizeDR dr' ++ stl'.s ;
                                 ncl = ncl'; dr = dr' ; stl = stl' } ;
  DocumentPlanCnsts cnsts' = { s = cnsts'.s ; cnsts = cnsts' } ;


lincat
  
  City = PN ;
  Temperature = Digits ;
  

lin
    
  Kaliningrad = {s = table {Nom => "Kaliningrad"; Gen => "Kaliningrad's"}; g = Neutr} ;
  Gothenburg  = {s = table {Nom => "Gothenburg"; Gen => "Gothenburg's"}; g = Neutr} ;

  MessageCityTemperature city temp = {s = "In" ++ city.s ! Nom ++ "the temperature is" ++ "C."} ;



-- lin MessageCity cit temp = mkS cit temp ; 
}
