#include <stdio.h>
#include <stdlib.h>

#include "buggies.h"

#define max(a,b) ((a>b)? a : b)
#define min(a,b) ((a<b)? a : b)

Buggy::Buggy()
{
  int *tmp = (int*)malloc(10*sizeof(int));
  tmp[5] = 3;;

  value = 4.;
}

bool Buggy::DoSomething(Buggy* buggy)
{
  printf("%f\n", buggy->value);
  if (value == 3.)
    return false;

}


Point* Buggy::DoInterectionLine(Point p1, Point p2, Point p3, Point p4)
{
  float x1 = p1.x, x2 = p2.x, x3 = p3.x, x4 = p4.x;
  float y1 = p1.y, y2 = p2.y, y3 = p3.y, y4 = p4.y;

  float d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);

  if (d == 0) return NULL;



  float pre = (x1*y2 - y1*x2), post = (x3*y4 - y3*x4);
  float x = ( pre * (x3 - x4) - (x1 - x2) * post ) / d;
  float y = ( pre * (y3 - y4) - (y1 - y2) * post ) / d;

if ( x < min(x1, x2) || x > max(x1, x2) ||
x < min(x3, x4) || x > max(x3, x4) ) return NULL;
if ( y < min(y1, y2) || y > max(y1, y2) ||
y < min(y3, y4) || y > max(y3, y4) ) return NULL;

Point* ret = new Point();
ret->x = x;
ret->y = y;
return ret;
}
