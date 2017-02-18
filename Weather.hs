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

data GCity = GGothenburg 
  deriving Show

data GCloudCover = GCloudCoverVal GFloat 
  deriving Show

data GCloudCoverType =
   GBroken 
 | GClear 
 | GOvercast 
 | GScattered 
  deriving Show

data GDay = GDayVal GString 
  deriving Show

data GDewPoint = GDewPointVal GFloat 
  deriving Show

data GHumidity = GHumidityVal GFloat 
  deriving Show

data GHumidityType =
   GComfortableHumid 
 | GExtremelyUncomfortableHumid 
 | GQuiteUncomfortableHumid 
 | GScarcelyUncomfortableDry 
 | GScarcelyUncomfortableHumid 
 | GSeverelyUncomofortableHumid 
 | GSomewhatUncomfortableHumid 
 | GVeryComfortableHumid 
  deriving Show

data GJointNucleusList =
   GJBNuc GNucleus 
 | GJCNuc GNucleus GJointNucleusList 
  deriving Show

data GLatitude = GLatitudeVal GFloat 
  deriving Show

data GLongitude = GLongitudeVal GFloat 
  deriving Show

data GMonth = GMonthVal GString 
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

data GPrecipProbability =
   GHigh 
 | GLow 
 | GModerate 
 | GPrecipProbabilityVal GFloat 
 | GVeryHigh 
 | GVeryLow 
  deriving Show

data GPrecipType =
   GPrecipNone 
 | GRain 
 | GSleet 
 | GSnow 
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
   GAppTemp GApparentTemperature 
 | GApparentTemperatureIs GApparentTemperature 
 | GCloudCoverIs GCloudCover 
 | GDewPointIs GDewPoint 
 | GHumidityIs GHumidity 
 | GInCity GCity 
 | GInfoDewPointHumidity GHumidity GDewPoint GHumidityType 
 | GInfoLocation GCity GDay GMonth GYear GTime GIcon GTempType 
 | GInfoOzone GOzone 
 | GInfoPrecipNo GPrecipIntensity 
 | GInfoPrecipProbaility GPrecipProbability 
 | GInfoPrecipType GPrecipIntensity GPrecipType 
 | GInfoPressure GPressure 
 | GInfoSky GCloudCover 
 | GInfoTemperature GTemperature GApparentTemperature 
 | GInfoWind GWindSpeed GWindSpeedType 
 | GInfoWindBearing GWindSpeed GWindSpeedType GWindBearing 
 | GLatitudeIs GLatitude 
 | GLongitudeIs GLongitude 
 | GOzoneIs GOzone 
 | GPrecipIntensityIs GPrecipIntensity 
 | GPrecipProbabilityIs GPrecipProbability 
 | GPressureIs GPressure 
 | GTempTypeIs GTempType 
 | GTemperatureIs GTemperature 
 | GWearClothes GTempType 
 | GWindBearingIs GWindBearing 
 | GWindSpeedIs GWindSpeed 
 | GmkCityTemp GCity GTemperature 
  deriving Show

data GTempType =
   GCold 
 | GCool 
 | GExtremelyHot 
 | GFreezing 
 | GHot 
 | GMild 
 | GVeryCold 
 | GVeryHot 
 | GVeryWarm 
 | GWarm 
  deriving Show

data GTemperature = GTemperatureVal GFloat 
  deriving Show

data GTime = GTimeVal GString 
  deriving Show

data GTimezone = GTimezoneVal GString 
  deriving Show

data GWindBearing = GWindBearingVal GFloat 
  deriving Show

data GWindBearingType =
   GE 
 | GENE 
 | GESE 
 | GN 
 | GNE 
 | GNNE 
 | GNNW 
 | GNW 
 | GS 
 | GSE 
 | GSSE 
 | GSSW 
 | GSW 
 | GW 
 | GWNW 
 | GWSW 
  deriving Show

data GWindSpeed = GWindSpeedVal GFloat 
  deriving Show

data GWindSpeedType =
   GCalm 
 | GFreshBreeze 
 | GFreshGale 
 | GGengleBreeze 
 | GHurricane 
 | GLightAir 
 | GLightBreeze 
 | GModerateBreeze 
 | GModerateGale 
 | GStorm 
 | GStrongBreeze 
 | GStrongGale 
 | GWholeGale 
  deriving Show

data GYear = GYearVal GString 
  deriving Show

data GIcon


instance Gf GApparentTemperature where
  gf (GApparentTemperatureVal x1) = mkApp (mkCId "ApparentTemperatureVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "ApparentTemperatureVal" -> GApparentTemperatureVal (fg x1)


      _ -> error ("no ApparentTemperature " ++ show t)

instance Gf GCity where
  gf GGothenburg = mkApp (mkCId "Gothenburg") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Gothenburg" -> GGothenburg 


      _ -> error ("no City " ++ show t)

instance Gf GCloudCover where
  gf (GCloudCoverVal x1) = mkApp (mkCId "CloudCoverVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "CloudCoverVal" -> GCloudCoverVal (fg x1)


      _ -> error ("no CloudCover " ++ show t)

instance Gf GCloudCoverType where
  gf GBroken = mkApp (mkCId "Broken") []
  gf GClear = mkApp (mkCId "Clear") []
  gf GOvercast = mkApp (mkCId "Overcast") []
  gf GScattered = mkApp (mkCId "Scattered") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Broken" -> GBroken 
      Just (i,[]) | i == mkCId "Clear" -> GClear 
      Just (i,[]) | i == mkCId "Overcast" -> GOvercast 
      Just (i,[]) | i == mkCId "Scattered" -> GScattered 


      _ -> error ("no CloudCoverType " ++ show t)

instance Gf GDay where
  gf (GDayVal x1) = mkApp (mkCId "DayVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "DayVal" -> GDayVal (fg x1)


      _ -> error ("no Day " ++ show t)

instance Gf GDewPoint where
  gf (GDewPointVal x1) = mkApp (mkCId "DewPointVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "DewPointVal" -> GDewPointVal (fg x1)


      _ -> error ("no DewPoint " ++ show t)

instance Gf GHumidity where
  gf (GHumidityVal x1) = mkApp (mkCId "HumidityVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "HumidityVal" -> GHumidityVal (fg x1)


      _ -> error ("no Humidity " ++ show t)

instance Gf GHumidityType where
  gf GComfortableHumid = mkApp (mkCId "ComfortableHumid") []
  gf GExtremelyUncomfortableHumid = mkApp (mkCId "ExtremelyUncomfortableHumid") []
  gf GQuiteUncomfortableHumid = mkApp (mkCId "QuiteUncomfortableHumid") []
  gf GScarcelyUncomfortableDry = mkApp (mkCId "ScarcelyUncomfortableDry") []
  gf GScarcelyUncomfortableHumid = mkApp (mkCId "ScarcelyUncomfortableHumid") []
  gf GSeverelyUncomofortableHumid = mkApp (mkCId "SeverelyUncomofortableHumid") []
  gf GSomewhatUncomfortableHumid = mkApp (mkCId "SomewhatUncomfortableHumid") []
  gf GVeryComfortableHumid = mkApp (mkCId "VeryComfortableHumid") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "ComfortableHumid" -> GComfortableHumid 
      Just (i,[]) | i == mkCId "ExtremelyUncomfortableHumid" -> GExtremelyUncomfortableHumid 
      Just (i,[]) | i == mkCId "QuiteUncomfortableHumid" -> GQuiteUncomfortableHumid 
      Just (i,[]) | i == mkCId "ScarcelyUncomfortableDry" -> GScarcelyUncomfortableDry 
      Just (i,[]) | i == mkCId "ScarcelyUncomfortableHumid" -> GScarcelyUncomfortableHumid 
      Just (i,[]) | i == mkCId "SeverelyUncomofortableHumid" -> GSeverelyUncomofortableHumid 
      Just (i,[]) | i == mkCId "SomewhatUncomfortableHumid" -> GSomewhatUncomfortableHumid 
      Just (i,[]) | i == mkCId "VeryComfortableHumid" -> GVeryComfortableHumid 


      _ -> error ("no HumidityType " ++ show t)

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

instance Gf GMonth where
  gf (GMonthVal x1) = mkApp (mkCId "MonthVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "MonthVal" -> GMonthVal (fg x1)


      _ -> error ("no Month " ++ show t)

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
  gf GHigh = mkApp (mkCId "High") []
  gf GLow = mkApp (mkCId "Low") []
  gf GModerate = mkApp (mkCId "Moderate") []
  gf (GPrecipProbabilityVal x1) = mkApp (mkCId "PrecipProbabilityVal") [gf x1]
  gf GVeryHigh = mkApp (mkCId "VeryHigh") []
  gf GVeryLow = mkApp (mkCId "VeryLow") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "High" -> GHigh 
      Just (i,[]) | i == mkCId "Low" -> GLow 
      Just (i,[]) | i == mkCId "Moderate" -> GModerate 
      Just (i,[x1]) | i == mkCId "PrecipProbabilityVal" -> GPrecipProbabilityVal (fg x1)
      Just (i,[]) | i == mkCId "VeryHigh" -> GVeryHigh 
      Just (i,[]) | i == mkCId "VeryLow" -> GVeryLow 


      _ -> error ("no PrecipProbability " ++ show t)

instance Gf GPrecipType where
  gf GPrecipNone = mkApp (mkCId "PrecipNone") []
  gf GRain = mkApp (mkCId "Rain") []
  gf GSleet = mkApp (mkCId "Sleet") []
  gf GSnow = mkApp (mkCId "Snow") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "PrecipNone" -> GPrecipNone 
      Just (i,[]) | i == mkCId "Rain" -> GRain 
      Just (i,[]) | i == mkCId "Sleet" -> GSleet 
      Just (i,[]) | i == mkCId "Snow" -> GSnow 


      _ -> error ("no PrecipType " ++ show t)

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
  gf (GAppTemp x1) = mkApp (mkCId "AppTemp") [gf x1]
  gf (GApparentTemperatureIs x1) = mkApp (mkCId "ApparentTemperatureIs") [gf x1]
  gf (GCloudCoverIs x1) = mkApp (mkCId "CloudCoverIs") [gf x1]
  gf (GDewPointIs x1) = mkApp (mkCId "DewPointIs") [gf x1]
  gf (GHumidityIs x1) = mkApp (mkCId "HumidityIs") [gf x1]
  gf (GInCity x1) = mkApp (mkCId "InCity") [gf x1]
  gf (GInfoDewPointHumidity x1 x2 x3) = mkApp (mkCId "InfoDewPointHumidity") [gf x1, gf x2, gf x3]
  gf (GInfoLocation x1 x2 x3 x4 x5 x6 x7) = mkApp (mkCId "InfoLocation") [gf x1, gf x2, gf x3, gf x4, gf x5, gf x6, gf x7]
  gf (GInfoOzone x1) = mkApp (mkCId "InfoOzone") [gf x1]
  gf (GInfoPrecipNo x1) = mkApp (mkCId "InfoPrecipNo") [gf x1]
  gf (GInfoPrecipProbaility x1) = mkApp (mkCId "InfoPrecipProbaility") [gf x1]
  gf (GInfoPrecipType x1 x2) = mkApp (mkCId "InfoPrecipType") [gf x1, gf x2]
  gf (GInfoPressure x1) = mkApp (mkCId "InfoPressure") [gf x1]
  gf (GInfoSky x1) = mkApp (mkCId "InfoSky") [gf x1]
  gf (GInfoTemperature x1 x2) = mkApp (mkCId "InfoTemperature") [gf x1, gf x2]
  gf (GInfoWind x1 x2) = mkApp (mkCId "InfoWind") [gf x1, gf x2]
  gf (GInfoWindBearing x1 x2 x3) = mkApp (mkCId "InfoWindBearing") [gf x1, gf x2, gf x3]
  gf (GLatitudeIs x1) = mkApp (mkCId "LatitudeIs") [gf x1]
  gf (GLongitudeIs x1) = mkApp (mkCId "LongitudeIs") [gf x1]
  gf (GOzoneIs x1) = mkApp (mkCId "OzoneIs") [gf x1]
  gf (GPrecipIntensityIs x1) = mkApp (mkCId "PrecipIntensityIs") [gf x1]
  gf (GPrecipProbabilityIs x1) = mkApp (mkCId "PrecipProbabilityIs") [gf x1]
  gf (GPressureIs x1) = mkApp (mkCId "PressureIs") [gf x1]
  gf (GTempTypeIs x1) = mkApp (mkCId "TempTypeIs") [gf x1]
  gf (GTemperatureIs x1) = mkApp (mkCId "TemperatureIs") [gf x1]
  gf (GWearClothes x1) = mkApp (mkCId "WearClothes") [gf x1]
  gf (GWindBearingIs x1) = mkApp (mkCId "WindBearingIs") [gf x1]
  gf (GWindSpeedIs x1) = mkApp (mkCId "WindSpeedIs") [gf x1]
  gf (GmkCityTemp x1 x2) = mkApp (mkCId "mkCityTemp") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "AppTemp" -> GAppTemp (fg x1)
      Just (i,[x1]) | i == mkCId "ApparentTemperatureIs" -> GApparentTemperatureIs (fg x1)
      Just (i,[x1]) | i == mkCId "CloudCoverIs" -> GCloudCoverIs (fg x1)
      Just (i,[x1]) | i == mkCId "DewPointIs" -> GDewPointIs (fg x1)
      Just (i,[x1]) | i == mkCId "HumidityIs" -> GHumidityIs (fg x1)
      Just (i,[x1]) | i == mkCId "InCity" -> GInCity (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "InfoDewPointHumidity" -> GInfoDewPointHumidity (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3,x4,x5,x6,x7]) | i == mkCId "InfoLocation" -> GInfoLocation (fg x1) (fg x2) (fg x3) (fg x4) (fg x5) (fg x6) (fg x7)
      Just (i,[x1]) | i == mkCId "InfoOzone" -> GInfoOzone (fg x1)
      Just (i,[x1]) | i == mkCId "InfoPrecipNo" -> GInfoPrecipNo (fg x1)
      Just (i,[x1]) | i == mkCId "InfoPrecipProbaility" -> GInfoPrecipProbaility (fg x1)
      Just (i,[x1,x2]) | i == mkCId "InfoPrecipType" -> GInfoPrecipType (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "InfoPressure" -> GInfoPressure (fg x1)
      Just (i,[x1]) | i == mkCId "InfoSky" -> GInfoSky (fg x1)
      Just (i,[x1,x2]) | i == mkCId "InfoTemperature" -> GInfoTemperature (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "InfoWind" -> GInfoWind (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "InfoWindBearing" -> GInfoWindBearing (fg x1) (fg x2) (fg x3)
      Just (i,[x1]) | i == mkCId "LatitudeIs" -> GLatitudeIs (fg x1)
      Just (i,[x1]) | i == mkCId "LongitudeIs" -> GLongitudeIs (fg x1)
      Just (i,[x1]) | i == mkCId "OzoneIs" -> GOzoneIs (fg x1)
      Just (i,[x1]) | i == mkCId "PrecipIntensityIs" -> GPrecipIntensityIs (fg x1)
      Just (i,[x1]) | i == mkCId "PrecipProbabilityIs" -> GPrecipProbabilityIs (fg x1)
      Just (i,[x1]) | i == mkCId "PressureIs" -> GPressureIs (fg x1)
      Just (i,[x1]) | i == mkCId "TempTypeIs" -> GTempTypeIs (fg x1)
      Just (i,[x1]) | i == mkCId "TemperatureIs" -> GTemperatureIs (fg x1)
      Just (i,[x1]) | i == mkCId "WearClothes" -> GWearClothes (fg x1)
      Just (i,[x1]) | i == mkCId "WindBearingIs" -> GWindBearingIs (fg x1)
      Just (i,[x1]) | i == mkCId "WindSpeedIs" -> GWindSpeedIs (fg x1)
      Just (i,[x1,x2]) | i == mkCId "mkCityTemp" -> GmkCityTemp (fg x1) (fg x2)


      _ -> error ("no Span " ++ show t)

instance Gf GTempType where
  gf GCold = mkApp (mkCId "Cold") []
  gf GCool = mkApp (mkCId "Cool") []
  gf GExtremelyHot = mkApp (mkCId "ExtremelyHot") []
  gf GFreezing = mkApp (mkCId "Freezing") []
  gf GHot = mkApp (mkCId "Hot") []
  gf GMild = mkApp (mkCId "Mild") []
  gf GVeryCold = mkApp (mkCId "VeryCold") []
  gf GVeryHot = mkApp (mkCId "VeryHot") []
  gf GVeryWarm = mkApp (mkCId "VeryWarm") []
  gf GWarm = mkApp (mkCId "Warm") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Cold" -> GCold 
      Just (i,[]) | i == mkCId "Cool" -> GCool 
      Just (i,[]) | i == mkCId "ExtremelyHot" -> GExtremelyHot 
      Just (i,[]) | i == mkCId "Freezing" -> GFreezing 
      Just (i,[]) | i == mkCId "Hot" -> GHot 
      Just (i,[]) | i == mkCId "Mild" -> GMild 
      Just (i,[]) | i == mkCId "VeryCold" -> GVeryCold 
      Just (i,[]) | i == mkCId "VeryHot" -> GVeryHot 
      Just (i,[]) | i == mkCId "VeryWarm" -> GVeryWarm 
      Just (i,[]) | i == mkCId "Warm" -> GWarm 


      _ -> error ("no TempType " ++ show t)

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

instance Gf GWindBearingType where
  gf GE = mkApp (mkCId "E") []
  gf GENE = mkApp (mkCId "ENE") []
  gf GESE = mkApp (mkCId "ESE") []
  gf GN = mkApp (mkCId "N") []
  gf GNE = mkApp (mkCId "NE") []
  gf GNNE = mkApp (mkCId "NNE") []
  gf GNNW = mkApp (mkCId "NNW") []
  gf GNW = mkApp (mkCId "NW") []
  gf GS = mkApp (mkCId "S") []
  gf GSE = mkApp (mkCId "SE") []
  gf GSSE = mkApp (mkCId "SSE") []
  gf GSSW = mkApp (mkCId "SSW") []
  gf GSW = mkApp (mkCId "SW") []
  gf GW = mkApp (mkCId "W") []
  gf GWNW = mkApp (mkCId "WNW") []
  gf GWSW = mkApp (mkCId "WSW") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "E" -> GE 
      Just (i,[]) | i == mkCId "ENE" -> GENE 
      Just (i,[]) | i == mkCId "ESE" -> GESE 
      Just (i,[]) | i == mkCId "N" -> GN 
      Just (i,[]) | i == mkCId "NE" -> GNE 
      Just (i,[]) | i == mkCId "NNE" -> GNNE 
      Just (i,[]) | i == mkCId "NNW" -> GNNW 
      Just (i,[]) | i == mkCId "NW" -> GNW 
      Just (i,[]) | i == mkCId "S" -> GS 
      Just (i,[]) | i == mkCId "SE" -> GSE 
      Just (i,[]) | i == mkCId "SSE" -> GSSE 
      Just (i,[]) | i == mkCId "SSW" -> GSSW 
      Just (i,[]) | i == mkCId "SW" -> GSW 
      Just (i,[]) | i == mkCId "W" -> GW 
      Just (i,[]) | i == mkCId "WNW" -> GWNW 
      Just (i,[]) | i == mkCId "WSW" -> GWSW 


      _ -> error ("no WindBearingType " ++ show t)

instance Gf GWindSpeed where
  gf (GWindSpeedVal x1) = mkApp (mkCId "WindSpeedVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "WindSpeedVal" -> GWindSpeedVal (fg x1)


      _ -> error ("no WindSpeed " ++ show t)

instance Gf GWindSpeedType where
  gf GCalm = mkApp (mkCId "Calm") []
  gf GFreshBreeze = mkApp (mkCId "FreshBreeze") []
  gf GFreshGale = mkApp (mkCId "FreshGale") []
  gf GGengleBreeze = mkApp (mkCId "GengleBreeze") []
  gf GHurricane = mkApp (mkCId "Hurricane") []
  gf GLightAir = mkApp (mkCId "LightAir") []
  gf GLightBreeze = mkApp (mkCId "LightBreeze") []
  gf GModerateBreeze = mkApp (mkCId "ModerateBreeze") []
  gf GModerateGale = mkApp (mkCId "ModerateGale") []
  gf GStorm = mkApp (mkCId "Storm") []
  gf GStrongBreeze = mkApp (mkCId "StrongBreeze") []
  gf GStrongGale = mkApp (mkCId "StrongGale") []
  gf GWholeGale = mkApp (mkCId "WholeGale") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Calm" -> GCalm 
      Just (i,[]) | i == mkCId "FreshBreeze" -> GFreshBreeze 
      Just (i,[]) | i == mkCId "FreshGale" -> GFreshGale 
      Just (i,[]) | i == mkCId "GengleBreeze" -> GGengleBreeze 
      Just (i,[]) | i == mkCId "Hurricane" -> GHurricane 
      Just (i,[]) | i == mkCId "LightAir" -> GLightAir 
      Just (i,[]) | i == mkCId "LightBreeze" -> GLightBreeze 
      Just (i,[]) | i == mkCId "ModerateBreeze" -> GModerateBreeze 
      Just (i,[]) | i == mkCId "ModerateGale" -> GModerateGale 
      Just (i,[]) | i == mkCId "Storm" -> GStorm 
      Just (i,[]) | i == mkCId "StrongBreeze" -> GStrongBreeze 
      Just (i,[]) | i == mkCId "StrongGale" -> GStrongGale 
      Just (i,[]) | i == mkCId "WholeGale" -> GWholeGale 


      _ -> error ("no WindSpeedType " ++ show t)

instance Gf GYear where
  gf (GYearVal x1) = mkApp (mkCId "YearVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "YearVal" -> GYearVal (fg x1)


      _ -> error ("no Year " ++ show t)

instance Show GIcon

instance Gf GIcon where
  gf _ = undefined
  fg _ = undefined




