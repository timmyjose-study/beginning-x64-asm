# makefile for alive.asm

alive: alive.o
	ld $< -o $@ -e main

alive.o: alive.asm
	nasm -f elf64 -g -F dwarf $< -l alive.lst

.PHONY: clean
clean:
	rm -f alive.o alive.lst alive
