#ifndef __BUGGIES_H__
#define __BUGGIES_H__

class Buggy
{
public:
	Buggy();
	bool DoSomething(Buggy* buggy);
protected:
	Buggy* pBuggy;
	float value;
};

#endif // __BUGGIES_H__
