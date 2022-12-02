#ifndef __BUGGIES_H__
#define __BUGGIES_H__

#include "utils.h"

class Buggy
{
public:
	Buggy();
	bool DoSomething(Buggy* buggy);
	Point* DoInterectionLine(Point p1, Point p2, Point p3, Point p4);
protected:
	Buggy* pBuggy;
	float value;
};

#endif // __BUGGIES_H__
