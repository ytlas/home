CC=gcc
FILES=interface.h interface.c volume.h volume.c wifi.h wifi.c battery.h battery.c date.h date.c main.c
OUT_EXE=astat
FLAGS=-lm -Wall -lncurses
build: $(FILES)
	$(CC) -o $(OUT_EXE) $(FILES) $(FLAGS)
