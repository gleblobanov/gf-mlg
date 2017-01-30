module Demo where


data Query where

data Temperature = Temperature Double
data Pressure = Pressure Double
data City = City String
data Date = Today | Yesterday
data Concept = CCity City
             | CTemperature Temperature
             | CDate Date
             | CPressure Pressure


data Relation = Posses Concept Concept
              | IsA    Concept Concept

data Ontology = Ontology [Concept] [Relation]

getCity :: Ontology -> City
getCity = undefined

getDate :: Ontology -> Date
getDate = undefined

getTemperature :: Ontology -> Date -> Temperature
getTemperature = undefined

getPressure :: Ontology -> Date -> Pressure
getPressure = undefined


data Goal where



-- Message


data Message = MessageCity City
             | MessageDate Date
             | MessageTemperature Temperature
             | MessagePressure Pressure

-- Document Plan


data Nucleus     = NucleusDP DocumentPlan | NucleusM Message

data Satellite   = SatelliteDP DocumentPlan | SatelliteM Message
data SatelliteSpec = SatelliteSpec DiscourseRelation Satellite


data Constituent = ConstituentDP DocumentPlan | ConstituentM Message
data Constituents = NSConstituents Nucleus [SatelliteSpec]
                  | ConstituentSet DiscourseRelation [Constituent]


newtype Title = Title String
data DocumentPlan = DocumentPlan Constituents
                  | DPDocument Title DocumentPlan
                  | DPParagraph DocumentPlan


data DiscourseRelation = Elaboration
                       | Exemplification
                       | Contrast
                       | NarrativeSequence


data Schema = DescribeDay
            | DescribeDescribeTemperature
            | DescribeDescribePressure
            | CompareTemperature Date Date

-- | Download data using Dark Sky API and returns a local ontology.
--   It caputres everything received.
importData :: Query -> Ontology
importData query = undefined


-- | Transforms an ontology using some data abstraction rules.
--   Rules analyse information and captures results in additional concepts of ontology.
--   Rules filter information.
abstractData :: Ontology -> [Goal] -> Ontology
abstractData ontology abstractonRules = undefined


-- | Transforms an ontology into a document plan using text schemas.
createDocumentPlan :: Ontology -> Schema -> DocumentPlan
createDocumentPlan ontology schema = case schema of
  DescribeDay -> DPDocument title documentPlan
    where title = Title "Summary of a day:"
          documentPlan = DocumentPlan $ ConstituentSet NarrativeSequence [city, date, temperature, pressure]
          city = ConstituentM (MessageCity $ getCity ontology)
          date = ConstituentM (MessageDate $ getDate ontology)
          temperature = ConstituentM (MessageTemperature $ getTemperature ontology $ getDate ontology)
          pressure = ConstituentM (MessagePressure $ getPressure ontology $ getDate ontology)
  CompareTemperature day1 day2 -> DPDocument title documentPlan
    where title = Title "Comparison of temperatures for two days:"
          documentPlan = DocumentPlan $ ConstituentSet NarrativeSequence [city, msg]
          city = ConstituentM (MessageCity $ getCity ontology)
          date1 = ConstituentM (MessageDate day1)
          temperature1 = ConstituentM (MessageTemperature $ getTemperature ontology day1)
          date2 = ConstituentM (MessageDate day2)
          temperature2 = ConstituentM (MessageTemperature $ getTemperature ontology day2)
          msg = ConstituentDP $ DocumentPlan $ NSConstituents nucleus [satelliteSpec]
          nucleus = NucleusDP $ DocumentPlan $ ConstituentSet NarrativeSequence [date1, temperature1]
          satelliteSpec = SatelliteSpec Contrast $ SatelliteDP $ DocumentPlan $ ConstituentSet NarrativeSequence [date2, temperature2]


-- | Exports a document plan as a GF abstract syntax tree.
exportAbstractSyntax documentPlan = undefined

-- | Generate text from GF abstract syntax tree for a specified language.
generateText abstractTree language = undefined
