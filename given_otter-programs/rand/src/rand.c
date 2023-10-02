#include<stdlib.h>
void _srand(int seed)
{
	srand(seed);
}
int _rand(int max)
{
	return rand()%max;
}
