abstract RST = {

  cat DocumentPlan ;


  cat Span ;
  data Satellite : Span ;
       Nucleus   : Span ;

  cat Position ;
  data Head : Position ;
       Tail : Position ;

  cat Relation ;
  data Background     : Relation ;
       Interpretation : Relation ;
       Joint          : Relation ;
       Sequence       : Relation ;
       First          : Relation ;
       Second         : Relation ;
       Leaf           : Relation ;

  cat Schema Relation Span Position ; 

  data mkBackground :
         (rel1 : Relation) ->
         (rel2 : Relation) ->
         (span : Span) ->
         (pos : Position) ->
         Schema rel1 Nucleus pos ->
         Schema rel2 Satellite Tail ->
         Schema Background span pos ;

  data mkInterpretation :
         (rel1 : Relation) ->
         (rel2 : Relation) ->
         (span : Span) ->
         (pos : Position) ->
         Schema rel1 Nucleus pos ->
         Schema rel2 Satellite Tail ->
         Schema Interpretation span pos ;

  data mkJoint :
         (rel1 : Relation) ->
         (rel2 : Relation) ->
         (span : Span) ->
         (pos : Position) ->
         Schema rel1 Nucleus pos ->
         Schema rel2 Nucleus Tail ->
         Schema Joint span pos ;

  -- data mkSequence :
  --        (span : Span) ->
  --        (pos : Position) ->
  --        Schema First Nucleus pos ->
  --        Schema Second Nucleus Tail ->
  --        Schema Sequence span pos ;

  -- data mkFirst :
  --        (rel : Relation) ->
  --        (span : Span) ->
  --        (pos : Position) ->
  --        Schema rel span pos ->
  --        Schema First span pos ;

  -- data mkSecond :
  --        (rel : Relation) ->
  --        (span : Span) ->
  --        (pos : Position) ->
  --        Schema rel span pos ->
  --        Schema Second span pos ;

         
  -- fun EmptyNucleus : (name : Name) -> Schema Leaf Nucleus Tail name ;

}
