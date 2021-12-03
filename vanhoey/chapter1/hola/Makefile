# makefile for hola.asm

hola: hola.o
	ld $< -o $@ -e main

hola.o: hola.asm
	nasm -f elf64 -g -F dwarf $< -l hola.lst

.PHONY: clean
clean: 
	rm -f hola.o hola.lst hola
