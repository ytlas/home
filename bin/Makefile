all: abl fork mps sr sp abl_h

abl: abl.c
	gcc -o abl abl.c -lm -std=gnu11

fork: fork.c
	gcc -o fork fork.c -std=gnu11

mps: mps.c
	gcc -o mps mps.c -std=gnu11

sp: sp.c
	gcc -o sp sp.c -std=gnu11 -lncurses

sr: sr.c
	gcc -o sr sr.c -std=gnu11 -lncurses
abl_h: abl.hs
	ghc -o abl_h abl.hs
