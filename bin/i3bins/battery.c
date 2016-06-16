#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(void){
  FILE *fBattery;
  int batteryLevel;
  char *icon=malloc(3);
  fBattery=fopen("/sys/class/power_supply/BAT1/capacity","r");
  fscanf(fBattery,"%d",&batteryLevel);

  if(batteryLevel<7){
    fclose(fBattery);
    fBattery=fopen("/sys/class/power_supply/BAT0/capacity","r");
    fscanf(fBattery,"%d",&batteryLevel);
  }

  fclose(fBattery);
  if(batteryLevel<10)
    strcpy(icon,"");
  else
    if(batteryLevel<20)
      strcpy(icon,"");
    else
      if(batteryLevel<50)
	strcpy(icon,"");
      else
	if(batteryLevel<70)
	  strcpy(icon,"");
	else
	  if(batteryLevel<=100)
	    strcpy(icon,"");

  printf("%s %d",icon,batteryLevel);
}