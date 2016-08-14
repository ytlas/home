#include <stdio.h>
#include <stdlib.h>

int main(void){
  char option;
  puts("Are you sure you want to power off the machine (y/N) ");
  scanf("%c",&option);
  if(option=='y'||option=='Y')
    system("sudo poweroff");
  return 1;
}
