#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

unsigned char directoryExists(char *path);
unsigned char fileExists(char *path);
void resetTempPath(char *tempPath,char *homePath);

int main(void){
  char *home=malloc(20);
  char *temp=malloc(100);
  strcpy(home,getenv("HOME"));
  //system("sudo apt-get install $(grep -vE \"^\\s*#\" \"$HOME/Documents/package-list\"  | tr \"\n\n\"5 \" \")");
  strcpy(temp,home);

  strcat(temp,"/.fonts");
  puts("Does the ~/.fonts/ directory exist?");
  if(mkdir(temp,0755)==0){
    puts("~/.fonts/ was created because it did not exist.");
  }
  else{
    puts("~/.fonts/ does exist, which is why it will not be created.");
  }
  printf("\n");

  strcat(temp,"/ubuntu-fonts");
  puts("Does the ~/.fonts/ubuntu-fonts/ directory exist?");
  if(directoryExists(temp)){
    puts("It does, assuming ubuntu-fonts area already installed.");
  }
  else{
    puts("It does not, attempting to install ubuntu-fonts.");
    system("wget http://font.ubuntu.com/download/ubuntu-font-family-0.83.zip -O /tmp/u-fonts.zip&&7z x -o${HOME}/.fonts/ /tmp/u-fonts.zip&&mv $HOME/.fonts/ubuntu-font-family-0.83 $HOME/.fonts/ubuntu-fonts");
    puts("Done.");
  }
  printf("\n");

  puts("Does /usr/bin/node exist? (Assuming NodeJS is installed)");
  if(fileExists("/usr/bin/node")){
    puts("It does, not linking it from nodejs.");
  }
  else{
    puts("It does not, linking it from /usr/bin/nodejs");
    system("sudo ln -s /usr/bin/nodejs /usr/bin/node");
  }
  printf("\n");


}

unsigned char directoryExists(char *path){
  struct stat sb;
  if(stat(path,&sb)==0&&S_ISDIR(sb.st_mode)){
    return 1;
  }
  else{
    return 0;
  }
}

unsigned char fileExists(char *path){
  FILE *file;
  if(file=fopen(path,"r")){
    fclose(file);
    return 1;
  }
  return 0;
}

void resetTempPath(char *tempPath,char *homePath){
  strcpy(tempPath,homePath);
}
