abstract DocumentPlan = Grammar ** open DocumentPlanResource in {

  cat

    DR ;

    TS ; -- A table of transition signals

  fun 


    TNclStl : Text -> DR -> Text -> Text ;

    Utt2Text : Utt -> Text ;


    ts : TS ;
     
    Elbr : DR ;
    Exmp : DR ;
    Cntr : DR ;
    Sqnc : DR ;
    Empt : DR ;


}
