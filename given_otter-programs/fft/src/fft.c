//#include "fft.c"
#include <math.h> 
//#include <stdio.h>


void _wait(int t)
{
	for(int i=0;i<t;i++);
}

/* fft on a set of n points given by A_re and A_im. Bit-reversal permuted roots-of-unity lookup table
 * is given by W_re and W_im. More specifically,  W is the array of first n/2 nth roots of unity stored
 * in a permuted bitreversal order.
 *
 * FFT - Decimation In Time FFT with input array in correct order and output array in bit-reversed order.
 *
 * REQ: n should be a power of 2 to work. 
 *
 * Note: - See www.cs.berkeley.edu/~randit for her thesis on VIRAM FFTs and other details about VHALF section of the algo
 *         (thesis link - http://www.cs.berkeley.edu/~randit/papers/csd-00-1106.pdf)
 *       - See the foll. CS267 website for details of the Decimation In Time FFT implemented here.
 *         (www.cs.berkeley.edu/~demmel/cs267/lecture24/lecture24.html)
 *       - Also, look "Cormen Leicester Rivest [CLR] - Introduction to Algorithms" book for another variant of Iterative-FFT
 */

static void fft(int n, double *A_re, double *A_im, double *W_re, double *W_im) 
{
  double w_re, w_im, u_re, u_im, t_re, t_im;
  int m, g, b;
  int i, mt, k;

  /* for each stage */  
  for (m=n; m>=2; m=m>>1) 
  {
    /* m = n/2^s; mt = m/2; */
    mt = m >> 1;

    /* for each group of butterfly */ 
    for (g=0,k=0; g<n; g+=m,k++) 
    {
      /* each butterfly group uses only one root of unity. actually, it is the bitrev of this group's number k.
       * BUT 'bitrev' it as a log2n-1 bit number because we are using a lookup array of nth root of unity and
       * using cancellation lemma to scale nth root to n/2, n/4,... th root.
       *
       * It turns out like the foll.
       *   w.re = W[bitrev(k, log2n-1)].re;
       *   w.im = W[bitrev(k, log2n-1)].im;
       * Still, we just use k, because the lookup array itself is bit-reversal permuted. 
       */
      w_re = W_re[k];
      w_im = W_im[k];

      /* for each butterfly */ 
      for (b=g; b<(g+mt); b++) 
      {
        /* printf("bf %d %d %d %f %f %f %f\n", m, g, b, A_re[b], A_im[b], A_re[b+mt], A_im[b+mt]);
         */ 
        //printf("bf %d %d %d (u,t) %g %g %g %g (w) %g %g\n", m, g, b, A_re[b], A_im[b], A_re[b+mt], A_im[b+mt], w_re, w_im);

        /* t = w * A[b+mt] */
        t_re = w_re * A_re[b+mt] - w_im * A_im[b+mt]; 
        t_im = w_re * A_im[b+mt] + w_im * A_re[b+mt];

        /* u = A[b]; in[b] = u + t; in[b+mt] = u - t; */
        u_re = A_re[b];
        u_im = A_im[b];
        A_re[b] = u_re + t_re;
        A_im[b] = u_im + t_im;
        A_re[b+mt] = u_re - t_re;
        A_im[b+mt] = u_im - t_im;

         //printf("af %d %d %d %f %f %f %f\n", m, g, b, A_re[b], A_im[b], W_re[b+mt], W_im[b+mt]);
                
        //printf("af %d %d %d (u,t) %g %g %g %g (w) %g %g\n", m, g, b, A_re[b], A_im[b], A_re[b+mt], A_im[b+mt], w_re, w_im);
      }
    }
  }
}

    volatile int * const  LEDS = (int *) 0x11080000;
    //volatile int * const MIC_ADDR = (int *)0x11100000;
    volatile int * const SSEG_ADDR = (int *)0x110C0000;
    //volatile int * const READY_ADDR = (int *)0x11100000;
    //
void main()
{
	*LEDS=1;
    double SAMPLE_RATE = 32;
    int n = 32;
    double testArray[n];
    double testI[n];
  while(1)
  {
	*LEDS=2;
    //lookup tables contain 32nd roots of unity in bit-reversal permutation order
    double lookupR[16] = {1, 0, 0.707106781, -0.707106781, 0.923879533, -0.382683432, 0.382683432, -0.923879533, 0.98078528, -0.195090322, 0.555570233, -0.831469612, 0.831469612, -0.555570233, 0.195090322, -0.98078528};
    double lookupI[16] = {0, 1, 0.707106781, 0.707106781, 0.382683432, 0.923879533, 0.923879533, 0.382683432, 0.195090322, 0.98078528, 0.831469612, 0.555570233, 0.555570233, 0.831469612, 0.98078528, 0.195090322};

	*LEDS=4;
    for(int i=0; i<n; i++)
    {testArray[i] = -i+1;} //*MIC_ADDR;}//store to array
    //if(*READY_ADDR){
	*LEDS=8;
        fft(n, testArray, testI, lookupR, lookupI);
    
	*LEDS=16;
        /*for(int i=0; i<n; i++)
        {
        printf("%g\n", testArray[i]);
        }*/

        //find the index with the highest intensity
            double max_val = testArray[0];
        int max_index = 0;
            for(int j = 1; j<n; j++){
                    if((testArray[j]-max_val)>1) {
                //printf("%g, %g\n", testArray[j], max_val);
                        max_val = testArray[j];
                max_index = j;
                //printf("%d\n", max_index);
                    }
            }

	*LEDS=32;
        //calculate the frequency from the index
        int max_freq = max_index*SAMPLE_RATE/32;
        *SSEG_ADDR = max_freq;
        //printf("%g\n", max_freq);
    //}    

	*LEDS=64;
	_wait(1000000);
  }
}
