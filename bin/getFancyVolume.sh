#! /bin/sh

# getVolumeForXmobar.sh
# based on: https://bbs.archlinux.org/viewtopic.php?id=74842
# UUID: a9160756-7e31-4daa-a26a-010fe05e762f



vol=`amixer get Master`

vol=${vol%%*\[off\]}
vol=${vol:-MM}

vol=${vol#*\[}
vol=${vol%%%\]*}

# case $vol in
#    1*) vol="[#---------] $vol%" ;;
#    2*) vol="[##--------] $vol%" ;;
#    3*) vol="[###-------] $vol%" ;;
#    4*) vol="[####------] $vol%" ;;
#    5*) vol="[#####-----] $vol%" ;;
#    6*) vol="[######----] $vol%" ;;
#    7*) vol="[#######---] $vol%" ;;
#    8*) vol="[########--] $vol%" ;;
#    9*) vol="[#########-] $vol%" ;;
#   100) vol="[##########]$vol%"  ;;
#     *) vol="[----!!----] $vol " ;;
# esac

printf '%s' "$vol%"
