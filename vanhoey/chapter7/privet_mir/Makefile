# makefile for privet_mir.asm

all: privet_mir hola_mundo

privet_mir: privet_mir.o
	gcc $< -o $@ -no-pie

hola_mundo: hola_mundo.o
	gcc $< -o $@ -no-pie

%.o: %.asm
	nasm -felf64 -g -F dwarf $< -l hola_mundo.lst

.PHONY: clean
clean:
	rm -f privet_mir.o privet_mir.lst privet_mir hola_mundo.o hola_mundo.lst hola_mundo