import Distribution.Simple
import System.Process
import System.Directory

main = do
  exitSuccess <- system "gf -make --output-format=haskell ./src/Weather.gf ./src/WeatherEng.gf ./src/WeatherRus.gf"
  copyFile "Weather.hs" "src/Weather.hs"
  defaultMain
  copyFile "Weather.pgf" "dist/build/gf-mlg/Weather.pgf"
  removeFile "Weather.pgf"
  removeFile "Weather.hs"
