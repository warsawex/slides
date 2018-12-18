#include <stdio.h>

#define INCREMENT(i) \
  {                  \
    int a = 0;       \
    i++;             \
  }

int main(void)
{
  int a = 4, b = 6;
  INCREMENT(a);
  INCREMENT(b);
  printf("a is now %d, b is now %d\n", a, b);
  return 0;
}
