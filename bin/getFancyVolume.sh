#! /bin/sh

# getVolumeForXmobar.sh
# based on: https://bbs.archlinux.org/viewtopic.php?id=74842
# UUID: a9160756-7e31-4daa-a26a-010fe05e762f


# 状態の取得
vol=`amixer get Master`

# ミュートの場合
vol=${vol%%*\[off\]}
vol=${vol:-MM}

# 音量部分のみを切り抜く
vol=${vol#*\[}
vol=${vol%%%\]*}

# インジケータの生成
case $vol in
   1*) vol="[#---------] $vol%" ;;
   2*) vol="[##--------] $vol%" ;;
   3*) vol="[###-------] $vol%" ;;
   4*) vol="[####------] $vol%" ;;
   5*) vol="[#####-----] $vol%" ;;
   6*) vol="[######----] $vol%" ;;
   7*) vol="[#######---] $vol%" ;;
   8*) vol="[########--] $vol%" ;;
   9*) vol="[#########-] $vol%" ;;
  100) vol="[##########]$vol%"  ;;
    *) vol="[----!!----] $vol " ;;
esac

# 出力
printf '%s' "$vol"
