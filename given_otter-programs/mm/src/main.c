#include <stdio.h>
#include <stdlib.h>

#define SWITCHES_AD  0x11000000
#define LEDS_AD      0x11080000
#define SSEG_AD      0x110C0000

void matmultiply();

volatile unsigned short * const sseg = (void *)SSEG_AD;

int first[10][10], second[10][10], multiply[10][10];
int m, n, p, q, c, d, k, sum = 0;
void turnLEDSoff();
void turnLEDSon();

void otter_sleep(int stime);

int main()
{
        m = 10;
        q=10;
        n=10;
        p=10;

  srand(100);

    for (c = 0; c < m; c++)
      for (d = 0; d < m; d++) {

        first[c][d]=(int) rand()*1000;
        second[c][d]=(int) rand()*1000;

      }
        turnLEDSon();
    for(int i=0;i<10000;i++)
    {
    	matmultiply();
	*sseg=i;
    }
    turnLEDSoff();
    otter_sleep(100000);
}

void matmultiply()
{
    for (c = 0; c < m; c++) {
      for (d = 0; d < q; d++) {
        for (k = 0; k < p; k++) {
          sum = sum + first[c][k]*second[k][d];
        }

        multiply[c][d] = sum;
        sum = 0;
      }
    }
}
void otter_sleep(int stime)
{
	int sum=0;
	for(int i=0;i<stime;i++) 
		sum+=rand();
}

