#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *batteryLevels(void){
  FILE *fBattery;
  char *batteryLevel=malloc(2);
  batteryLevel[0]=0;
  batteryLevel[1]=0;
  if(!fopen("/sys/class/power_supply/BAT0","r")){
    return batteryLevel;
  }
  fBattery=fopen("/sys/class/power_supply/BAT1/capacity","r");
  fscanf(fBattery,"%c",&batteryLevel[0]);
  fclose(fBattery);
  fBattery=fopen("/sys/class/power_supply/BAT0/capacity","r");
  fscanf(fBattery,"%c",&batteryLevel[1]);
  fclose(fBattery);
  return batteryLevel;
}
