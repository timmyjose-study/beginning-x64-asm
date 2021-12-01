# makefile for alive.asm - support printing of reals

all: alive alive_exit

alive: alive.o
	gcc $< -o $@ -no-pie

alive.o: alive.asm
	nasm -felf64 -g -F dwarf $< -l alive.lst

alive_exit: alive_exit.o
	gcc $< -o $@ -no-pie

alive_exit.o: alive_exit.asm
	nasm -felf64 -g -F dwarf $< -l alive_exit.lst

.PHONY: clean
clean: 
	rm -f alive.o alive.lst alive alive_exit.o alive_exit.lst alive_exit
	