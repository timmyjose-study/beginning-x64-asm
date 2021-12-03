AS := yasm
ASFLAGS := -felf64 -g dwarf2

SRC := $(wildcard *.asm)
OBJS := $(patsubst %.asm, %.o, $(SRC))
EXES := $(basename $(OBJS))

all: $(EXES)

$(EXES): %: %.o
	ld $< -o $@

%.o: %.asm
	$(AS) $(ASFLAGS) $< -l $(patsubst %.asm, %.lst, $<)

.PHONY: clean
clean: 
	rm -f $(OBJS) $(EXES) *.lst