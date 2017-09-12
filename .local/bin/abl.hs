import System.Environment

main = do
  let a = getArgs
  a >>= ( \a -> return (a !! 0) ) >>= alterBrightness
  -- alterBrightness b

getMaxBrightness :: IO Int
getMaxBrightness = do
  s <- readFile "/sys/class/backlight/intel_backlight/max_brightness"
  return (read s :: Int)

getBrightness = do
  s <- readFile "/sys/class/backlight/intel_backlight/brightness"
  return (read s :: Int)

alterBrightness arg = do
  max_brightness <- getMaxBrightness
  brightness     <- getBrightness
  arg'           <- parseArg
  let delta = arg' * max_brightness + (100*brightness)
  if delta >= 100*max_brightness
    then writeFile "/sys/class/backlight/intel_backlight/brightness" (show max_brightness)
    else if delta <= 0
           then writeFile "/sys/class/backlight/intel_backlight/brightness" "0"
           else writeFile "/sys/class/backlight/intel_backlight/brightness" (show (delta `div` 100))
    where
      parseArg = do
        if take 1 arg == "+"
          then return (  read (drop 1 arg) :: Int)
          else return (-(read (drop 1 arg) :: Int))
