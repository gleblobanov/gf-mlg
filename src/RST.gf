abstract RST = {

  cat Nucleus ;   -- Nucleus of a schema
      Satellite ; -- Satellite of a schema
      SatelliteList ;
      Schema ;
      Tense ;
      Report ;

  fun
    BSat : Satellite -> SatelliteList ;
    CSat : Satellite -> SatelliteList -> SatelliteList ;

    Background : Nucleus -> SatelliteList -> Schema ;
    MakeReport : Tense -> Schema -> Report ;

    Future : Tense ;
    Present : Tense ;

    -- EmptySchema : Schema ;

    -- Emptysatellite : Satellite ;
    -- EmptyNucleus   : Nucleus ;

}
