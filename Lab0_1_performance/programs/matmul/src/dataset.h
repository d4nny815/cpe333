
#ifndef __DATASET_H
#define __DATASET_H
#define ARRAY_SIZE 9 


#define DIM_SIZE 3 


typedef int data_t;static data_t input1_data[ARRAY_SIZE] = 
{
    3,   1,   2,   0,   2,   0,   3,   0,   0
};

static data_t input2_data[ARRAY_SIZE] = 
{
    3,   1,   1,   0,   2,   0,   2,   3,   1
};

static data_t verify_data[ARRAY_SIZE] = 
{
   13,  11,   5,   0,   4,   0,   9,   3,   3
};


#endif //__DATASET_H