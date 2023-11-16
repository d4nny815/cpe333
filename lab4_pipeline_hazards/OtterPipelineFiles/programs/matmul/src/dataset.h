
#ifndef __DATASET_H
#define __DATASET_H
#define ARRAY_SIZE 9 


#define DIM_SIZE 3 


typedef int data_t;static data_t input1_data[ARRAY_SIZE] = 
{
    0,   3,   2,   0,   3,   1,   0,   3,   2
};

static data_t input2_data[ARRAY_SIZE] = 
{
    1,   1,   0,   3,   1,   2,   0,   0,   0
};

static data_t verify_data[ARRAY_SIZE] = 
{
    9,   3,   6,   9,   3,   6,   9,   3,   6
};


#endif //__DATASET_H