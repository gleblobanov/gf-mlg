concrete RSTRus of RST = open Prelude, ParadigmsRus, WeatherParams, SyntaxRus, ResRus in {


  lincat
    Nucleus = Tns => Phr ;
    Satellite = Tns => Phr ;
    SatelliteList = Tns => Text ;
    Schema = Tns => Text ;
    Tense = Tns ;

    Report = Text ;


  lin
    BSat s = table { PrsnTns => mkText (s ! PrsnTns) fullStopPunct emptyText ; FtrTns => mkText (s ! FtrTns) fullStopPunct emptyText } ;
    CSat s' sl = table { PrsnTns => mkText (s' ! PrsnTns) fullStopPunct (sl ! PrsnTns) ; FtrTns => mkText (s' ! FtrTns) fullStopPunct (sl ! FtrTns) } ;

    Background n sl = table { PrsnTns => mkText (n ! PrsnTns) fullStopPunct (sl ! PrsnTns) ; FtrTns => mkText (n ! FtrTns) fullStopPunct (sl ! FtrTns) } ;
    EmptySchema = table { PrsnTns => emptyText ; FtrTns => emptyText } ;

    EmptySatellite = table { PrsnTns => lin Phr { s = "" } ; FtrTns => lin Phr { s = "" } } ;
    EmptyNucleus = table { PrsnTns => lin Phr { s = "" } ; FtrTns => lin Phr { s = "" } } ;

    MakeReport t s = s ! t ;


    Present = PrsnTns ;
    Future = FtrTns ;
}