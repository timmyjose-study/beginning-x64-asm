AS := yasm
ASFLAGS := -felf64 -g dwarf2
CC := gcc
CFLAGS := -Wall -Werror -Wextra -g

calc: add.o sub.o mul.o div.o main.o
	$(CC) $(CFLAGS) -o $@ $^ -no-pie

main.o: main.asm
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)

add.o: add.c
	$(CC) $(CFLAGS) -c -o $@ $<

sub.o: sub.c
	$(CC) $(CFLAGS) -c -o $@ $<

mul.o: mul.c
	$(CC) $(CFLAGS) -c -o $@ $<

div.o: div.c
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -f calc add.o sub.o div.o main.o main.lst