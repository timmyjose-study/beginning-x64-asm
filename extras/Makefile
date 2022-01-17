AS := yasm
ASFLAGS := -felf64 -g dwarf2
CC := gcc
CFLAGS := -Wall -Werror -Wextra -g

SRC := $(wildcard *.asm)
OBJS := $(patsubst %.asm, %.o, $(SRC))
EXES := $(basename $(OBJS))

.PHONY: all clean

all: $(EXES)

$(EXES): %: %.o
	$(CC) $(CFLAGS) -o $@ $< -no-pie

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)

clean:
	rm -f $(EXES) $(OBJS) %.lst