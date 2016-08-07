#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *interface(void){
  FILE *pp;
  pp=popen("ip route","r");
  char ch;
  char *interface=malloc(6);
  int wsCount=0;
  while((ch=fgetc(pp))!=EOF){
    if(wsCount==4){
      int i=0;
      while(ch!=' '){
	interface[i]=ch;
	ch=fgetc(pp);
	i++;
      }
      break;
    }
    if(ch==' '){
       wsCount++;
    }
    if(wsCount==5){
      break;
    }
  }
  if(wsCount==0){
    strcpy(interface,"0");
  }
  fclose(pp);
  return interface;
}