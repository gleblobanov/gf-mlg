concrete DocumentPlanEng of DocumentPlan = open DocumentPlanResource, GrammarEng, ResEng in {

lincat
  Message = S ;
  DocumentPlan = { s : Str ; cnsts : Constituents } ;
  DiscourseRelation = DiscRel ;
  Nucleus = { s : Str ; dp : DocumentPlan ; m : Message } ;
  Satellite = { s : Str ; dr : DiscRel ; dp : DocumentPlan ; m : Message } ;
  Constituents = { s : Str ; ncl : Nucleus ; stl : Satellite } ;


lin
  NucleusDP dp' = { s = dp'.s ; dp = dp' ; m = {} } ;
  NucleusM  m'  = { s = m'.s  ; dp = {}  ;  m = m' } ;

  SatelliteDP dr' dp' = { s = verbalizeDR dr' ++ dp'.s ; dr = dr' ; dp = dp' ; m = {} } ;
  SatelliteM  dr' m'  = { s = verbalizeDR dr' ++ m'.s  ; dr = dr' ; dp = {}  ; m = m' } ;

  ConstituentsNS ncl' stl' = { s = ncl'.s ++ stl'.s ; ncl = ncl' ; stl = stl' } ;

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
