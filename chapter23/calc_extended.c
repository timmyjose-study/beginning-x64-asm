// calc, but using extended inline asm.

#include <stdio.h>

int main()
{
  int x = 0, y = 0, sum = 0, diff = 0, prod = 0, div_res = 0;

  scanf("%d%d", &x, &y);

  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, rdx;"
      "add rax, rcx;"
      :"=a"(sum)
      :"d"(x), "c"(y)
      );

  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, rdx;"
      "sub rax, rcx;"
      :"=a"(diff)
      :"d"(x), "c"(y)
      );

  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, rdx;"
      "imul rax, rcx;"
      :"=a"(prod)
      :"d"(x), "c"(y)
      );

  __asm__(
      ".intel_syntax noprefix;"
      "xor rdx, rdx;"
      "mov rax, rbx;"
      "idiv rcx;"
      :"=a"(div_res)
      :"b"(x), "c"(y)
      );

  printf("%d + %d = %d\n", x, y, sum);
  printf("%d - %d = %d\n", x, y, diff);
  printf("%d * %d = %d\n", x, y, prod);
  printf("%d / %d = %d\n", x, y, div_res);

  return 0;
}
