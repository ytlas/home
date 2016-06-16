#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "interface.h"

int main(void){
  FILE *command;
  char *run=malloc(16);
  char *iface=interface();
  if(iface[0]=='0'){
    printf("<span color='red'></span> OFFLINE");
  }
  else{
    if(iface[0]=='w'){
      strcpy(run,"iwconfig ");
      strcat(run,iface);
      command=popen(run,"r");
      char line[80];
      if(fgets(line,sizeof(line),command)!=NULL){
	if(strstr(line,"off/any")!=NULL)
	  printf("<span color='lightred'></span> OFF");
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
	  printf("<span color='lightgreen'></span> %s",ssid);
	}
      }
    }
    else{
      if(iface[0]=='e'){
	printf(" ONLINE");
      }
    }
  }
  return EXIT_SUCCESS;
}
