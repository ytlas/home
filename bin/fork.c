#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(const int argc,const char **argv){
  if(argc==1){
    return 0;
  }
  char *args=malloc(100);
  strcpy(args,"nohup ");
  for(int i=1;i<argc;i++){
    strcat(args,argv[i]);
    strcat(args," ");
  }
  strcat(args,">/dev/null 2>&1&");
  system(args);
  return 1;
}
