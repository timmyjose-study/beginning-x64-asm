AS := yasm
ASFLAGS := -felf64 -g dwarf2 

SRC := $(wildcard *.asm)
OBJS := $(patsubst %.asm, %.o, $(SRC))
EXES := $(basename $(OBJS))

CLINK := 0

.PHONY: all clean

all: $(EXES)

$(EXES): %: %.o
ifeq ($(CLINK), 1)
	gcc -o $@ $< -no-pie
else
	ld -o $@ $< -e main 
endif

%.o: %.asm
	$(AS) $(ASFLAGS) $< -l $(patsubst %.asm, %.lst, $<)

clean:
	rm -rf $(EXES) $(OBJS) *.lst