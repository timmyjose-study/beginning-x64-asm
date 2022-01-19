AS := yasm 
ASFLAGS := -felf64
CC := gcc
CFLAGS := -Wall -Werror -Wextra -std=c17

DEBUG := 0

fromc: fromc.o rect.o circle.o sreverse.o adouble.o asum.o
ifeq ($(DEBUG), 1)
	$(CC) $(CFLAGS) -g -o $@ $^ -no-pie
else
	$(CC) $(CFLAGS) -O2 -o $@ $^ -no-pie
endif

rect.o: rect.asm
ifeq ($(DEBUG), 1)
	$(AS) $(ASFLAGS) -g dwarf2 -o $@ $< -l $(patsubst %.asm, %.lst, $<)
else
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)
endif

circle.o: circle.asm
ifeq ($(DEBUG), 1)
	$(AS) $(ASFLAGS) -g dwarf2 -o $@ $< -l $(patsubst %.asm, %.lst, $<)
else
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)
endif

sreverse.o: sreverse.asm
ifeq ($(DEBUG), 1)
	$(AS) $(ASFLAGS) -g dwarf2 -o $@ $< -l $(patsubst %.asm, %.lst, $<)
else
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)
endif

adouble.o: adouble.asm
ifeq ($(DEBUG), 1)
	$(AS) $(ASFLAGS) -g dwarf2 -o $@ $< -l $(patsubst %.asm, %.lst, $<)
else
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)
endif

asum.o: asum.asm
ifeq ($(DEBUG), 1)
	$(AS) $(ASFLAGS) -g dwarf2 -o $@ $< -l $(patsubst %.asm, %.lst, $<)
else
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)
endif

.PHONY: clean
clean:
	rm -f fromc *.o *.lst
