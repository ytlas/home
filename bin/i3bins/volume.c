#include <stdio.h>
#include <stdlib.h>

int main(void){
  FILE *pp;
  pp=popen("ls","r");
  fseek(pp, 0L, SEEK_END);
  int sz = ftell(pp);
  char output[sz];
  fgets(output,sz,pp);
  printf("%d, %s",sz,output);
}