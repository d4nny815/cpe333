
#include "dataset.h"
#include <stddef.h>

// NxN matrices 
void matadd(int N,  const data_t A[], const data_t B[], data_t C[])
{
    int i, j;
 
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            data_t sum = 0;
            sum += A[j*N + i] + B[j*N + i];
            C[j*N + i] = sum;
        }
  }
}
void main()
{
    static data_t results_data[ARRAY_SIZE];
	matadd(DIM_SIZE, input1_data, input2_data, results_data);
}
