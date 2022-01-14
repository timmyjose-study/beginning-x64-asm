#include <stdio.h>

#define MAX_STR_LEN 80

int main(int argc, char *argv[])
{
  char s[MAX_STR_LEN];

  scanf("%[^\n]s", s);
  printf("%s\n", s);

  return 0;
}
