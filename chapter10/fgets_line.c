#include <stdio.h>

#define MAX_STR_LEN 80

int main(int argc, char *argv[])
{
  char s[MAX_STR_LEN];

  fgets(s, MAX_STR_LEN, stdin);
  printf("%s", s);

  return 0;
}
