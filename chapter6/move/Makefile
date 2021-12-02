# makefile for move.asm

move: move.o
	gcc $< -o $@ -no-pie

move.o: move.asm
	nasm -felf64 -g -F dwarf $< -l move.lst

.PHONY: clean
clean:
	rm -f move.o move.lst move