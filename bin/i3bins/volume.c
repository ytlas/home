#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(void){
  FILE *command;
  command=popen("ponymix","r");
  char *line=malloc(100);
  char c[3];
  int volume;
  for(int i=0;i<3;i++){
    fgets(line,100,command);
  }
  fclose(command);
  if(strstr(line,"Muted")!=NULL){
    printf("<span color='red'></span>");
    return EXIT_SUCCESS;
  }
  for(int i=15;i<19;i++){
    if(line[i]=='%'){
      c[i-15]='\0';
      break;
    }
    c[i-15]=line[i];
  }
  int len=(int)strlen(c);
  volume=(c[len-1]-48);
  for(int i=0;i<len-1;i++){
    volume+=(c[i]-48)*pow(10,len-i-1);
  }
  if(volume==0){
    printf("<span color='red'></span>");
  }
  else if(volume<34){
    printf("<span color='lightgreen'></span> %d",volume);
  }
  else if(volume<67){
    printf("<span color='yellow'></span> %d",volume);
  }
  else if(volume>66){
    printf("<span color='red'></span> %d",volume);
  }
  else{
    printf("Wat");
  }
  return EXIT_SUCCESS;
}
