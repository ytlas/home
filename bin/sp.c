#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>

int main(void){
  char option;
  initscr();
  raw();
  printw("Are you sure you want to power off the machine (y/N) ");
  option=getch();
  if(option=='y'||option=='Y')
    system("sudo poweroff");
  endwin();
  return 1;
}
