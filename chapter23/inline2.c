// Showcasing extended inline asm syntax.
//
// Note: always use the extended inline asm syntax to avoid clobbering registers as well as 
// being able to use local variables. 
//
// The general syntax of extended inline assembly is:
//
// __asm__(
//      ".intel_syntax noprefix;"
//      "...<other asm code>..."
//      :output operands (optional)
//      :input operands (optional)
//      :clobbered registers (optional)
//      );
//
//  Note the register constraints (mapping from local registers aliases to registers):
//
//  a -> rax, eax, ax, al
//  b -> rbx, ebx, bx, bl
//  c -> rcx, ecx, cx, cl
//  d -> rdx, edx, dx, dl
//  S -> rsi, esi, si
//  D -> rdi, edi, di
//  r -> any register
//  x -> xmm register (xmm0)
//
//  The compiler will generate code to save and restore the listed clobbered registers

#include <stdio.h>

int a = 12, b = 13, gsum = 0;

int main()
{
  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, a;"
      "add rax, b;"
      "mov gsum, rax;"
      :::"rax"
      );
  printf("The sum of %d and %d is %d\n", a, b, gsum);

  // now for locals
  int x = 14, y = 16, lsum = 0, ldiff = 0, lprod = 0;
  double lquot = 0.0;

  printf("The local variables are %d and %d\n", x, y);

  // sum
  // map rdx -> x and rcx -> y
  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, rdx;"
      "add rax, rcx;"
      :"=a"(lsum)
      :"d"(x), "c"(y)
      );
  printf("%d + %d = %d\n", x, y, lsum);

  // diff
  // rdx -> x, rcx -> y
  // rbx is clobbered, so handle it
  __asm__(
      ".intel_syntax noprefix;"
      "mov rbx, rdx;"
      "add rbx, rcx;"
      "mov rax, rbx;"
      :"=a"(ldiff)
      :"d"(x), "c"(y)
      :"rbx"
      );
  printf("%d - %d = %d\n", x, y, ldiff);

  // product
  __asm__(
      ".intel_syntax noprefix;"
      "mov rax, rdx;"
      "imul rax, rcx;"
      :"=a"(lprod)
      :"d"(x), "c"(y)
      );

  // division
  __asm__(
      ".intel_syntax noprefix;"
      "movq xmm0, rdx;"
      "movq xmm1, rcx;"
      "divsd xmm0, xmm1;"
      :"=x"(lquot)
      :"d"(x), "c"(y)
      );
  printf("%d / %d = %lf\n", x, y, lquot);

  return 0;
}
