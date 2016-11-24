import XMonad
import qualified Data.Map as M
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W

main = do
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> myManageHook
    , logHook = ewmhDesktopsLogHook
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , handleEventHook = ewmhDesktopsEventHook
    , startupHook = ewmhDesktopsStartup
    , modMask = mod4Mask
    } `additionalKeys`
    [ ((mod4Mask                ,xK_l       ),spawn "lock")
    , ((mod4Mask .|. shiftMask  ,xK_l       ),spawn "lockhiber"         )
    , ((mod4Mask                ,xK_Return  ),spawn "urxvt"             )
    , ((mod4Mask                ,xK_0       ),spawn "firefox-esr"       )
    , ((mod4Mask                ,xK_d       ),spawn "rofi -show run"    )
    , ((mod4Mask                ,xK_Left    ),spawn "sudo abl -5"       )
    , ((mod4Mask                ,xK_Right   ),spawn "sudo abl +5"       )
    , ((mod4Mask                ,xK_Down    ),spawn "ponymix decrease 5")
    , ((mod4Mask                ,xK_Up      ),spawn "ponymix increase 5")
    , ((mod4Mask                ,xK_m       ),spawn "ponymix toggle"    )
    , ((mod4Mask                ,xK_n       ),windows W.focusUp         )
    , ((mod4Mask                ,xK_p       ),windows W.focusDown       )
    , ((mod4Mask .|. shiftMask  ,xK_n       ),windows W.swapDown        )
    , ((mod4Mask .|. shiftMask  ,xK_p       ),windows W.swapUp          )
    , ((mod4Mask .|. shiftMask  ,xK_Return  ),windows W.swapMaster      )
    , ((mod4Mask .|. controlMask,xK_f       ),sendMessage Expand        )
    , ((mod4Mask .|. controlMask,xK_b       ),sendMessage Shrink        )
    , ((mod4Mask                ,xK_w       ),kill)
    ]

myManageHook = composeAll
    [ className =? "Gimp"          --> doFloat
    , className =? "mpv"           --> doFloat
    , className =? "Firefox"       --> doF (W.shift "2")
    , className =? "mpv"           --> doF (W.shift "3")
    , className =? "Google-chrome" --> doF (W.shift "3")
    , className =? "TeamSpeak 3"   --> doF (W.shift "4")
    , className =? "Steam"         --> doF (W.shift "5")
    ]
