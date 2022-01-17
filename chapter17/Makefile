AS := yasm
ASFLAGS := -felf64 -gdwarf2
CC := gcc
CFLAGS := -Wall -Werror -Wextra -std=c17 -g

bits3: printb.o bits3.o
	$(CC) $(CFLAGS) -o $@ $^ -no-pie

printb.o: printb.c
	$(CC) -c $<

bits3.o: bits3.asm
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)

.PHONY: clean
clean:
	rm -f bits3 bits3.o printb.o bits3.lst