#include <stdlib.h>
#include <stdio.h>
#include <ncurses.h>
#include <time.h>
#include <string.h>
#include "volume.h"
#include "wifi.h"
#include "battery.h"
#include "date.h"

int main(void){
  int *battery=malloc(2);
  initscr();
  raw();
  noecho();
  halfdelay(1);
  printw("Battery: \n");
  printw("Volume: \n");
  printw("Date: \n");
  while(1){
    battery=batteryLevels();
    mvprintw(0,9,"%3d%%+(%3d%%)",battery[0],battery[1]);
    mvprintw(1,8,"%3d%%",getVolume());
    mvprintw(2,7,"%s",dateAndTime());
    refresh();
    if(getch()=='q'){
      break;
    }
  }
  endwin();
  return 0;
}
