AS := yasm
ASFLAGS := -felf64 -g dwarf2 
CC := gcc
CFLAGS := -g

all: bits1 bits2

bits1: bits1.o printb.o
	$(CC) $(CFLAGS) -o $@ $^ -no-pie

bits2: bits2.o
	$(CC) $(CFLAGS) -o $@ $< -no-pie

bits1.o: bits1.asm
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)

printb.o: printb.c
	$(CC) -c $<

bits2.o: bits2.asm
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)


.PHONY: clean
clean:
	rm -f printb.o bits1.o bits1.lst bits1