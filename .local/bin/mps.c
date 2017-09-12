#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

void clipboardContains(void);

int main(void){
  clipboardContains();
}

void clipboardContains(void){
  FILE *fp;
  fp=popen("xsel","r");
  char *clipboard=malloc(500);
  int ch;
  int i=0;
  while(ch!=EOF){
    ch=getc(fp);
    if(ch!='\377'){
      clipboard[i]=ch;
    }
    i++;
  }
  char *totale=malloc(500);
  if(strstr(clipboard,".torrent")!=NULL||strstr(clipboard,"magnet:")!=NULL){
    strcpy(totale,"urxvt -title media -e sh -c 'peerflix -kd \'");
    strcat(totale,clipboard);
    strcat(totale,"\''");
  }
  else{
    if(strstr(clipboard,"twitch")!=NULL||strstr(clipboard,"youtube")!=NULL){
      strcpy(totale,"urxvt -title media -e sh -c 'livestreamer -p mpv \'");
      strcat(totale,clipboard);
      strcat(totale,"\' best'");
    }
    else{
      strcpy(totale,"urxvt -title media -e sh -c 'mpv $(youtube-dl -g ");
      strcat(totale,clipboard);
      strcat(totale,")'");
    }
  }
  free(clipboard);
  free(totale);
  system(totale);
  fclose(fp);
}