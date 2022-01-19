// Using basic inline asm syntax.

#include <stdio.h>

double x;
double y;
double sum, prod, diff, quot;

void add(void);
void sub(void);
void mul(void);
void divide(void);

int main()
{
  scanf("%lf%lf", &x, &y);

  add();
  printf("%lf + %lf = %lf\n", x, y, sum);

  sub();
  printf("%lf - %lf = %lf\n", x, y, diff);

  mul();
  printf("%lf * %lf = %lf\n", x, y, prod);

  divide();
  printf("%lf / %lf = %lf\n", x, y, quot);

  return 0;
}

void add()
{
  __asm__(
      ".intel_syntax noprefix;"
      "movq xmm0, x;"
      "addsd xmm0, y;"
      "movq sum, xmm0;"
      );
}

void sub()
{
  __asm__(
      ".intel_syntax noprefix;"
      "movq xmm0, x;"
      "subsd xmm0, y;"
      "movq diff, xmm0;"
      );
}

void mul()
{
  __asm__(
      ".intel_syntax noprefix;"
      "movq xmm0, x;"
      "mulsd xmm0, y;"
      "movq prod, xmm0;"
      );
}

void divide() 
{
  __asm__(
      ".intel_syntax noprefix;"
      "movq xmm0, x;"
      "divsd xmm0, y;"
      "movq quot, xmm0;"
      );
}
