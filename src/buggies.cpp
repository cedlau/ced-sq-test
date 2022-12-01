#include <stdio.h>
#include <stdlib.h>

#include "buggies.h"

Buggy::Buggy()
{
  int *tmp = (int*)malloc(10*sizeof(int));
  tmp[5] = 3;

  value = 4.;
}

bool Buggy::DoSomething(Buggy* buggy)
{
  printf("%f\n", buggy->value);
  if (value == 3.)
    return false;

}
