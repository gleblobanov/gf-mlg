concrete RSTEng of RST = open Prelude, ParadigmsEng, SyntaxEng, ResEng in {

  lincat DocumentPlan = Text ;

  lincat Schema = Text ;

  lin mkBackground _ _ _ _ n s     = mkText n s ;
      mkInterpretation _ _ _ _ n s = mkText n s ;
      mkSequence _ _ n1 n2     = mkText n1 n2 ;
      mkJoint _ _ _ _ n1 n2        = mkText n1 n2 ;
      mkFirst _ _ _ s              = s ;
      mkSecond _ _ _ s             = s ;


  -- lincat
  --   Nucleus = Phr ;
  --   Satellite = Phr ;
  --   SatelliteList = Text ;
  --   Schema = Text ;


  -- lin
  --   BSat s = mkText s fullStopPunct emptyText ;
  --   CSat s' sl = mkText s' fullStopPunct sl ;

  --   Background n sl = mkText n fullStopPunct sl ;
  --   EmptySchema = emptyText ;

  --   EmptySatellite = lin Phr { s = "" } ;
  --   EmptyNucleus = lin Phr { s = "<>" } ;
}
