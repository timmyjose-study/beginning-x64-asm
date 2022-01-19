AS := yasm 
ASFLAGS := -felf64 -g dwarf2
CC := gcc
CFLAGS := -Wall -Werror -Wextra -std=c17 -g

SRC := $(wildcard *.asm)
OBJS := $(patsubst %.asm, %.o, $(SRC))
EXES := $(basename $(OBJS))

all: $(EXES)

$(EXES):%:%.o
	$(CC) $(CFLAGS) -o $@ $< -no-pie

%.o: %.asm
	$(AS) $(ASFLAGS) $< -l $(patsubst %.o, %.lst, $@)

.PHONY: clean
clean:
	rm -f $(EXES) $(OBJS) *.lst
