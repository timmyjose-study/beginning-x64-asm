#include <stdio.h>

// print a number as a bitstring (64 bytes in
// 8 byte chunks)
void printb(long long n)
{
  long long s, c;

  for (c = 63; c >= 0; c--) {
    s = n >> c;

    // print a space after every 8 bits
    if ((c+1) % 8 == 0)
      printf(" ");

    if (s & 1)
      putchar('1');
    else
      putchar('0');
  }
  puts("\n");
}
