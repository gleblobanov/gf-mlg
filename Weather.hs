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

data GAverage =
   GEqual 
 | GGreater 
 | GLess 
 | GRemarkablyGreater 
 | GRemarkablyLess 
 | GSlightlyGreater 
 | GSlightlyLess 
  deriving Show

data GAverageHumidity = GAverageHumidityVal GFloat 
  deriving Show

data GAveragePrecipIntensity = GAveragePrecipIntensityVal GFloat 
  deriving Show

data GAverageTemperature = GAverageTemperatureVal GFloat 
  deriving Show

data GCity =
   GGothenburg 
 | GOsaka 
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
 | GHumidityNone 
 | GQuiteUncomfortableHumid 
 | GScarcelyUncomfortableDry 
 | GScarcelyUncomfortableHumid 
 | GSeverelyUncomofortableHumid 
 | GSomewhatUncomfortableHumid 
 | GVeryComfortableHumid 
  deriving Show

data GIcon =
   GIconClearDay 
 | GIconClearNight 
 | GIconCloudy 
 | GIconFog 
 | GIconNone 
 | GIconPartlyCloudyDay 
 | GIconPartlyCloudyNight 
 | GIconRain 
 | GIconSleet 
 | GIconSnow 
 | GIconWind 
  deriving Show

data GLatitude = GLatitudeVal GFloat 
  deriving Show

data GLongitude = GLongitudeVal GFloat 
  deriving Show

data GMonth =
   GApril 
 | GAugust 
 | GDecember 
 | GFebruary 
 | GJanuary 
 | GJuly 
 | GJune 
 | GMarch 
 | GMay 
 | GMonthNone 
 | GNovember 
 | GOctober 
 | GSeptember 
  deriving Show

data GNucleus = GInfoLocation GCity GDay GMonth GYear GWeekday GTime GIcon 
  deriving Show

data GOzone = GOzoneVal GFloat 
  deriving Show

data GPrecipIntensity = GPrecipIntensityVal GFloat 
  deriving Show

data GPrecipProbability = GPrecipProbabilityVal GFloat 
  deriving Show

data GPrecipProbabilityType =
   GHigh 
 | GLow 
 | GModerate 
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
   GInfoOzone GOzone 
 | GInfoPrecipProbability GPrecipProbabilityType 
 | GInfoPressure GPressure 
 | GInfoSky GCloudCoverType 
 | GInfoTemperature GAverage GAverageTemperature GTemperature GApparentTemperature 
 | GInfoTemperatureLong GAverage GAverageTemperature GTemperature GApparentTemperature 
 | GInfoTemperatureShort GAverage GAverageTemperature GTemperature GApparentTemperature 
 | GInfoWindBearing GWindSpeed GWindSpeedType GWindBearingType 
  deriving Show

data GSatelliteList =
   GBSat GSatellite 
 | GCSat GSatellite GSatelliteList 
  deriving Show

data GSchema = GBackground GNucleus GSatelliteList 
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

data GWeekday =
   GFriday 
 | GMonday 
 | GSaturday 
 | GSunday 
 | GThursday 
 | GTuesday 
 | GWednesday 
  deriving Show

data GWindBearing = GWindBearingVal GFloat 
  deriving Show

data GWindBearingType =
   GWindE 
 | GWindENE 
 | GWindESE 
 | GWindN 
 | GWindNE 
 | GWindNNE 
 | GWindNNW 
 | GWindNW 
 | GWindS 
 | GWindSE 
 | GWindSSE 
 | GWindSSW 
 | GWindSW 
 | GWindW 
 | GWindWNW 
 | GWindWSW 
  deriving Show

data GWindSpeed = GWindSpeedVal GFloat 
  deriving Show

data GWindSpeedType =
   GCalm 
 | GFreshBreeze 
 | GFreshGale 
 | GGentleBreeze 
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


instance Gf GApparentTemperature where
  gf (GApparentTemperatureVal x1) = mkApp (mkCId "ApparentTemperatureVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "ApparentTemperatureVal" -> GApparentTemperatureVal (fg x1)


      _ -> error ("no ApparentTemperature " ++ show t)

instance Gf GAverage where
  gf GEqual = mkApp (mkCId "Equal") []
  gf GGreater = mkApp (mkCId "Greater") []
  gf GLess = mkApp (mkCId "Less") []
  gf GRemarkablyGreater = mkApp (mkCId "RemarkablyGreater") []
  gf GRemarkablyLess = mkApp (mkCId "RemarkablyLess") []
  gf GSlightlyGreater = mkApp (mkCId "SlightlyGreater") []
  gf GSlightlyLess = mkApp (mkCId "SlightlyLess") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Equal" -> GEqual 
      Just (i,[]) | i == mkCId "Greater" -> GGreater 
      Just (i,[]) | i == mkCId "Less" -> GLess 
      Just (i,[]) | i == mkCId "RemarkablyGreater" -> GRemarkablyGreater 
      Just (i,[]) | i == mkCId "RemarkablyLess" -> GRemarkablyLess 
      Just (i,[]) | i == mkCId "SlightlyGreater" -> GSlightlyGreater 
      Just (i,[]) | i == mkCId "SlightlyLess" -> GSlightlyLess 


      _ -> error ("no Average " ++ show t)

instance Gf GAverageHumidity where
  gf (GAverageHumidityVal x1) = mkApp (mkCId "AverageHumidityVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "AverageHumidityVal" -> GAverageHumidityVal (fg x1)


      _ -> error ("no AverageHumidity " ++ show t)

instance Gf GAveragePrecipIntensity where
  gf (GAveragePrecipIntensityVal x1) = mkApp (mkCId "AveragePrecipIntensityVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "AveragePrecipIntensityVal" -> GAveragePrecipIntensityVal (fg x1)


      _ -> error ("no AveragePrecipIntensity " ++ show t)

instance Gf GAverageTemperature where
  gf (GAverageTemperatureVal x1) = mkApp (mkCId "AverageTemperatureVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "AverageTemperatureVal" -> GAverageTemperatureVal (fg x1)


      _ -> error ("no AverageTemperature " ++ show t)

instance Gf GCity where
  gf GGothenburg = mkApp (mkCId "Gothenburg") []
  gf GOsaka = mkApp (mkCId "Osaka") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Gothenburg" -> GGothenburg 
      Just (i,[]) | i == mkCId "Osaka" -> GOsaka 


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
  gf GHumidityNone = mkApp (mkCId "HumidityNone") []
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
      Just (i,[]) | i == mkCId "HumidityNone" -> GHumidityNone 
      Just (i,[]) | i == mkCId "QuiteUncomfortableHumid" -> GQuiteUncomfortableHumid 
      Just (i,[]) | i == mkCId "ScarcelyUncomfortableDry" -> GScarcelyUncomfortableDry 
      Just (i,[]) | i == mkCId "ScarcelyUncomfortableHumid" -> GScarcelyUncomfortableHumid 
      Just (i,[]) | i == mkCId "SeverelyUncomofortableHumid" -> GSeverelyUncomofortableHumid 
      Just (i,[]) | i == mkCId "SomewhatUncomfortableHumid" -> GSomewhatUncomfortableHumid 
      Just (i,[]) | i == mkCId "VeryComfortableHumid" -> GVeryComfortableHumid 


      _ -> error ("no HumidityType " ++ show t)

instance Gf GIcon where
  gf GIconClearDay = mkApp (mkCId "IconClearDay") []
  gf GIconClearNight = mkApp (mkCId "IconClearNight") []
  gf GIconCloudy = mkApp (mkCId "IconCloudy") []
  gf GIconFog = mkApp (mkCId "IconFog") []
  gf GIconNone = mkApp (mkCId "IconNone") []
  gf GIconPartlyCloudyDay = mkApp (mkCId "IconPartlyCloudyDay") []
  gf GIconPartlyCloudyNight = mkApp (mkCId "IconPartlyCloudyNight") []
  gf GIconRain = mkApp (mkCId "IconRain") []
  gf GIconSleet = mkApp (mkCId "IconSleet") []
  gf GIconSnow = mkApp (mkCId "IconSnow") []
  gf GIconWind = mkApp (mkCId "IconWind") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "IconClearDay" -> GIconClearDay 
      Just (i,[]) | i == mkCId "IconClearNight" -> GIconClearNight 
      Just (i,[]) | i == mkCId "IconCloudy" -> GIconCloudy 
      Just (i,[]) | i == mkCId "IconFog" -> GIconFog 
      Just (i,[]) | i == mkCId "IconNone" -> GIconNone 
      Just (i,[]) | i == mkCId "IconPartlyCloudyDay" -> GIconPartlyCloudyDay 
      Just (i,[]) | i == mkCId "IconPartlyCloudyNight" -> GIconPartlyCloudyNight 
      Just (i,[]) | i == mkCId "IconRain" -> GIconRain 
      Just (i,[]) | i == mkCId "IconSleet" -> GIconSleet 
      Just (i,[]) | i == mkCId "IconSnow" -> GIconSnow 
      Just (i,[]) | i == mkCId "IconWind" -> GIconWind 


      _ -> error ("no Icon " ++ show t)

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
  gf GApril = mkApp (mkCId "April") []
  gf GAugust = mkApp (mkCId "August") []
  gf GDecember = mkApp (mkCId "December") []
  gf GFebruary = mkApp (mkCId "February") []
  gf GJanuary = mkApp (mkCId "January") []
  gf GJuly = mkApp (mkCId "July") []
  gf GJune = mkApp (mkCId "June") []
  gf GMarch = mkApp (mkCId "March") []
  gf GMay = mkApp (mkCId "May") []
  gf GMonthNone = mkApp (mkCId "MonthNone") []
  gf GNovember = mkApp (mkCId "November") []
  gf GOctober = mkApp (mkCId "October") []
  gf GSeptember = mkApp (mkCId "September") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "April" -> GApril 
      Just (i,[]) | i == mkCId "August" -> GAugust 
      Just (i,[]) | i == mkCId "December" -> GDecember 
      Just (i,[]) | i == mkCId "February" -> GFebruary 
      Just (i,[]) | i == mkCId "January" -> GJanuary 
      Just (i,[]) | i == mkCId "July" -> GJuly 
      Just (i,[]) | i == mkCId "June" -> GJune 
      Just (i,[]) | i == mkCId "March" -> GMarch 
      Just (i,[]) | i == mkCId "May" -> GMay 
      Just (i,[]) | i == mkCId "MonthNone" -> GMonthNone 
      Just (i,[]) | i == mkCId "November" -> GNovember 
      Just (i,[]) | i == mkCId "October" -> GOctober 
      Just (i,[]) | i == mkCId "September" -> GSeptember 


      _ -> error ("no Month " ++ show t)

instance Gf GNucleus where
  gf (GInfoLocation x1 x2 x3 x4 x5 x6 x7) = mkApp (mkCId "InfoLocation") [gf x1, gf x2, gf x3, gf x4, gf x5, gf x6, gf x7]

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3,x4,x5,x6,x7]) | i == mkCId "InfoLocation" -> GInfoLocation (fg x1) (fg x2) (fg x3) (fg x4) (fg x5) (fg x6) (fg x7)


      _ -> error ("no Nucleus " ++ show t)

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

instance Gf GPrecipProbabilityType where
  gf GHigh = mkApp (mkCId "High") []
  gf GLow = mkApp (mkCId "Low") []
  gf GModerate = mkApp (mkCId "Moderate") []
  gf GVeryHigh = mkApp (mkCId "VeryHigh") []
  gf GVeryLow = mkApp (mkCId "VeryLow") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "High" -> GHigh 
      Just (i,[]) | i == mkCId "Low" -> GLow 
      Just (i,[]) | i == mkCId "Moderate" -> GModerate 
      Just (i,[]) | i == mkCId "VeryHigh" -> GVeryHigh 
      Just (i,[]) | i == mkCId "VeryLow" -> GVeryLow 


      _ -> error ("no PrecipProbabilityType " ++ show t)

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
  gf (GInfoOzone x1) = mkApp (mkCId "InfoOzone") [gf x1]
  gf (GInfoPrecipProbability x1) = mkApp (mkCId "InfoPrecipProbability") [gf x1]
  gf (GInfoPressure x1) = mkApp (mkCId "InfoPressure") [gf x1]
  gf (GInfoSky x1) = mkApp (mkCId "InfoSky") [gf x1]
  gf (GInfoTemperature x1 x2 x3 x4) = mkApp (mkCId "InfoTemperature") [gf x1, gf x2, gf x3, gf x4]
  gf (GInfoTemperatureLong x1 x2 x3 x4) = mkApp (mkCId "InfoTemperatureLong") [gf x1, gf x2, gf x3, gf x4]
  gf (GInfoTemperatureShort x1 x2 x3 x4) = mkApp (mkCId "InfoTemperatureShort") [gf x1, gf x2, gf x3, gf x4]
  gf (GInfoWindBearing x1 x2 x3) = mkApp (mkCId "InfoWindBearing") [gf x1, gf x2, gf x3]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "InfoOzone" -> GInfoOzone (fg x1)
      Just (i,[x1]) | i == mkCId "InfoPrecipProbability" -> GInfoPrecipProbability (fg x1)
      Just (i,[x1]) | i == mkCId "InfoPressure" -> GInfoPressure (fg x1)
      Just (i,[x1]) | i == mkCId "InfoSky" -> GInfoSky (fg x1)
      Just (i,[x1,x2,x3,x4]) | i == mkCId "InfoTemperature" -> GInfoTemperature (fg x1) (fg x2) (fg x3) (fg x4)
      Just (i,[x1,x2,x3,x4]) | i == mkCId "InfoTemperatureLong" -> GInfoTemperatureLong (fg x1) (fg x2) (fg x3) (fg x4)
      Just (i,[x1,x2,x3,x4]) | i == mkCId "InfoTemperatureShort" -> GInfoTemperatureShort (fg x1) (fg x2) (fg x3) (fg x4)
      Just (i,[x1,x2,x3]) | i == mkCId "InfoWindBearing" -> GInfoWindBearing (fg x1) (fg x2) (fg x3)


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
  gf (GBackground x1 x2) = mkApp (mkCId "Background") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Background" -> GBackground (fg x1) (fg x2)


      _ -> error ("no Schema " ++ show t)

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

instance Gf GWeekday where
  gf GFriday = mkApp (mkCId "Friday") []
  gf GMonday = mkApp (mkCId "Monday") []
  gf GSaturday = mkApp (mkCId "Saturday") []
  gf GSunday = mkApp (mkCId "Sunday") []
  gf GThursday = mkApp (mkCId "Thursday") []
  gf GTuesday = mkApp (mkCId "Tuesday") []
  gf GWednesday = mkApp (mkCId "Wednesday") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Friday" -> GFriday 
      Just (i,[]) | i == mkCId "Monday" -> GMonday 
      Just (i,[]) | i == mkCId "Saturday" -> GSaturday 
      Just (i,[]) | i == mkCId "Sunday" -> GSunday 
      Just (i,[]) | i == mkCId "Thursday" -> GThursday 
      Just (i,[]) | i == mkCId "Tuesday" -> GTuesday 
      Just (i,[]) | i == mkCId "Wednesday" -> GWednesday 


      _ -> error ("no Weekday " ++ show t)

instance Gf GWindBearing where
  gf (GWindBearingVal x1) = mkApp (mkCId "WindBearingVal") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "WindBearingVal" -> GWindBearingVal (fg x1)


      _ -> error ("no WindBearing " ++ show t)

instance Gf GWindBearingType where
  gf GWindE = mkApp (mkCId "WindE") []
  gf GWindENE = mkApp (mkCId "WindENE") []
  gf GWindESE = mkApp (mkCId "WindESE") []
  gf GWindN = mkApp (mkCId "WindN") []
  gf GWindNE = mkApp (mkCId "WindNE") []
  gf GWindNNE = mkApp (mkCId "WindNNE") []
  gf GWindNNW = mkApp (mkCId "WindNNW") []
  gf GWindNW = mkApp (mkCId "WindNW") []
  gf GWindS = mkApp (mkCId "WindS") []
  gf GWindSE = mkApp (mkCId "WindSE") []
  gf GWindSSE = mkApp (mkCId "WindSSE") []
  gf GWindSSW = mkApp (mkCId "WindSSW") []
  gf GWindSW = mkApp (mkCId "WindSW") []
  gf GWindW = mkApp (mkCId "WindW") []
  gf GWindWNW = mkApp (mkCId "WindWNW") []
  gf GWindWSW = mkApp (mkCId "WindWSW") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "WindE" -> GWindE 
      Just (i,[]) | i == mkCId "WindENE" -> GWindENE 
      Just (i,[]) | i == mkCId "WindESE" -> GWindESE 
      Just (i,[]) | i == mkCId "WindN" -> GWindN 
      Just (i,[]) | i == mkCId "WindNE" -> GWindNE 
      Just (i,[]) | i == mkCId "WindNNE" -> GWindNNE 
      Just (i,[]) | i == mkCId "WindNNW" -> GWindNNW 
      Just (i,[]) | i == mkCId "WindNW" -> GWindNW 
      Just (i,[]) | i == mkCId "WindS" -> GWindS 
      Just (i,[]) | i == mkCId "WindSE" -> GWindSE 
      Just (i,[]) | i == mkCId "WindSSE" -> GWindSSE 
      Just (i,[]) | i == mkCId "WindSSW" -> GWindSSW 
      Just (i,[]) | i == mkCId "WindSW" -> GWindSW 
      Just (i,[]) | i == mkCId "WindW" -> GWindW 
      Just (i,[]) | i == mkCId "WindWNW" -> GWindWNW 
      Just (i,[]) | i == mkCId "WindWSW" -> GWindWSW 


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
  gf GGentleBreeze = mkApp (mkCId "GentleBreeze") []
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
      Just (i,[]) | i == mkCId "GentleBreeze" -> GGentleBreeze 
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


