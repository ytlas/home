#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(void){
  FILE *command;
  char *line=malloc(50);
  short flag=0;
  command=popen("ps aux","r");
  while(fgets(line,50,command)){
    if(strstr(line,"redshift")!=NULL){
      flag=1;
      break;
    }
  }
  fclose(command);
  if(flag){
    printf("<span color='red'></span>");
  }
  else{
    printf("");
  }
}
