AS := yasm
ASFLAGS := -felf64 -g dwarf2 

CC := gcc

function4: function4.o circle.o rect.o
	$(CC) -o $@ $^ -no-pie

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $< -l $(patsubst %.asm, %.lst, $<)

.PHONY: clean
clean:
	rm -f *.o function4
	