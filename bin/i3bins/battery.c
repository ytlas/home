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
  if(batteryLevel<21)
    strcpy(icon,"");
  else
    if(batteryLevel<41)
      strcpy(icon,"");
    else
      if(batteryLevel<61)
	strcpy(icon,"");
      else
	if(batteryLevel<81)
	  strcpy(icon,"");
	else
	  if(batteryLevel<101)
	    strcpy(icon,"");
	  else
	    strcpy(icon,"wat");

  printf("%s %d",icon,batteryLevel);
}