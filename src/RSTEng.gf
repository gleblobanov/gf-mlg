concrete RSTEng of RST = open Prelude, ParadigmsEng, SyntaxEng, ResEng in {


  lincat
    Nucleus = Phr ;
    Satellite = Phr ;
    SatelliteList = Text ;
    Schema = Text ;


  lin
    BSat s = mkText s fullStopPunct emptyText ;
    CSat s' sl = mkText s' fullStopPunct sl ;

    Background n sl = mkText n fullStopPunct sl ;
    EmptySchema = emptyText ;

    EmptySatellite = lin Phr { s = "" } ;
    EmptyNucleus = lin Phr { s = "" } ;
}
