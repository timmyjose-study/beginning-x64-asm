// showcasing basic inline assembly in C, using the Intel syntax throughout.

#include <stdio.h>

int x = 11, y = 12, prod = 0, diff = 0, sum = 0;
void subtract(void);
void multiply(void);

int main()
{
  printf("The numbers are %d and %d\n", x, y);
  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, x;"
      "add rax, y;"
      "mov sum, rax;"
      );

  printf("The sum is %d.\n", sum);
  subtract();
  printf("The difference is %d.\n", diff);
  multiply();
  printf("The product is %d.\n", prod);

  return 0;
}

void subtract(void)
{
  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, x;"
      "sub rax, y;"
      "mov diff, rax;"
      ); // difference is in rax
}

void multiply()
{
  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, x;"
      "imul rax, y;"
      "mov prod, rax;"
      );
}
