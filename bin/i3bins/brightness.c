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

  printf("%d",brightness*100/maxBrightness);
}
