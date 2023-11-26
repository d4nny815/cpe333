
#ifndef __DATASET_H
#define __DATASET_H
#define ARRAY_SIZE 25 


#define DIM_SIZE 5 


typedef int data_t;static data_t input1_data[ARRAY_SIZE] = 
{
    0,   3,   2,   0,   3,   1,   0,   3,   2,   3,   2,   0,   3,   3,   1,   2,   3,   0,   0,   1, 
    1,   1,   2,   3,   1
};

static data_t input2_data[ARRAY_SIZE] = 
{
    1,   1,   0,   3,   1,   2,   0,   0,   0,   0,   0,   2,   1,   2,   3,   0,   0,   3,   3,   2, 
    2,   1,   2,   3,   3
};

static data_t verify_data[ARRAY_SIZE] = 
{
   12,   7,   8,  13,  15,   7,  10,  15,  24,  23,   4,   9,  14,  24,  20,  10,   3,   2,   9,   5, 
    5,   6,  13,  19,  16
};


#endif //__DATASET_H