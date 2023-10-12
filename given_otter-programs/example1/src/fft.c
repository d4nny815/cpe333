//#include <stdio.h>

extern int f2 (int, int);
extern int f3(int *, int);

int f1 (int a, int b) {
		return f2(a,f3(&a,b));
}

int main()
{
	f1(10,20);
	return 0;
}

