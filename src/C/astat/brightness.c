#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int main(void){
  // Declaration of current brightness and max brightness vars
  FILE *fileBrightness;
  FILE *fileMaxBrightness;
  int brightness;
  int maxBrightness;
  char *icon=malloc(50);

  // Opens files
  fileBrightness=fopen("/sys/class/backlight/intel_backlight/brightness","r");
  fileMaxBrightness=fopen("/sys/class/backlight/intel_backlight/max_brightness","r");
  // Puts contents into the variables
  fscanf(fileBrightness,"%d",&brightness);
  fscanf(fileMaxBrightness,"%d",&maxBrightness);

  // Declares new brightness as well as the change in brightness
  int newBrightness;

  fclose(fileMaxBrightness);
  fclose(fileBrightness);


  brightness=brightness*100/maxBrightness;
  if(brightness<=33){
    strcpy(icon,"<span color='lightgreen'></span>");
  }
  else if(brightness<=66){
    strcpy(icon,"<span color='yellow'></span>");
  }
  else{
    strcpy(icon,"<span color='red'></span>");
  }
  printf("%s %d%%",icon,brightness);
}
