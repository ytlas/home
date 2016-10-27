import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/glas/.xmobarrc"
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "green" "" . shorten 50
                    }
    , modMask = mod4Mask
    } `additionalKeys`
    [ ((mod4Mask, xK_l), spawn "lock")
    , ((mod4Mask .|. shiftMask,xK_l       ),spawn "lockhiber"         )
    , ((mod4Mask,              xK_Return  ),spawn "urxvt"             )
    , ((mod4Mask,              xK_0       ),spawn "firefox-esr"       )
    , ((mod4Mask,              xK_d       ),spawn "rofi -show run"    )
    , ((mod4Mask,              xK_Left    ),spawn "sudo abl -5"       )
    , ((mod4Mask,              xK_Right   ),spawn "sudo abl +5"       )
    , ((mod4Mask,              xK_Down    ),spawn "ponymix decrease 5")
    , ((mod4Mask,              xK_Up      ),spawn "ponymix increase 5")
    , ((mod4Mask,              xK_m       ),spawn "ponymix toggle"    )
    , ((mod4Mask,              xK_n       ),windows W.focusUp         )
    , ((mod4Mask,              xK_p       ),windows W.focusDown       )
    , ((mod4Mask .|. shiftMask,xK_n       ),windows W.swapDown        )
    , ((mod4Mask .|. shiftMask,xK_p       ),windows W.swapUp          )
    , ((mod4Mask .|. shiftMask  ,xK_Return),windows W.swapMaster      )
    , ((mod4Mask .|. controlMask,xK_f     ),sendMessage Expand        )
    , ((mod4Mask .|. controlMask,xK_b     ),sendMessage Shrink        )
    , ((mod4Mask,xK_w),kill)
    ]
