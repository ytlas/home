#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "interface.h"

int getNetStatus(void){
  FILE *command;
  char *run=malloc(16);
  char *iface=interface();
  if(iface[0]=='0'){
    return 0;
  }
  else{
    if(iface[0]=='w'){
      strcpy(run,"iwconfig ");
      strcat(run,iface);
      command=popen(run,"r");
      char line[80];
      if(fgets(line,sizeof(line),command)!=NULL){
	if(strstr(line,"off/any")!=NULL)
	  return 0;
	else{
	  char *ssid=malloc(30);
	  int j=0;
	  for(int i=(int)(strstr(line,"SSID")-line)+6;i<strlen(line);i++){
	    if(line[i]=='"'){
	       break;
	    }
	    ssid[j]=line[i];
	    j++;
	  }
	  return 2;
	}
      }
    }
    else{
      if(iface[0]=='e'){
	return 1;
      }
    }
  }
  return 0;
}
