# makefile for hello.asm (with newline)

hello: hello.o
	ld $< -o $@ -e main

hello.o: hello.asm
	nasm -f elf64 -g -F dwarf $< -l hello.lst

.PHONY: clean
clean: 
	rm -f hello.o hello.lst hello
