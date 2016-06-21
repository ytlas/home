#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int *batteryLevels(void){
  FILE *fBattery;
  int *batteryLevel=malloc(2);
  fBattery=fopen("/sys/class/power_supply/BAT1/capacity","r");
  fscanf(fBattery,"%d",&batteryLevel[0]);
  fclose(fBattery);
  fBattery=fopen("/sys/class/power_supply/BAT0/capacity","r");
  fscanf(fBattery,"%d",&batteryLevel[1]);
  fclose(fBattery);
  return batteryLevel;
}
