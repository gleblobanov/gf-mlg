module Weather where

import PGF hiding (Tree)
import qualified PGF
----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> PGF.Tree
  fg :: PGF.Tree -> a

newtype GString = GString String  deriving Show

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

newtype GInt = GInt Int  deriving Show

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

newtype GFloat = GFloat Double  deriving Show

instance Gf GFloat where
  gf (GFloat x) = mkDouble x
  fg t =
    case unDouble t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

data GApparentTemperature = GApparentTemperatureVal GFloat 
  deriving Show

data GCity = GCityVal GString 
  deriving Show

data GCloudCover = GCloudCoverVal GFloat 
  deriving Show

data GDewPoint = GDewPointVal GFloat 
  deriving Show

data GHumidiy = GHumidiyVal GFloat 
  deriving Show

data GJointNucleusList =
   GJBNuc GNucleus 
 | GJCNuc GNucleus GJointNucleusList 
  deriving Show

data GLatitude = GLatitudeVal GFloat 
  deriving Show

data GLongitude = GLongitudeVal GFloat 
  deriving Show

data GNucleus =
   GNuc GSpan 
 | GNuc' GSchema 
 | GNuc0 
  deriving Show

data GNucleusList =
   GBNuc GNucleus 
 | GCNuc GNucleus GNucleusList 
  deriving Show

data GOzone = GOzoneVal GFloat 
  deriving Show

data GPrecipIntensity = GPrecipIntensityVal GFloat 
  deriving Show

data GPrecipProbability = GPrecipProbabilityVal GFloat 
  deriving Show

data GPressure = GPressureVal GFloat 
  deriving Show

data GSatellite =
   GSat GSpan 
 | GSat' GSchema 
 | GSat0 
  deriving Show

data GSatelliteList =
   GBSat GSatellite 
 | GCSat GSatellite GSatelliteList 
  deriving Show

data GSchema =
   GAntithesis GNucleus GSatelliteList 
 | GBackground GNucleus GSatelliteList 
 | GCircumstance GNucleus GSatelliteList 
 | GConcession GNucleus GSatelliteList 
 | GCondition GNucleus GSatelliteList 
 | GContrast GNucleus GNucleus 
 | GElaboration GNucleus GSatelliteList 
 | GEnablement GNucleus GSatelliteList 
 | GEvaluation GNucleus GSatelliteList 
 | GEvidence GNucleus GSatelliteList 
 | GInterpretation GNucleus GSatelliteList 
 | GJoint GJointNucleusList 
 | GJustify GNucleus GSatelliteList 
 | GMotivation GNucleus GSatelliteList 
 | GNonVolitionalCause GNucleus GSatelliteList 
 | GNonVolitionalResult GNucleus GSatelliteList 
 | GOtherwise GNucleus GSatelliteList 
 | GPurpose GNucleus GSatelliteList 
 | GRestatement GNucleus GSatelliteList 
 | GSequence GNucleusList 
 | GSolutionhood GNucleus GSatelliteList 
 | GSummary GNucleus GSatelliteList 
 | GVolitionalCause GNucleus GSatelliteList 
 | GVolitionalResult GNucleus GSatelliteList 
  deriving Show

data GSpan =
   GApparentTemperatureIs GApparentTemperature 
 | GBoiling 
 | GChilly 
 | GCityTemp GCity GTemperature 
 | GCloudCoverIs GCloudCover 
 | GDewPointIs GDewPoint 
 | GFreezing 
 | GHot 
 | GHumidityIs GHumidiy 
 | GInCity GCity 
 | GLatitudeIs GLatitude 
 | GLongitudeIs GLongitude 
 | GOzoneIs GOzone 
 | GPrecipIntensityIs GPrecipIntensity 
 | GPrecipProbabilityIs GPrecipProbability 
 | GPressureIs GPressure 
 | GTemperatureIs GTemperature 
 | GWarm 
 | GWindBearingIs GWindBearing 
 | GWindSpeedIs GWindSpeed 
  deriving Show

data GTemperature = GTemperatureVal GFloat 
  deriving Show

data GTime = GTimeVal GString 
  deriving Show

data GTimezone = GTimezoneVal GString 
  deriving Show

data GWindBearing = GWindBearingVal GFloat 
  deriving Show

data GWindSpeed = GWindSpeedVal GFloat 
  deriving Show


instance Gf GApparentTemperature where
  gf (GApparentTemperatureVal x1) = mkApp (mkCId "ApparentTemperatureVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "ApparentTemperatureVal" -> GApparentTemperatureVal (fg x1)


      _ -> error ("no ApparentTemperature " ++ show t)

instance Gf GCity where
  gf (GCityVal x1) = mkApp (mkCId "CityVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "CityVal" -> GCityVal (fg x1)


      _ -> error ("no City " ++ show t)

instance Gf GCloudCover where
  gf (GCloudCoverVal x1) = mkApp (mkCId "CloudCoverVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "CloudCoverVal" -> GCloudCoverVal (fg x1)


      _ -> error ("no CloudCover " ++ show t)

instance Gf GDewPoint where
  gf (GDewPointVal x1) = mkApp (mkCId "DewPointVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "DewPointVal" -> GDewPointVal (fg x1)


      _ -> error ("no DewPoint " ++ show t)

instance Gf GHumidiy where
  gf (GHumidiyVal x1) = mkApp (mkCId "HumidiyVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "HumidiyVal" -> GHumidiyVal (fg x1)


      _ -> error ("no Humidiy " ++ show t)

instance Gf GJointNucleusList where
  gf (GJBNuc x1) = mkApp (mkCId "JBNuc") [gf x1]
  gf (GJCNuc x1 x2) = mkApp (mkCId "JCNuc") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "JBNuc" -> GJBNuc (fg x1)
      Just (i,[x1,x2]) | i == mkCId "JCNuc" -> GJCNuc (fg x1) (fg x2)


      _ -> error ("no JointNucleusList " ++ show t)

instance Gf GLatitude where
  gf (GLatitudeVal x1) = mkApp (mkCId "LatitudeVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "LatitudeVal" -> GLatitudeVal (fg x1)


      _ -> error ("no Latitude " ++ show t)

instance Gf GLongitude where
  gf (GLongitudeVal x1) = mkApp (mkCId "LongitudeVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "LongitudeVal" -> GLongitudeVal (fg x1)


      _ -> error ("no Longitude " ++ show t)

instance Gf GNucleus where
  gf (GNuc x1) = mkApp (mkCId "Nuc") [gf x1]
  gf (GNuc' x1) = mkApp (mkCId "Nuc'") [gf x1]
  gf GNuc0 = mkApp (mkCId "Nuc0") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Nuc" -> GNuc (fg x1)
      Just (i,[x1]) | i == mkCId "Nuc'" -> GNuc' (fg x1)
      Just (i,[]) | i == mkCId "Nuc0" -> GNuc0 


      _ -> error ("no Nucleus " ++ show t)

instance Gf GNucleusList where
  gf (GBNuc x1) = mkApp (mkCId "BNuc") [gf x1]
  gf (GCNuc x1 x2) = mkApp (mkCId "CNuc") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "BNuc" -> GBNuc (fg x1)
      Just (i,[x1,x2]) | i == mkCId "CNuc" -> GCNuc (fg x1) (fg x2)


      _ -> error ("no NucleusList " ++ show t)

instance Gf GOzone where
  gf (GOzoneVal x1) = mkApp (mkCId "OzoneVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "OzoneVal" -> GOzoneVal (fg x1)


      _ -> error ("no Ozone " ++ show t)

instance Gf GPrecipIntensity where
  gf (GPrecipIntensityVal x1) = mkApp (mkCId "PrecipIntensityVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PrecipIntensityVal" -> GPrecipIntensityVal (fg x1)


      _ -> error ("no PrecipIntensity " ++ show t)

instance Gf GPrecipProbability where
  gf (GPrecipProbabilityVal x1) = mkApp (mkCId "PrecipProbabilityVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PrecipProbabilityVal" -> GPrecipProbabilityVal (fg x1)


      _ -> error ("no PrecipProbability " ++ show t)

instance Gf GPressure where
  gf (GPressureVal x1) = mkApp (mkCId "PressureVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PressureVal" -> GPressureVal (fg x1)


      _ -> error ("no Pressure " ++ show t)

instance Gf GSatellite where
  gf (GSat x1) = mkApp (mkCId "Sat") [gf x1]
  gf (GSat' x1) = mkApp (mkCId "Sat'") [gf x1]
  gf GSat0 = mkApp (mkCId "Sat0") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Sat" -> GSat (fg x1)
      Just (i,[x1]) | i == mkCId "Sat'" -> GSat' (fg x1)
      Just (i,[]) | i == mkCId "Sat0" -> GSat0 


      _ -> error ("no Satellite " ++ show t)

instance Gf GSatelliteList where
  gf (GBSat x1) = mkApp (mkCId "BSat") [gf x1]
  gf (GCSat x1 x2) = mkApp (mkCId "CSat") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "BSat" -> GBSat (fg x1)
      Just (i,[x1,x2]) | i == mkCId "CSat" -> GCSat (fg x1) (fg x2)


      _ -> error ("no SatelliteList " ++ show t)

instance Gf GSchema where
  gf (GAntithesis x1 x2) = mkApp (mkCId "Antithesis") [gf x1, gf x2]
  gf (GBackground x1 x2) = mkApp (mkCId "Background") [gf x1, gf x2]
  gf (GCircumstance x1 x2) = mkApp (mkCId "Circumstance") [gf x1, gf x2]
  gf (GConcession x1 x2) = mkApp (mkCId "Concession") [gf x1, gf x2]
  gf (GCondition x1 x2) = mkApp (mkCId "Condition") [gf x1, gf x2]
  gf (GContrast x1 x2) = mkApp (mkCId "Contrast") [gf x1, gf x2]
  gf (GElaboration x1 x2) = mkApp (mkCId "Elaboration") [gf x1, gf x2]
  gf (GEnablement x1 x2) = mkApp (mkCId "Enablement") [gf x1, gf x2]
  gf (GEvaluation x1 x2) = mkApp (mkCId "Evaluation") [gf x1, gf x2]
  gf (GEvidence x1 x2) = mkApp (mkCId "Evidence") [gf x1, gf x2]
  gf (GInterpretation x1 x2) = mkApp (mkCId "Interpretation") [gf x1, gf x2]
  gf (GJoint x1) = mkApp (mkCId "Joint") [gf x1]
  gf (GJustify x1 x2) = mkApp (mkCId "Justify") [gf x1, gf x2]
  gf (GMotivation x1 x2) = mkApp (mkCId "Motivation") [gf x1, gf x2]
  gf (GNonVolitionalCause x1 x2) = mkApp (mkCId "NonVolitionalCause") [gf x1, gf x2]
  gf (GNonVolitionalResult x1 x2) = mkApp (mkCId "NonVolitionalResult") [gf x1, gf x2]
  gf (GOtherwise x1 x2) = mkApp (mkCId "Otherwise") [gf x1, gf x2]
  gf (GPurpose x1 x2) = mkApp (mkCId "Purpose") [gf x1, gf x2]
  gf (GRestatement x1 x2) = mkApp (mkCId "Restatement") [gf x1, gf x2]
  gf (GSequence x1) = mkApp (mkCId "Sequence") [gf x1]
  gf (GSolutionhood x1 x2) = mkApp (mkCId "Solutionhood") [gf x1, gf x2]
  gf (GSummary x1 x2) = mkApp (mkCId "Summary") [gf x1, gf x2]
  gf (GVolitionalCause x1 x2) = mkApp (mkCId "VolitionalCause") [gf x1, gf x2]
  gf (GVolitionalResult x1 x2) = mkApp (mkCId "VolitionalResult") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Antithesis" -> GAntithesis (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Background" -> GBackground (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Circumstance" -> GCircumstance (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Concession" -> GConcession (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Condition" -> GCondition (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Contrast" -> GContrast (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Elaboration" -> GElaboration (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Enablement" -> GEnablement (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Evaluation" -> GEvaluation (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Evidence" -> GEvidence (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Interpretation" -> GInterpretation (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Joint" -> GJoint (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Justify" -> GJustify (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Motivation" -> GMotivation (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "NonVolitionalCause" -> GNonVolitionalCause (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "NonVolitionalResult" -> GNonVolitionalResult (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Otherwise" -> GOtherwise (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Purpose" -> GPurpose (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Restatement" -> GRestatement (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Sequence" -> GSequence (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Solutionhood" -> GSolutionhood (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Summary" -> GSummary (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VolitionalCause" -> GVolitionalCause (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VolitionalResult" -> GVolitionalResult (fg x1) (fg x2)


      _ -> error ("no Schema " ++ show t)

instance Gf GSpan where
  gf (GApparentTemperatureIs x1) = mkApp (mkCId "ApparentTemperatureIs") [gf x1]
  gf GBoiling = mkApp (mkCId "Boiling") []
  gf GChilly = mkApp (mkCId "Chilly") []
  gf (GCityTemp x1 x2) = mkApp (mkCId "CityTemp") [gf x1, gf x2]
  gf (GCloudCoverIs x1) = mkApp (mkCId "CloudCoverIs") [gf x1]
  gf (GDewPointIs x1) = mkApp (mkCId "DewPointIs") [gf x1]
  gf GFreezing = mkApp (mkCId "Freezing") []
  gf GHot = mkApp (mkCId "Hot") []
  gf (GHumidityIs x1) = mkApp (mkCId "HumidityIs") [gf x1]
  gf (GInCity x1) = mkApp (mkCId "InCity") [gf x1]
  gf (GLatitudeIs x1) = mkApp (mkCId "LatitudeIs") [gf x1]
  gf (GLongitudeIs x1) = mkApp (mkCId "LongitudeIs") [gf x1]
  gf (GOzoneIs x1) = mkApp (mkCId "OzoneIs") [gf x1]
  gf (GPrecipIntensityIs x1) = mkApp (mkCId "PrecipIntensityIs") [gf x1]
  gf (GPrecipProbabilityIs x1) = mkApp (mkCId "PrecipProbabilityIs") [gf x1]
  gf (GPressureIs x1) = mkApp (mkCId "PressureIs") [gf x1]
  gf (GTemperatureIs x1) = mkApp (mkCId "TemperatureIs") [gf x1]
  gf GWarm = mkApp (mkCId "Warm") []
  gf (GWindBearingIs x1) = mkApp (mkCId "WindBearingIs") [gf x1]
  gf (GWindSpeedIs x1) = mkApp (mkCId "WindSpeedIs") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "ApparentTemperatureIs" -> GApparentTemperatureIs (fg x1)
      Just (i,[]) | i == mkCId "Boiling" -> GBoiling 
      Just (i,[]) | i == mkCId "Chilly" -> GChilly 
      Just (i,[x1,x2]) | i == mkCId "CityTemp" -> GCityTemp (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "CloudCoverIs" -> GCloudCoverIs (fg x1)
      Just (i,[x1]) | i == mkCId "DewPointIs" -> GDewPointIs (fg x1)
      Just (i,[]) | i == mkCId "Freezing" -> GFreezing 
      Just (i,[]) | i == mkCId "Hot" -> GHot 
      Just (i,[x1]) | i == mkCId "HumidityIs" -> GHumidityIs (fg x1)
      Just (i,[x1]) | i == mkCId "InCity" -> GInCity (fg x1)
      Just (i,[x1]) | i == mkCId "LatitudeIs" -> GLatitudeIs (fg x1)
      Just (i,[x1]) | i == mkCId "LongitudeIs" -> GLongitudeIs (fg x1)
      Just (i,[x1]) | i == mkCId "OzoneIs" -> GOzoneIs (fg x1)
      Just (i,[x1]) | i == mkCId "PrecipIntensityIs" -> GPrecipIntensityIs (fg x1)
      Just (i,[x1]) | i == mkCId "PrecipProbabilityIs" -> GPrecipProbabilityIs (fg x1)
      Just (i,[x1]) | i == mkCId "PressureIs" -> GPressureIs (fg x1)
      Just (i,[x1]) | i == mkCId "TemperatureIs" -> GTemperatureIs (fg x1)
      Just (i,[]) | i == mkCId "Warm" -> GWarm 
      Just (i,[x1]) | i == mkCId "WindBearingIs" -> GWindBearingIs (fg x1)
      Just (i,[x1]) | i == mkCId "WindSpeedIs" -> GWindSpeedIs (fg x1)


      _ -> error ("no Span " ++ show t)

instance Gf GTemperature where
  gf (GTemperatureVal x1) = mkApp (mkCId "TemperatureVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "TemperatureVal" -> GTemperatureVal (fg x1)


      _ -> error ("no Temperature " ++ show t)

instance Gf GTime where
  gf (GTimeVal x1) = mkApp (mkCId "TimeVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "TimeVal" -> GTimeVal (fg x1)


      _ -> error ("no Time " ++ show t)

instance Gf GTimezone where
  gf (GTimezoneVal x1) = mkApp (mkCId "TimezoneVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "TimezoneVal" -> GTimezoneVal (fg x1)


      _ -> error ("no Timezone " ++ show t)

instance Gf GWindBearing where
  gf (GWindBearingVal x1) = mkApp (mkCId "WindBearingVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "WindBearingVal" -> GWindBearingVal (fg x1)


      _ -> error ("no WindBearing " ++ show t)

instance Gf GWindSpeed where
  gf (GWindSpeedVal x1) = mkApp (mkCId "WindSpeedVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "WindSpeedVal" -> GWindSpeedVal (fg x1)


      _ -> error ("no WindSpeed " ++ show t)


