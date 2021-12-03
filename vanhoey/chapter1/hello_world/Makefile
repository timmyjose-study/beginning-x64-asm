# makefile for hello_world.asm

hello_world: hello_world.o
	gcc -o $@ $< -no-pie

hello_world.o: hello_world.asm
	nasm -f elf64 -g -F dwarf $< -l hello_world.lst

.PHONY: clean
clean:
	rm -f hello_world.lst hello_world.o hello_world
