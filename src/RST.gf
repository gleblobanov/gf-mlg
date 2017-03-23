abstract RST = {

  cat Nucleus ;   -- Nucleus of a schema
      Satellite ; -- Satellite of a schema
      SatelliteList ;
      Schema ;

  fun
    BSat : Satellite -> SatelliteList ;
    CSat : Satellite -> SatelliteList -> SatelliteList ;

    Background : Nucleus -> SatelliteList -> Schema ;
    -- EmptySchema : Schema ;

    -- Emptysatellite : Satellite ;
    -- EmptyNucleus   : Nucleus ;

}
