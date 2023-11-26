
#ifndef __DATASET_H
#define __DATASET_H
#define ARRAY_SIZE 9 


#define DIM_SIZE 3 


typedef int data_t;static data_t input1_data[ARRAY_SIZE] = 
{
    3,   1,   1,   2,   2,   1,   2,   3,   0
};

static data_t input2_data[ARRAY_SIZE] = 
{
    3,   2,   3,   2,   3,   2,   1,   2,   3
};

static data_t verify_data[ARRAY_SIZE] = 
{
    6,   3,   4,   4,   5,   3,   3,   5,   3
};


#endif //__DATASET_H