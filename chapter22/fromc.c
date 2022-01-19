// showcasing the calling of assembly programs (external) from C.

#include <stdio.h>
#include <string.h>

#define MAX_STR_LEN 1024

extern int rarea(int, int);
extern int rperimeter(int, int);
extern double carea(double);
extern double ccircum(double);
extern void sreverse(char*, int);
extern void adouble(double[], int);
extern double asum(double[], int);

int main()
{
  int l, b;
  double r;
  char s[MAX_STR_LEN];
  double a[] = { 70.0, 83.2, 91.5, 72.1, 55.5 };
  int alen = sizeof(a) / sizeof(double);

  puts("Compute the area of perimeter of a rectangle");
  puts("Enter the length of one side:");
  scanf("%d", &l);
  puts("Enter the length of the other side:");
  scanf("%d", &b);
  printf("The area of the rectangle = %d\n", rarea(l, b));
  printf("The perimeter of the rectangle = %d\n\n", rperimeter(l, b));

  puts("Compute the area of circumference of a circle");
  puts("Enter the radius:");
  scanf("%lf", &r);
  printf("The area of the circle is %lf\n", carea(r));
  printf("The circumference of the circle is %lf\n\n", ccircum(r));

  puts("Reverse a string");
  puts("Enter the string:");
  scanf("%s", s);
  printf("The string is %s\n", s);
  sreverse(s, strlen(s));
  printf("The reversed string is %s\n", s);

  puts("Double the elements of an array");
  printf("The array has %d elements\n", alen);
  puts("The elements of the array are:");

  for (int i = 0; i < alen; i++) {
    printf("Element %d = %lf\n", i, a[i]);
  }

  printf("The sum of the elements of this array = %lf\n", asum(a, alen));

  adouble(a, alen);
  puts("The elements of the doubled array are:");

  for (int i = 0; i < alen; i++) {
    printf("Element %d = %lf\n", i, a[i]);
  }

  printf("The sum of the elements of this doubled array = %lf\n", asum(a, alen));

  return 0;
}