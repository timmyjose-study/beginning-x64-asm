CC := gcc
CFLAGS := -Wall -Werror -Wextra -pedantic -std=c17 -masm=intel

DEBUG := 0

all: inline1 inline2 calc calc_extended

%: %.c
ifeq ($(DEBUG), 1)
	$(CC) $(CFLAGS) -g -o $@ $< -no-pie
else
	$(CC) $(CFLAGS) -O2 -o $@ $< -no-pie
endif

.PHONY: clean
clean:
	rm -f inline1 inline2 calc calc_extended *.o
