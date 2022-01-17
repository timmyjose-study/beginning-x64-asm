#include <stdio.h>

extern void printb(long long);

int main()
{
  long long n;
  scanf("%lld", &n);
  printb(n);

  return 0;
}
