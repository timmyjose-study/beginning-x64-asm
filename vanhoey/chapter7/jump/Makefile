AS := nasm
ASFLAGS := -felf64 -g -F dwarf
CC := gcc
CFLAGS := -no-pie

SRC := $(wildcard *.asm)
OBJS := $(patsubst %.asm, %.o, $(SRC))
EXES := $(basename $(OBJS))

all: $(EXES)

$(EXES): %: %.o
	$(CC) $(CFLAGS) $< -o $(basename $<)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -l $(patsubst %.asm, %.lst, $<)

.PHONY: clean
clean:
	rm -f $(EXES) $(OBJS) *.lst