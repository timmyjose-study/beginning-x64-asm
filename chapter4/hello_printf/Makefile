# makefile for hello_printf

hello: hello.o
	gcc $< -o $@ -no-pie

hello.o: hello.asm
	nasm -f elf64 -g -F dwarf $< -l hello.lst

.PHONY: clean
clean: 
	rm -f hello.o hello.lst hello