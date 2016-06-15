#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

// Declaration of functions
int getNewBrightness(const char **argv);
int setBrightness(int deltaBrightness,FILE *fp);

int main(int argc,const char *argv[]){
  // Declaration of current brightness and max brightness vars
  FILE *fileBrightness;
  FILE *fileMaxBrightness;
  int brightness;
  int maxBrightness;

  // Opens files
  fileBrightness=fopen("/sys/class/backlight/intel_backlight/brightness","r+");
  fileMaxBrightness=fopen("/sys/class/backlight/intel_backlight/max_brightness","r");

  // Puts contents into the variables
  fscanf(fileBrightness,"%d",&brightness);
  fscanf(fileMaxBrightness,"%d",&maxBrightness);

  // Declares new brightness as well as the change in brightness
  int newBrightness;
  int deltaBrightness=(getBrightnessArg(argv)*maxBrightness/100);

  // Subtracts or adds depending on the operator prefix
  switch(argv[1][0]){
  case '+':
    newBrightness=brightness+deltaBrightness;
    break;
  case '-':
    newBrightness=brightness-deltaBrightness;
    break;
  default:
    printf("Invalid argument.");
  }

  // Safety statement so that the brightness doesn't exceed max brightness
  if(newBrightness>=maxBrightness)
    setBrightness(maxBrightness,fileBrightness);
  else
    setBrightness(newBrightness,fileBrightness);

  // Close file pointers
  fclose(fileMaxBrightness);
  fclose(fileBrightness);
}

// Returns the command-line argument as an integer
// Ex. abl +23 would return 23 as int
int getBrightnessArg(const char **argv){
  // Declaration of char bm that will store the first argument
  char bm[3];

  // Initialization of int bmnum that will store the number inside the first argument
  int bmnum=0;

  // Gets the substring of the first argument with the numbers only
  memcpy(bm,&argv[1][1],4);

  // Ends the string correctly, all strings in C must end with \0
  bm[strlen(bm)+1]='\0';

  // Safety statement so the length of argument isn't incorrect
  if(argv[1]&&!(strlen(argv[1])>4||strlen(argv[1])<2)){
    // Converts bm to an int and stores it in bmnum
    for(int i=0;i<strlen(bm);i++){
      if(i==strlen(bm)-1)
	bmnum+=bm[i]-48;
      else
	bmnum+=(bm[i]-48)*pow(10,strlen(bm)-i-1);
    }
  }

  // Returns the argument integer
  return bmnum;
}

// Sets the brightness
int setBrightness(int brightness,FILE *fp){
  fprintf(fp,"%d",brightness);
}
