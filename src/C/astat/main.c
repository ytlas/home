#include <stdlib.h>
#include <stdio.h>
#include <ncurses.h>
#include <time.h>
#include "volume.h"
#include "wifi.h"
#include "battery.h"

int main(void){
  int *battery;
  int volume;
  initscr();
  raw();
  noecho();
  halfdelay(10);
  printw("Battery: \n");
  printw("Volume: \n");
  while(1){
    battery=batteryLevels();
    volume=getVolume();
    mvprintw(0,9,"%2d%%+(%2d%%)",battery[0],battery[1]);
    mvprintw(1,8,"%3d%%",volume);
    refresh();
    if(getch()=='q'){
      break;
    }
  }
  endwin();
  return 0;
}
