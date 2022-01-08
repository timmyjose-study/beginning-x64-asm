AS := nasm 
ASFLAGS := -felf64 -g

SRC := $(wildcard *.asm)
OBJS := $(patsubst %.asm, %.o, $(SRC))
EXES := $(basename $(OBJS))

all: $(EXES)

$(EXES):%:%.o
	gcc -o $@ $< -no-pie

%.o: %.asm
	$(AS) $(ASFLAGS) $< -l $(patsubst %.o, %.lst, $@)

.PHONY: clean
clean:
	rm -f $(EXES) $(OBJS) *.lst