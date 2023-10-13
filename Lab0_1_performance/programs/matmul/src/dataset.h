
#ifndef __DATASET_H
#define __DATASET_H
#define ARRAY_SIZE 2500 


#define DIM_SIZE 50 


typedef int data_t;static data_t input1_data[ARRAY_SIZE] = 
{
    3,   2,   2,   2,   2,   1,   2,   2,   1,   3,   3,   1,   1,   3,   2,   1,   0,   0,   0,   0, 
    1,   0,   0,   1,   3,   2,   0,   1,   2,   1,   2,   0,   1,   0,   0,   0,   0,   1,   1,   0, 
    2,   2,   1,   1,   1,   1,   0,   0,   0,   3,   2,   2,   1,   3,   0,   1,   0,   3,   3,   2, 
    2,   2,   3,   3,   3,   3,   1,   0,   2,   3,   2,   0,   2,   1,   0,   3,   2,   2,   2,   0, 
    0,   1,   3,   1,   2,   3,   1,   2,   1,   2,   2,   1,   0,   1,   2,   3,   1,   3,   0,   1, 
    1,   3,   3,   3,   3,   1,   2,   1,   2,   3,   2,   1,   0,   2,   2,   2,   1,   1,   2,   2, 
    3,   3,   2,   3,   2,   0,   1,   1,   1,   0,   1,   0,   3,   0,   3,   2,   2,   1,   3,   3, 
    0,   2,   2,   2,   1,   1,   0,   2,   0,   2,   0,   1,   0,   2,   2,   2,   2,   3,   1,   3, 
    1,   2,   2,   3,   1,   2,   2,   3,   3,   0,   3,   2,   3,   2,   1,   2,   1,   3,   3,   3, 
    2,   0,   1,   3,   1,   3,   1,   3,   1,   3,   2,   1,   3,   2,   1,   1,   0,   3,   0,   2, 
    3,   1,   2,   0,   3,   3,   1,   0,   3,   3,   0,   1,   2,   3,   0,   1,   3,   1,   0,   2, 
    0,   1,   0,   1,   0,   1,   1,   1,   1,   0,   2,   3,   2,   1,   2,   1,   3,   1,   2,   3, 
    1,   2,   1,   3,   2,   0,   3,   2,   3,   2,   2,   3,   3,   3,   1,   0,   2,   1,   3,   0, 
    0,   3,   1,   3,   3,   2,   1,   3,   0,   1,   1,   0,   2,   1,   2,   0,   3,   3,   3,   1, 
    3,   2,   3,   0,   3,   1,   3,   3,   2,   2,   2,   1,   2,   1,   2,   1,   2,   0,   3,   0, 
    2,   2,   0,   0,   3,   1,   0,   1,   3,   3,   3,   1,   0,   0,   0,   3,   3,   2,   2,   2, 
    3,   3,   2,   1,   1,   1,   0,   2,   1,   3,   3,   3,   3,   2,   2,   2,   1,   2,   0,   1, 
    1,   3,   0,   0,   2,   0,   1,   1,   2,   1,   1,   2,   2,   0,   3,   3,   0,   1,   1,   1, 
    2,   0,   0,   2,   2,   0,   1,   0,   0,   2,   2,   3,   0,   0,   3,   3,   1,   0,   3,   1, 
    3,   0,   2,   3,   0,   0,   1,   2,   2,   0,   0,   2,   1,   3,   0,   2,   0,   1,   1,   0, 
    1,   1,   3,   2,   0,   3,   2,   3,   1,   3,   3,   3,   1,   3,   2,   0,   1,   3,   2,   1, 
    3,   3,   1,   3,   3,   2,   1,   1,   1,   1,   3,   0,   3,   2,   2,   2,   2,   2,   0,   2, 
    0,   1,   2,   0,   3,   3,   0,   2,   3,   3,   1,   1,   0,   0,   0,   1,   2,   3,   1,   1, 
    2,   3,   3,   1,   3,   3,   0,   1,   0,   1,   0,   3,   2,   0,   3,   0,   1,   0,   2,   1, 
    2,   3,   1,   2,   1,   3,   0,   1,   0,   1,   2,   1,   2,   2,   3,   0,   0,   1,   2,   3, 
    2,   3,   2,   0,   2,   1,   0,   1,   3,   1,   3,   2,   1,   0,   3,   3,   1,   0,   1,   3, 
    3,   0,   2,   1,   1,   0,   3,   0,   3,   1,   0,   3,   1,   3,   1,   3,   1,   2,   0,   1, 
    2,   2,   0,   1,   2,   1,   2,   0,   0,   0,   0,   2,   1,   1,   1,   1,   2,   3,   1,   0, 
    0,   3,   3,   3,   3,   2,   2,   2,   3,   1,   2,   0,   3,   0,   1,   1,   1,   0,   2,   2, 
    0,   1,   0,   0,   3,   3,   3,   2,   2,   2,   0,   3,   0,   1,   1,   1,   2,   0,   1,   1, 
    3,   2,   1,   0,   2,   2,   0,   3,   1,   0,   0,   3,   1,   3,   1,   1,   2,   2,   3,   1, 
    0,   1,   3,   3,   1,   2,   3,   0,   3,   0,   2,   0,   3,   3,   3,   0,   1,   2,   1,   1, 
    2,   3,   1,   0,   3,   3,   3,   1,   3,   1,   2,   0,   2,   2,   1,   1,   2,   2,   0,   2, 
    2,   1,   0,   3,   3,   3,   3,   3,   0,   1,   1,   3,   1,   0,   2,   3,   3,   2,   2,   0, 
    0,   3,   3,   3,   1,   3,   1,   3,   0,   1,   3,   1,   0,   2,   1,   3,   0,   2,   3,   0, 
    3,   1,   3,   2,   0,   3,   2,   0,   2,   1,   3,   1,   2,   3,   3,   3,   3,   1,   3,   2, 
    1,   0,   1,   3,   2,   2,   0,   2,   0,   3,   0,   0,   1,   3,   3,   3,   3,   0,   1,   0, 
    2,   0,   3,   2,   2,   1,   0,   0,   3,   0,   1,   0,   0,   0,   2,   2,   0,   0,   1,   2, 
    2,   2,   0,   3,   1,   1,   3,   3,   1,   3,   0,   3,   1,   1,   1,   3,   3,   2,   0,   1, 
    1,   2,   0,   2,   2,   3,   1,   3,   1,   1,   3,   3,   3,   1,   0,   1,   2,   1,   0,   0, 
    0,   2,   0,   1,   3,   1,   3,   0,   1,   2,   1,   0,   0,   1,   3,   0,   0,   2,   0,   2, 
    3,   3,   0,   0,   2,   3,   2,   0,   3,   2,   2,   1,   0,   0,   3,   0,   3,   1,   2,   3, 
    3,   1,   3,   3,   2,   3,   1,   1,   2,   0,   1,   2,   2,   1,   0,   2,   2,   1,   1,   2, 
    3,   1,   2,   0,   3,   0,   0,   0,   2,   1,   1,   3,   1,   2,   3,   2,   1,   1,   1,   3, 
    2,   3,   1,   2,   2,   3,   2,   3,   3,   2,   3,   3,   1,   3,   0,   1,   3,   2,   2,   1, 
    0,   2,   0,   0,   1,   1,   1,   1,   0,   3,   2,   0,   1,   2,   3,   1,   2,   3,   1,   0, 
    1,   2,   0,   3,   0,   0,   0,   3,   0,   0,   0,   0,   0,   2,   3,   2,   0,   2,   1,   1, 
    0,   2,   1,   2,   1,   0,   2,   2,   3,   0,   2,   0,   2,   0,   0,   2,   1,   2,   0,   1, 
    0,   2,   0,   1,   3,   1,   2,   3,   1,   2,   3,   1,   1,   2,   0,   3,   1,   1,   1,   1, 
    0,   1,   2,   0,   2,   3,   0,   3,   3,   0,   1,   3,   0,   3,   0,   0,   3,   0,   2,   3, 
    1,   1,   3,   2,   2,   0,   3,   3,   0,   2,   1,   1,   1,   3,   0,   3,   2,   2,   3,   1, 
    1,   1,   2,   2,   2,   1,   3,   0,   3,   3,   0,   3,   1,   0,   1,   0,   3,   1,   3,   3, 
    2,   2,   3,   2,   0,   1,   0,   2,   3,   1,   1,   3,   2,   0,   2,   0,   0,   1,   3,   1, 
    0,   3,   0,   3,   1,   2,   1,   3,   2,   2,   0,   3,   3,   1,   2,   2,   3,   0,   2,   1, 
    2,   0,   0,   2,   2,   1,   2,   0,   2,   2,   0,   2,   2,   2,   0,   0,   3,   3,   0,   1, 
    0,   3,   0,   2,   3,   3,   1,   0,   1,   1,   1,   3,   2,   2,   0,   2,   1,   0,   3,   0, 
    3,   0,   2,   1,   3,   3,   2,   2,   1,   2,   3,   3,   1,   3,   2,   3,   3,   2,   1,   1, 
    2,   0,   0,   3,   2,   3,   0,   1,   1,   3,   3,   1,   3,   0,   2,   3,   0,   3,   1,   3, 
    1,   1,   2,   2,   2,   1,   3,   1,   3,   0,   2,   0,   1,   3,   1,   0,   0,   0,   3,   1, 
    1,   3,   3,   2,   2,   1,   1,   3,   2,   2,   1,   3,   2,   1,   0,   0,   3,   1,   3,   2, 
    1,   3,   3,   2,   0,   0,   3,   3,   2,   3,   1,   3,   3,   0,   2,   1,   2,   0,   0,   0, 
    2,   1,   3,   1,   0,   2,   3,   0,   2,   2,   2,   3,   3,   1,   3,   1,   1,   2,   3,   2, 
    2,   1,   0,   3,   2,   0,   2,   0,   3,   2,   0,   0,   3,   1,   0,   2,   2,   1,   1,   1, 
    2,   0,   0,   0,   0,   0,   0,   3,   2,   1,   3,   0,   1,   2,   0,   2,   1,   2,   1,   0, 
    1,   0,   3,   1,   0,   0,   1,   2,   1,   1,   0,   0,   1,   1,   1,   0,   3,   0,   3,   0, 
    3,   1,   1,   0,   1,   2,   3,   1,   3,   2,   0,   3,   2,   2,   2,   1,   2,   1,   0,   0, 
    3,   1,   2,   3,   0,   1,   1,   0,   3,   3,   1,   3,   0,   1,   1,   3,   2,   1,   0,   2, 
    0,   2,   3,   2,   2,   2,   0,   3,   1,   1,   2,   1,   2,   1,   3,   0,   0,   0,   0,   0, 
    2,   3,   0,   1,   0,   1,   1,   2,   2,   2,   2,   0,   3,   1,   0,   1,   3,   0,   3,   0, 
    2,   1,   1,   3,   1,   0,   0,   3,   2,   1,   0,   1,   1,   1,   1,   2,   0,   3,   2,   0, 
    1,   2,   2,   2,   1,   3,   1,   2,   3,   3,   2,   3,   0,   2,   3,   0,   2,   3,   1,   3, 
    2,   0,   3,   0,   2,   2,   3,   1,   2,   1,   2,   1,   1,   1,   3,   2,   2,   3,   2,   0, 
    1,   1,   3,   3,   1,   3,   2,   0,   2,   2,   2,   3,   1,   2,   3,   1,   3,   2,   1,   0, 
    2,   3,   3,   0,   2,   2,   3,   1,   2,   1,   1,   0,   1,   2,   1,   3,   3,   0,   2,   3, 
    1,   0,   3,   3,   0,   2,   1,   1,   0,   1,   3,   2,   1,   3,   0,   1,   1,   1,   0,   0, 
    2,   3,   0,   2,   3,   2,   0,   0,   2,   3,   0,   0,   3,   0,   2,   0,   0,   1,   0,   0, 
    2,   0,   3,   2,   2,   3,   1,   1,   1,   1,   1,   3,   2,   2,   0,   1,   0,   2,   0,   3, 
    2,   3,   1,   1,   3,   2,   1,   0,   3,   3,   2,   0,   1,   3,   3,   0,   1,   3,   0,   3, 
    3,   0,   2,   0,   2,   1,   2,   2,   2,   0,   1,   3,   2,   1,   0,   3,   1,   3,   0,   0, 
    2,   1,   1,   2,   0,   1,   1,   0,   3,   3,   0,   0,   0,   3,   0,   1,   3,   2,   2,   0, 
    3,   3,   1,   2,   3,   0,   2,   0,   3,   1,   3,   3,   0,   1,   0,   1,   0,   0,   0,   0, 
    0,   3,   2,   3,   1,   2,   3,   3,   3,   2,   3,   3,   2,   2,   2,   1,   0,   3,   2,   3, 
    3,   1,   2,   2,   2,   3,   2,   1,   2,   2,   0,   2,   0,   2,   3,   1,   3,   0,   2,   1, 
    1,   2,   1,   2,   0,   1,   2,   3,   3,   2,   3,   1,   1,   1,   0,   0,   0,   0,   3,   1, 
    2,   3,   3,   0,   1,   1,   3,   0,   0,   0,   3,   1,   3,   0,   1,   2,   2,   1,   3,   1, 
    0,   1,   2,   3,   1,   0,   2,   2,   0,   2,   2,   0,   1,   3,   1,   1,   3,   0,   3,   0, 
    2,   1,   2,   0,   0,   0,   2,   0,   2,   1,   0,   0,   3,   1,   0,   1,   1,   3,   3,   2, 
    2,   0,   1,   0,   2,   1,   0,   3,   2,   3,   3,   0,   0,   1,   2,   2,   1,   2,   2,   3, 
    0,   0,   2,   2,   0,   2,   0,   0,   2,   0,   1,   0,   2,   2,   1,   3,   1,   3,   2,   1, 
    3,   2,   2,   1,   3,   0,   3,   2,   3,   0,   1,   3,   2,   3,   3,   3,   1,   1,   3,   3, 
    3,   1,   2,   0,   1,   0,   0,   2,   0,   2,   0,   0,   3,   0,   1,   3,   0,   3,   2,   3, 
    2,   3,   2,   3,   3,   3,   1,   2,   1,   1,   2,   1,   3,   3,   2,   2,   2,   3,   1,   2, 
    2,   0,   0,   1,   1,   0,   2,   2,   0,   0,   0,   0,   1,   1,   0,   1,   0,   1,   1,   3, 
    0,   0,   2,   1,   3,   1,   2,   2,   1,   0,   0,   3,   3,   2,   1,   1,   1,   1,   0,   0, 
    2,   1,   2,   0,   3,   2,   2,   3,   1,   3,   0,   2,   3,   0,   2,   2,   2,   2,   1,   2, 
    0,   3,   2,   3,   3,   1,   1,   2,   3,   3,   1,   3,   3,   3,   1,   2,   3,   2,   1,   1, 
    1,   1,   2,   2,   0,   1,   3,   1,   1,   3,   1,   3,   3,   1,   1,   1,   1,   1,   0,   1, 
    1,   0,   3,   1,   0,   0,   0,   0,   2,   0,   2,   0,   0,   3,   0,   3,   0,   1,   1,   1, 
    3,   0,   0,   1,   0,   1,   0,   1,   0,   2,   0,   3,   1,   1,   2,   3,   3,   2,   1,   3, 
    2,   0,   2,   2,   1,   2,   0,   2,   3,   0,   1,   3,   2,   0,   0,   1,   3,   2,   3,   2, 
    0,   3,   1,   2,   1,   2,   2,   2,   0,   1,   1,   0,   3,   1,   3,   0,   1,   3,   3,   3, 
    2,   0,   3,   2,   3,   2,   1,   3,   1,   3,   1,   3,   0,   2,   0,   3,   1,   0,   1,   2, 
    1,   3,   2,   1,   2,   1,   0,   0,   1,   1,   1,   0,   1,   0,   1,   1,   2,   2,   0,   1, 
    3,   1,   0,   1,   0,   3,   2,   1,   2,   0,   3,   0,   0,   1,   3,   0,   0,   1,   1,   3, 
    1,   2,   0,   2,   2,   2,   2,   0,   2,   3,   0,   1,   2,   2,   0,   2,   2,   1,   0,   2, 
    2,   0,   0,   3,   2,   3,   2,   2,   3,   3,   0,   3,   2,   0,   1,   1,   1,   1,   0,   3, 
    1,   0,   0,   0,   3,   0,   0,   0,   1,   2,   2,   1,   0,   0,   3,   3,   3,   1,   2,   0, 
    3,   1,   3,   2,   3,   1,   2,   3,   3,   0,   2,   0,   2,   3,   1,   1,   3,   2,   3,   2, 
    2,   3,   2,   2,   0,   3,   3,   1,   1,   1,   2,   0,   3,   1,   1,   1,   0,   3,   0,   2, 
    2,   2,   0,   0,   3,   0,   0,   2,   1,   0,   0,   3,   3,   2,   1,   3,   2,   2,   0,   0, 
    0,   2,   3,   0,   3,   2,   0,   2,   2,   3,   3,   1,   2,   2,   1,   1,   3,   1,   0,   1, 
    0,   0,   3,   2,   2,   1,   2,   1,   2,   2,   3,   1,   3,   3,   1,   0,   3,   0,   1,   1, 
    0,   0,   1,   0,   2,   0,   3,   3,   1,   3,   1,   1,   3,   1,   0,   3,   1,   3,   0,   3, 
    0,   1,   0,   2,   3,   0,   2,   2,   3,   0,   3,   1,   1,   3,   3,   2,   1,   0,   1,   3, 
    2,   2,   0,   2,   1,   3,   3,   3,   1,   1,   1,   3,   0,   3,   3,   2,   1,   0,   2,   3, 
    1,   1,   0,   3,   2,   2,   2,   3,   1,   2,   3,   0,   0,   1,   1,   3,   3,   0,   3,   0, 
    3,   0,   2,   1,   1,   1,   3,   2,   0,   3,   2,   2,   3,   1,   2,   1,   1,   0,   0,   0, 
    2,   3,   2,   1,   1,   1,   1,   0,   0,   1,   1,   2,   2,   2,   0,   3,   0,   3,   3,   3, 
    3,   2,   0,   3,   1,   3,   3,   3,   3,   1,   0,   1,   1,   1,   1,   1,   1,   0,   2,   2, 
    0,   0,   3,   3,   1,   3,   3,   2,   2,   2,   0,   0,   0,   0,   1,   3,   0,   2,   1,   2, 
    3,   0,   1,   0,   3,   2,   3,   0,   3,   1,   2,   1,   0,   3,   1,   2,   2,   1,   0,   2, 
    1,   0,   2,   3,   0,   2,   1,   3,   2,   0,   1,   0,   2,   1,   1,   3,   3,   0,   1,   3, 
    1,   0,   2,   3,   2,   3,   3,   1,   1,   2,   1,   0,   3,   2,   1,   3,   3,   3,   1,   3, 
    0,   0,   1,   1,   1,   2,   1,   1,   0,   3,   1,   3,   2,   2,   2,   0,   2,   0,   0,   0, 
    0,   0,   1,   2,   0,   3,   3,   2,   2,   0,   0,   1,   2,   1,   2,   0,   3,   1,   3,   0
};

static data_t input2_data[ARRAY_SIZE] = 
{
    0,   3,   0,   2,   3,   3,   3,   2,   3,   0,   1,   3,   2,   0,   2,   0,   3,   3,   1,   0, 
    0,   2,   2,   3,   2,   3,   1,   1,   3,   3,   2,   0,   2,   1,   3,   3,   2,   2,   2,   0, 
    0,   0,   0,   3,   3,   0,   0,   3,   0,   0,   3,   0,   2,   3,   1,   2,   3,   3,   1,   0, 
    2,   3,   2,   1,   0,   2,   1,   3,   0,   2,   2,   0,   1,   0,   2,   3,   2,   3,   2,   1, 
    1,   3,   0,   3,   0,   0,   3,   0,   3,   2,   2,   2,   2,   0,   1,   1,   1,   3,   1,   1, 
    3,   1,   0,   3,   1,   3,   0,   1,   1,   0,   3,   3,   2,   3,   2,   3,   1,   1,   2,   0, 
    1,   3,   0,   2,   1,   2,   3,   1,   1,   3,   3,   3,   1,   2,   3,   1,   1,   3,   2,   1, 
    3,   2,   0,   3,   1,   3,   0,   0,   2,   1,   3,   1,   2,   3,   2,   3,   2,   2,   0,   1, 
    2,   2,   0,   0,   2,   3,   1,   0,   3,   2,   0,   1,   3,   1,   3,   3,   1,   1,   0,   2, 
    0,   2,   0,   2,   2,   3,   0,   3,   1,   1,   3,   3,   1,   1,   1,   1,   1,   0,   0,   0, 
    1,   1,   0,   2,   0,   0,   3,   3,   1,   2,   3,   3,   3,   2,   1,   0,   0,   2,   0,   2, 
    1,   2,   3,   1,   2,   2,   0,   2,   1,   2,   0,   3,   0,   1,   0,   0,   3,   0,   2,   3, 
    2,   3,   2,   3,   3,   2,   1,   0,   1,   0,   0,   0,   3,   0,   0,   0,   1,   3,   2,   1, 
    2,   0,   2,   3,   0,   0,   2,   1,   0,   1,   2,   3,   1,   2,   3,   3,   0,   0,   1,   0, 
    1,   1,   2,   3,   3,   3,   2,   0,   1,   0,   2,   2,   3,   3,   2,   0,   2,   1,   0,   2, 
    0,   3,   0,   0,   2,   3,   3,   1,   3,   2,   2,   0,   3,   3,   2,   1,   1,   2,   1,   1, 
    3,   2,   0,   1,   1,   3,   1,   0,   2,   0,   0,   0,   2,   2,   0,   1,   1,   3,   0,   0, 
    2,   3,   1,   2,   2,   0,   0,   1,   1,   3,   1,   0,   1,   3,   1,   0,   1,   3,   1,   1, 
    3,   2,   2,   3,   0,   0,   3,   3,   0,   1,   1,   3,   3,   3,   2,   1,   0,   0,   3,   3, 
    0,   1,   1,   2,   3,   1,   2,   1,   0,   0,   2,   2,   0,   3,   3,   2,   3,   0,   0,   1, 
    1,   2,   3,   3,   0,   0,   1,   3,   0,   2,   3,   2,   2,   0,   3,   0,   3,   1,   2,   2, 
    3,   2,   0,   3,   0,   0,   2,   3,   3,   0,   1,   1,   0,   0,   3,   3,   1,   0,   2,   0, 
    1,   3,   2,   1,   1,   2,   0,   1,   1,   3,   2,   1,   3,   2,   0,   0,   0,   0,   1,   3, 
    0,   0,   3,   3,   1,   2,   1,   3,   0,   0,   1,   3,   3,   2,   0,   1,   2,   0,   2,   1, 
    3,   0,   1,   3,   0,   2,   0,   0,   3,   3,   1,   1,   1,   2,   3,   1,   0,   1,   0,   0, 
    0,   0,   3,   0,   2,   1,   3,   0,   1,   0,   3,   3,   3,   1,   0,   0,   2,   1,   2,   1, 
    0,   2,   2,   3,   0,   2,   0,   2,   2,   1,   1,   3,   3,   3,   0,   1,   2,   1,   2,   0, 
    0,   3,   1,   1,   1,   1,   1,   3,   0,   1,   2,   2,   0,   0,   1,   2,   2,   0,   1,   1, 
    3,   2,   2,   0,   2,   0,   3,   1,   0,   3,   3,   0,   0,   2,   2,   0,   3,   1,   3,   0, 
    1,   2,   0,   1,   1,   3,   1,   3,   0,   0,   1,   1,   1,   3,   2,   1,   0,   0,   3,   3, 
    2,   0,   3,   2,   1,   3,   1,   3,   3,   1,   1,   1,   1,   0,   3,   0,   1,   3,   3,   0, 
    0,   1,   2,   3,   0,   3,   3,   1,   0,   1,   2,   3,   3,   3,   1,   0,   2,   1,   2,   2, 
    1,   1,   2,   3,   1,   0,   3,   0,   3,   0,   0,   3,   3,   0,   0,   0,   2,   0,   1,   3, 
    2,   1,   3,   1,   2,   3,   3,   2,   1,   2,   3,   3,   3,   0,   2,   1,   1,   3,   3,   1, 
    2,   3,   0,   3,   0,   2,   3,   1,   3,   1,   0,   1,   1,   2,   2,   1,   2,   0,   2,   0, 
    1,   1,   0,   1,   2,   1,   2,   1,   2,   3,   1,   0,   1,   1,   3,   3,   1,   1,   3,   1, 
    1,   1,   0,   3,   2,   1,   1,   2,   2,   2,   2,   1,   0,   3,   0,   1,   0,   2,   0,   0, 
    3,   3,   3,   2,   2,   0,   1,   2,   2,   2,   0,   0,   3,   3,   2,   0,   2,   1,   2,   3, 
    3,   3,   2,   2,   2,   0,   0,   3,   3,   0,   2,   3,   3,   1,   2,   1,   3,   2,   3,   2, 
    1,   0,   2,   3,   0,   0,   2,   0,   0,   0,   2,   3,   0,   1,   0,   2,   3,   0,   2,   0, 
    1,   3,   2,   3,   3,   1,   2,   2,   1,   1,   0,   3,   2,   2,   2,   1,   2,   1,   0,   1, 
    2,   3,   1,   2,   3,   0,   0,   1,   1,   3,   0,   3,   3,   2,   0,   2,   0,   3,   2,   2, 
    3,   1,   1,   1,   3,   0,   2,   1,   2,   0,   0,   3,   1,   0,   3,   3,   3,   3,   0,   2, 
    2,   0,   3,   3,   3,   3,   2,   3,   2,   2,   2,   1,   1,   3,   3,   3,   2,   2,   1,   0, 
    0,   2,   3,   1,   2,   3,   3,   1,   1,   0,   1,   0,   2,   3,   2,   3,   1,   3,   2,   2, 
    0,   1,   1,   1,   2,   3,   1,   0,   3,   3,   2,   3,   3,   2,   2,   2,   3,   2,   0,   1, 
    1,   3,   0,   1,   1,   1,   1,   3,   3,   2,   0,   1,   3,   3,   1,   2,   0,   1,   1,   3, 
    3,   0,   3,   3,   0,   1,   0,   3,   2,   1,   0,   1,   0,   0,   3,   2,   3,   1,   1,   2, 
    2,   0,   0,   3,   1,   3,   3,   3,   2,   2,   2,   2,   0,   0,   1,   1,   2,   3,   1,   1, 
    1,   2,   3,   3,   3,   2,   3,   0,   1,   3,   2,   3,   1,   1,   0,   0,   3,   1,   2,   0, 
    0,   0,   0,   0,   2,   3,   1,   3,   2,   2,   2,   2,   0,   0,   0,   0,   1,   0,   1,   1, 
    3,   2,   1,   0,   3,   1,   3,   1,   2,   0,   1,   0,   1,   0,   3,   1,   0,   0,   0,   3, 
    2,   3,   3,   0,   1,   2,   0,   0,   2,   1,   3,   0,   1,   3,   2,   0,   0,   3,   2,   1, 
    1,   0,   0,   0,   0,   0,   0,   0,   3,   0,   2,   1,   2,   0,   0,   0,   3,   2,   2,   3, 
    1,   3,   0,   1,   3,   3,   0,   2,   1,   1,   2,   2,   1,   0,   2,   0,   1,   1,   1,   3, 
    2,   1,   3,   3,   2,   2,   1,   3,   3,   1,   3,   1,   2,   1,   3,   0,   0,   3,   2,   3, 
    1,   0,   3,   3,   3,   3,   1,   1,   3,   1,   3,   1,   0,   1,   0,   3,   0,   2,   3,   1, 
    2,   2,   2,   2,   0,   2,   0,   2,   0,   2,   1,   0,   2,   1,   0,   2,   2,   0,   2,   2, 
    2,   3,   1,   3,   2,   2,   2,   2,   0,   1,   2,   0,   1,   2,   1,   0,   1,   2,   0,   3, 
    1,   3,   0,   2,   1,   0,   1,   2,   2,   1,   2,   3,   2,   3,   3,   0,   2,   2,   3,   0, 
    2,   3,   1,   3,   2,   0,   3,   2,   2,   2,   1,   3,   1,   0,   0,   3,   0,   1,   0,   3, 
    0,   1,   1,   2,   3,   0,   0,   2,   3,   3,   3,   0,   0,   1,   1,   3,   3,   3,   1,   3, 
    3,   2,   1,   0,   1,   0,   0,   2,   2,   3,   0,   3,   1,   2,   0,   1,   0,   3,   1,   0, 
    2,   1,   1,   2,   0,   1,   1,   3,   3,   0,   1,   2,   3,   3,   3,   2,   3,   2,   3,   1, 
    0,   1,   2,   3,   0,   3,   3,   1,   1,   1,   2,   3,   2,   0,   0,   0,   0,   3,   0,   0, 
    0,   1,   1,   0,   0,   1,   0,   1,   3,   2,   2,   1,   3,   0,   0,   3,   0,   3,   2,   0, 
    1,   1,   3,   0,   2,   0,   1,   1,   1,   1,   1,   2,   3,   2,   1,   1,   2,   3,   2,   1, 
    2,   1,   0,   1,   1,   1,   3,   0,   3,   0,   1,   0,   1,   3,   3,   2,   1,   0,   3,   0, 
    1,   0,   2,   1,   1,   0,   1,   3,   1,   3,   1,   1,   1,   2,   0,   2,   0,   3,   1,   1, 
    0,   0,   3,   1,   2,   0,   2,   3,   0,   1,   2,   0,   0,   3,   1,   3,   0,   0,   0,   0, 
    3,   3,   3,   1,   1,   2,   1,   1,   0,   1,   2,   0,   0,   3,   3,   3,   3,   0,   1,   1, 
    3,   3,   2,   2,   1,   1,   1,   3,   3,   3,   2,   3,   1,   1,   1,   2,   1,   0,   1,   2, 
    3,   3,   2,   2,   3,   0,   0,   0,   1,   0,   2,   3,   2,   2,   0,   2,   0,   1,   2,   1, 
    3,   1,   1,   1,   1,   1,   2,   1,   2,   0,   0,   1,   2,   1,   1,   2,   2,   0,   2,   1, 
    0,   0,   3,   1,   1,   1,   0,   3,   3,   1,   2,   1,   3,   3,   1,   3,   0,   2,   2,   3, 
    1,   2,   2,   2,   2,   3,   0,   1,   1,   2,   3,   0,   1,   0,   1,   2,   1,   1,   2,   2, 
    2,   1,   1,   3,   2,   3,   3,   3,   2,   2,   2,   3,   3,   2,   3,   2,   0,   3,   1,   1, 
    3,   2,   2,   0,   2,   2,   0,   2,   3,   3,   3,   3,   0,   0,   3,   1,   3,   3,   2,   2, 
    2,   1,   2,   1,   1,   3,   0,   1,   2,   3,   1,   0,   0,   2,   0,   0,   1,   1,   1,   2, 
    0,   2,   3,   3,   1,   3,   3,   0,   1,   2,   2,   0,   1,   2,   3,   2,   3,   3,   2,   2, 
    0,   2,   2,   3,   1,   0,   3,   0,   2,   2,   3,   2,   2,   0,   0,   3,   0,   2,   2,   2, 
    2,   0,   0,   2,   0,   2,   1,   2,   0,   3,   3,   1,   0,   2,   0,   2,   3,   0,   0,   0, 
    1,   3,   0,   3,   0,   1,   0,   1,   2,   1,   2,   2,   0,   1,   3,   2,   2,   3,   3,   0, 
    2,   2,   2,   1,   3,   1,   2,   3,   0,   0,   2,   2,   3,   3,   1,   3,   3,   3,   3,   3, 
    1,   3,   1,   1,   3,   3,   2,   0,   1,   2,   1,   3,   0,   1,   3,   0,   3,   2,   1,   1, 
    1,   0,   0,   2,   2,   3,   3,   3,   3,   0,   0,   3,   2,   2,   1,   3,   3,   2,   3,   3, 
    0,   3,   3,   0,   0,   1,   1,   0,   0,   1,   1,   0,   3,   3,   2,   1,   0,   3,   0,   2, 
    1,   1,   2,   3,   0,   2,   3,   0,   0,   2,   2,   3,   0,   2,   0,   1,   3,   1,   3,   1, 
    0,   1,   2,   3,   0,   1,   0,   2,   3,   1,   1,   1,   1,   2,   2,   0,   1,   1,   0,   2, 
    0,   2,   2,   1,   1,   3,   3,   1,   1,   3,   0,   1,   2,   3,   0,   0,   3,   2,   3,   2, 
    0,   2,   2,   2,   2,   3,   2,   3,   1,   2,   1,   1,   0,   0,   3,   1,   0,   1,   0,   3, 
    0,   3,   3,   3,   2,   0,   3,   1,   0,   3,   3,   0,   3,   1,   3,   1,   3,   3,   3,   0, 
    1,   1,   1,   1,   3,   3,   0,   3,   1,   3,   2,   3,   1,   2,   3,   0,   0,   0,   0,   0, 
    2,   2,   3,   3,   1,   3,   2,   2,   0,   3,   1,   3,   1,   1,   1,   0,   2,   2,   0,   3, 
    3,   1,   1,   1,   3,   1,   0,   2,   1,   3,   3,   0,   3,   2,   2,   1,   3,   0,   1,   2, 
    2,   3,   3,   1,   3,   3,   3,   0,   0,   0,   3,   3,   3,   3,   0,   1,   0,   1,   2,   3, 
    3,   1,   2,   3,   3,   2,   0,   2,   3,   3,   1,   2,   2,   0,   3,   1,   2,   2,   0,   2, 
    2,   2,   3,   2,   0,   1,   3,   2,   2,   1,   1,   1,   0,   2,   2,   3,   3,   2,   0,   3, 
    0,   0,   1,   0,   3,   2,   2,   3,   3,   3,   0,   2,   2,   3,   0,   1,   3,   3,   1,   2, 
    1,   3,   3,   2,   3,   3,   3,   3,   0,   3,   0,   0,   1,   1,   2,   0,   3,   0,   2,   0, 
    1,   3,   3,   3,   3,   2,   1,   0,   1,   3,   3,   3,   3,   1,   1,   0,   0,   2,   3,   3, 
    2,   0,   2,   1,   1,   0,   3,   2,   2,   1,   3,   1,   2,   3,   0,   3,   3,   0,   2,   0, 
    3,   1,   1,   1,   2,   3,   0,   3,   2,   0,   1,   3,   1,   1,   1,   0,   3,   3,   2,   1, 
    1,   3,   2,   3,   1,   3,   0,   1,   3,   0,   0,   3,   1,   1,   2,   0,   2,   1,   1,   3, 
    1,   0,   2,   3,   1,   3,   3,   1,   1,   0,   3,   3,   3,   2,   2,   3,   1,   0,   2,   3, 
    0,   1,   2,   0,   2,   3,   1,   3,   3,   0,   1,   1,   2,   2,   1,   1,   0,   1,   2,   1, 
    0,   1,   2,   0,   0,   2,   2,   0,   2,   2,   1,   1,   0,   0,   3,   0,   2,   3,   3,   1, 
    0,   0,   0,   2,   3,   2,   0,   2,   1,   1,   3,   0,   1,   2,   1,   3,   3,   2,   0,   3, 
    3,   0,   1,   2,   2,   1,   2,   1,   0,   2,   1,   3,   1,   0,   0,   3,   1,   2,   3,   1, 
    0,   3,   3,   2,   2,   2,   2,   3,   1,   1,   1,   3,   1,   1,   3,   2,   2,   3,   0,   3, 
    1,   3,   3,   3,   0,   3,   0,   3,   1,   3,   2,   2,   2,   1,   1,   0,   2,   0,   2,   3, 
    1,   2,   2,   1,   1,   0,   2,   0,   2,   0,   2,   3,   2,   2,   2,   2,   3,   3,   2,   1, 
    3,   1,   3,   2,   1,   3,   1,   0,   0,   1,   0,   2,   0,   0,   0,   3,   2,   2,   2,   3, 
    2,   1,   2,   3,   2,   2,   0,   2,   1,   3,   1,   1,   0,   3,   0,   1,   2,   2,   0,   2, 
    0,   0,   3,   1,   2,   3,   0,   3,   2,   0,   3,   2,   0,   1,   1,   2,   3,   3,   1,   3, 
    0,   3,   0,   0,   1,   3,   0,   1,   3,   0,   3,   2,   3,   2,   2,   3,   0,   2,   2,   2, 
    2,   1,   0,   3,   2,   3,   2,   0,   2,   3,   3,   2,   2,   3,   0,   2,   0,   2,   2,   1, 
    0,   0,   3,   3,   2,   2,   1,   0,   0,   1,   3,   1,   2,   2,   1,   2,   0,   0,   3,   3, 
    0,   3,   0,   3,   1,   1,   3,   0,   0,   1,   3,   2,   0,   0,   2,   3,   0,   1,   0,   1, 
    0,   0,   2,   2,   3,   3,   0,   3,   2,   3,   0,   0,   1,   0,   1,   2,   1,   3,   1,   2, 
    1,   2,   3,   2,   0,   3,   1,   1,   2,   1,   1,   2,   1,   0,   3,   2,   3,   1,   0,   0, 
    3,   1,   1,   1,   1,   0,   0,   2,   0,   1,   2,   3,   3,   1,   0,   1,   3,   1,   3,   3, 
    1,   2,   0,   1,   1,   3,   2,   2,   2,   3,   3,   1,   3,   0,   2,   2,   2,   0,   2,   1, 
    2,   3,   3,   0,   1,   2,   3,   2,   0,   2,   2,   1,   0,   1,   1,   1,   0,   2,   3,   1, 
    0,   0,   1,   1,   3,   2,   1,   2,   3,   0,   3,   3,   1,   3,   1,   0,   1,   1,   3,   2
};

static data_t verify_data[ARRAY_SIZE] = 
{
   74,  96,  98,  94,  78,  87, 100,  80,  83,  83, 117, 104, 113,  83,  71,  86,  83,  98,  75,  82, 
   77, 102,  90, 101,  85,  88,  79,  93, 117,  98,  79,  81,  74, 112,  77, 101,  96,  89,  89,  59, 
  111, 118,  79, 104,  99,  68,  50,  75,  74,  70,  96, 122, 125, 140, 113, 135, 135, 123, 134, 132, 
  152, 137, 143, 124, 118, 121, 125, 154, 131, 129, 118, 143, 123, 144, 114, 112, 128, 137, 133, 133, 
  100, 119, 133, 167, 121, 157, 130, 121, 108, 104, 139, 145, 114, 146, 108,  99, 119, 102, 109,  89, 
  108, 107, 119, 140, 120, 141, 155, 129, 127, 129, 148, 144, 143, 127, 108, 130, 108, 134, 117, 132, 
  117, 144, 121, 123, 115, 115, 119, 134, 131, 145, 100, 126, 112, 147, 134, 141, 124, 139, 111, 115, 
  143, 158, 119, 144, 121, 102,  99, 101, 114, 109, 117, 138, 142, 146, 133, 154, 136, 141, 148, 140, 
  163, 132, 162, 145, 131, 119, 134, 160, 118, 135, 133, 159, 148, 148, 131, 135, 139, 145, 158, 145, 
   95, 135, 142, 155, 143, 166, 130, 148, 125, 127, 155, 146, 135, 165, 149, 115, 110, 116, 125, 116, 
   93, 133, 119, 122, 105, 134, 132, 128, 117, 117, 133, 122, 142, 112, 120, 117, 115, 131,  99, 120, 
  117, 143, 108, 130,  99, 107, 113, 118, 117, 130, 102, 133, 141, 147, 123, 145, 140, 120, 122, 105, 
  114, 119, 106, 143, 138, 105, 106,  96, 104, 101, 104, 154, 126, 148, 134, 165, 148, 135, 129, 124, 
  169, 136, 156, 111, 141, 153, 116, 146, 133, 157, 128, 133, 123, 148, 125, 116, 136, 143, 134, 147, 
  127, 140, 136, 150, 128, 147, 145, 157, 118, 101, 154, 138, 118, 159, 134, 134, 102, 101, 127, 122, 
   92, 126, 117, 139, 120, 113, 129, 133, 128, 112, 145, 136, 140, 107,  99, 103, 108, 132, 110, 112, 
  112, 132, 113, 130, 104,  97, 121, 127, 128, 131,  92, 116, 134, 141, 111, 146, 122, 100, 110, 110, 
  136, 135, 119, 134, 119, 114,  89, 105, 106, 111,  80,  99,  87,  97,  83,  87, 100, 110,  86,  84, 
  124,  92,  97,  97,  71,  97,  81,  92,  74,  82,  94, 118,  93, 102,  94,  95,  93, 115, 114, 119, 
   81, 109,  89, 108, 104, 117, 103,  88,  85,  86, 118, 135,  91,  86, 106,  69,  74,  90,  78,  93, 
  106, 139, 136, 138, 121, 160, 141, 142, 150, 138, 162, 143, 158, 131, 124, 143, 144, 147, 115, 135, 
  134, 155, 126, 158, 128, 121, 139, 140, 143, 148, 116, 141, 139, 162, 154, 175, 137, 161, 131, 113, 
  160, 161, 124, 163, 142, 114, 106, 121, 131, 140, 102, 109, 109, 112, 104, 108, 117, 115, 121, 108, 
  128, 102, 121,  87,  97,  90,  97, 114, 106, 102,  98, 103,  99, 115,  86,  85, 105, 103, 131, 109, 
   87, 112, 106, 128, 100, 132, 120, 108,  92,  80, 119, 122,  90, 122, 111,  81,  96,  92, 106, 112, 
   87, 112,  90, 108, 104, 110, 125, 121, 117, 104, 143, 125, 129, 104, 102, 104,  93, 125, 107, 104, 
  100, 119,  99, 122,  98,  84, 118, 116, 124, 121,  96, 117, 112, 136,  97, 128, 119,  86,  97,  95, 
  126, 133, 108, 124, 110,  90, 100,  89, 102,  87,  85, 122,  97, 108, 102, 129, 129, 126, 117, 106, 
  131, 116, 131, 114, 117, 114, 104, 127, 107, 117,  99, 132, 107, 125, 119,  91, 111, 104, 121, 119, 
   85, 106, 123, 137,  97, 126, 111, 120,  93,  94, 128, 117, 126, 144, 103,  96, 104,  80, 109, 108, 
   84, 146, 122, 128, 109, 145, 130, 137, 143, 117, 162, 152, 160, 126, 128, 134, 129, 153, 105, 128, 
  127, 138, 126, 146, 126, 109, 124, 134, 140, 152, 115, 139, 130, 156, 117, 159, 135, 131, 123,  97, 
  149, 137, 119, 160, 133, 111, 111, 104, 115, 107,  99, 148, 109, 138, 128, 122, 140, 127, 134, 131, 
  145, 124, 150, 128, 117, 133, 106, 146, 122, 117, 122, 143, 127, 139, 118, 102, 121, 135, 127, 147, 
  100, 129, 141, 157, 109, 168, 143, 128, 106, 103, 146, 142,  91, 135, 134, 105, 120, 117, 111, 108, 
   81, 127, 128, 135, 119, 155, 144, 129, 147, 115, 145, 141, 144, 121, 130, 109, 125, 140, 116, 109, 
  106, 147, 125, 139, 114, 116, 121, 124, 134, 132, 100, 124, 143, 155, 115, 137, 136, 138, 125,  97, 
  133, 143, 110, 154, 120, 105, 100, 127, 110, 106,  73, 130,  93,  98, 114, 103, 118, 115, 120,  99, 
  123, 107, 143, 122,  90, 111,  89, 133, 113, 109,  97, 123, 113, 113, 104,  85, 114, 114, 114, 122, 
   81, 113, 128, 138, 104, 145, 124, 113, 104,  95, 115, 103, 104, 126, 120,  92, 103, 101, 101,  92, 
   83, 123,  99, 107, 104, 144, 122, 137, 105, 124, 131,  94, 117, 110, 101, 117,  88, 111, 115, 123, 
  103, 126, 117, 108,  98,  99, 124, 116, 120, 113,  89, 112, 130, 130, 114, 132, 121, 129, 104, 102, 
  133, 133, 115, 104, 124, 105,  85, 110,  92, 113, 122, 142, 117, 135, 130, 151, 140, 129, 146, 116, 
  156, 138, 149, 131, 111, 136, 105, 137, 129, 128, 111, 136, 113, 149, 111, 118, 132, 131, 137, 157, 
  112, 130, 151, 165, 130, 162, 131, 145, 118, 118, 149, 144, 137, 147, 134, 109, 111, 135, 120, 139, 
   69,  76,  81,  88,  83,  96,  98,  85, 100,  80,  83,  90, 109, 104,  85,  90,  88, 102,  72,  77, 
   85, 103,  83,  88,  73,  80,  73,  89,  79,  94,  63,  97,  98, 113,  75,  88,  85,  91,  78,  86, 
   84,  88,  89, 108,  98,  77,  88,  75,  71,  76,  79, 119,  83,  92, 104, 116, 117,  97, 109,  86, 
  129, 111, 129, 123,  88, 115, 100, 119,  98,  96, 108, 118,  81, 114, 112,  89,  95,  98, 114, 118, 
   79,  96, 116, 125, 102, 127, 104, 105,  79,  82, 122, 121, 114, 141, 101,  85,  94,  86, 101,  97, 
  104, 138, 130, 129, 122, 151, 141, 126, 128, 133, 156, 140, 149, 133, 126, 135, 112, 140, 110, 119, 
  115, 148, 135, 126, 118, 107, 118, 124, 139, 150,  96, 127, 144, 150, 117, 139, 140, 143, 126, 113, 
  146, 134, 103, 148, 138, 121, 107, 113, 124, 106,  95, 117, 101, 114, 102, 125, 117, 125, 116, 106, 
  139, 119, 129, 109, 112, 117, 104, 130, 103, 110, 114, 124, 112, 117, 116, 107, 121, 126, 142, 126, 
   89, 123, 107, 129, 115, 142, 114, 125, 111,  96, 113, 119, 106, 120, 113,  97,  86,  99, 105, 105, 
  111, 132, 124, 132, 114, 149, 141, 140, 140, 131, 163, 139, 150, 107, 110, 113, 109, 143,  99, 147, 
  118, 134, 127, 136, 125, 116, 129, 140, 141, 126,  90, 126, 145, 151, 123, 157, 138, 135, 121, 119, 
  157, 147, 126, 139, 122, 109, 109, 124, 122, 124, 102, 135, 122, 124, 120, 135, 136, 125, 136, 110, 
  148, 151, 157, 135, 124, 137, 126, 139,  96, 112, 118, 151, 111, 148, 113, 110, 111, 121, 132, 163, 
  115, 131, 129, 155, 122, 143, 125, 114, 119, 116, 139, 131, 124, 172, 149, 104, 109, 101, 118, 102, 
  124, 134, 128, 147, 118, 157, 131, 134, 129, 113, 167, 137, 153, 111, 121, 128, 114, 144, 126, 127, 
  124, 130, 124, 146, 111, 117, 133, 116, 142, 137, 114, 140, 138, 158, 114, 145, 123, 141, 115, 105, 
  151, 151, 120, 152, 128, 113, 109, 100, 118, 118,  42,  77,  71,  70,  72, 102,  69,  72,  78,  63, 
  106,  74,  93,  82,  73,  83,  72,  86,  64,  71,  82,  86,  60,  93,  71,  83,  76,  78,  74,  80, 
   70,  83,  88,  87,  79,  83,  78,  76,  64,  64,  83,  88,  74,  96,  72,  76,  50,  63,  61,  64, 
  100, 131, 109, 109,  95, 139, 124, 137, 133, 122, 130, 111, 125, 119, 124, 100, 117, 118, 101, 106, 
  115, 131, 105, 128, 104, 101, 122, 103, 126, 118,  83, 112, 122, 127, 123, 145, 112, 132, 118,  96, 
  121, 125, 115, 142, 141,  98,  92, 106, 112, 119,  77, 101,  80,  83,  95, 118,  99,  91,  95,  84, 
  124, 110, 110,  97,  94,  97,  96, 103,  72,  94,  98, 103,  91,  98,  95,  93,  91, 109, 100, 105, 
   73, 111, 101,  99,  99, 114,  90,  99,  86,  95, 107, 104,  83, 102,  93,  83,  83,  83,  88,  76, 
  104, 147, 129, 126, 128, 158, 147, 148, 135, 124, 173, 132, 169, 142, 127, 148, 130, 153, 118, 150, 
  129, 154, 126, 153, 135, 125, 129, 135, 153, 138, 114, 133, 145, 157, 141, 169, 133, 151, 133, 110, 
  159, 156, 132, 161, 139, 122, 112, 123, 115, 136,  90, 125, 103, 127, 106, 131, 136, 125, 128, 111, 
  157, 133, 138, 113, 111, 103, 101, 142, 107,  98, 105, 123, 115, 132, 116, 121, 123, 121, 131, 132, 
   82, 127, 125, 149,  91, 135, 128, 119, 104,  88, 137, 148, 107, 137, 126,  88,  92, 110, 114,  94, 
   98, 120, 113, 122,  91, 121, 118, 137, 117, 108, 129, 116, 129,  89, 106, 109,  87, 132, 103, 112, 
   90, 101, 107, 131,  98, 101, 112, 115, 112, 114,  96, 112, 107, 132,  97, 140, 130,  98, 117, 101, 
  134, 130, 113, 126, 116,  93,  88,  99,  97,  93,  86,  94,  92, 121, 108, 129, 110, 111, 110,  97, 
  126, 102, 121, 101, 102,  88,  86, 127, 100,  94,  90, 116, 115, 140,  99, 122,  95, 111, 115, 128, 
   71, 122, 126, 128, 101, 125, 100, 119,  88,  96, 107, 116,  90, 118, 114,  87,  91, 100,  76,  78, 
  122, 149, 129, 145, 127, 159, 145, 132, 140, 118, 179, 148, 167, 115, 122, 128, 117, 151, 129, 151, 
  128, 124, 131, 149, 102, 122, 136, 153, 150, 152, 107, 151, 139, 150, 132, 164, 140, 155, 131, 108, 
  153, 151, 116, 152, 145, 119, 107, 122, 117, 122,  72, 126, 111,  96, 104, 137, 124, 117, 114, 118, 
  139, 113, 126, 101, 111, 110,  94, 107,  94, 118, 120, 108,  89, 107,  97,  95, 111, 112, 106, 108, 
   84, 112, 117, 126,  91, 128, 116,  96, 111,  91, 123, 120, 103, 126, 117, 109,  69, 103, 107, 102, 
   88, 107, 118, 110,  98, 114,  96,  77,  99, 103, 120, 121, 125,  96,  90, 101,  96, 102,  82,  98, 
  103, 116, 100,  97,  94,  87,  83, 102, 104, 115,  83, 104,  99, 115,  94, 113,  89, 109, 100,  96, 
  121, 109,  88, 113,  92,  81,  84,  77,  94,  72,  93, 135, 140, 134, 109, 149, 127, 135, 138, 121, 
  154, 135, 151, 123, 117, 116, 114, 142, 104, 131, 110, 148, 132, 142, 106, 115, 114, 124, 138, 140, 
  103, 105, 147, 145, 132, 143, 133, 136, 124,  98, 148, 141, 117, 154, 130, 125, 101, 112,  98, 116, 
   91, 116,  96, 141, 128, 132, 118, 123, 133, 110, 137, 122, 124, 114, 105, 114,  97, 153, 115, 110, 
  100, 124, 119, 138, 107, 112, 135, 128, 121, 146, 109, 113, 128, 142, 125, 138, 125, 114,  94, 113, 
  128, 120, 106, 134, 111,  92, 100, 107, 107,  87,  83, 103, 102, 114,  98, 114,  97, 112, 117, 102, 
  100,  98, 119, 103, 101, 114,  80, 115, 109, 109,  81, 110,  98, 120,  86,  83, 105,  94,  89, 124, 
   94,  96, 107, 123, 109, 125,  88, 129,  99,  89, 114,  95, 102, 124, 103,  88,  93,  83,  93,  99, 
   97, 111, 123, 128,  97, 118, 122, 127, 117, 112, 149, 118, 140, 100, 114, 113, 103, 137, 106, 106, 
  109, 116, 122, 120, 101, 105, 118, 115, 118, 118,  88, 135, 109, 141,  93, 122, 123, 111, 121,  98, 
  125, 128,  96, 143, 126, 104,  95,  90, 115,  89,  80, 119, 113, 103,  97, 108, 100,  99, 122,  74, 
  130, 113, 122, 102,  74, 109,  89, 114, 110,  88,  95, 107, 108, 115, 105, 104,  91, 105, 110, 125, 
   82,  98, 118, 121, 112, 137, 109, 114, 102,  83, 114, 122,  97, 117,  93,  87,  90,  95,  88,  98, 
   96, 122, 105, 116, 117, 142, 138, 141, 135, 114, 136, 108, 131, 120, 109, 120,  97, 141, 115, 116, 
   92, 116, 108, 134, 117, 114, 112, 122, 125, 121,  78, 119, 135, 147, 109, 138, 139, 120, 108, 109, 
  147, 131, 124, 142, 114,  99,  98, 115, 114, 103,  69,  98,  78,  83, 100, 117, 119,  98, 108,  92, 
  113, 109, 114,  98,  84,  86,  84, 102,  78,  96,  79, 116,  90, 109,  86,  87,  88,  89, 113, 112, 
   59,  81, 120, 106, 101, 108,  94, 112,  79,  84,  98, 101,  85, 112, 102,  83,  85,  88,  88,  92, 
   92, 132, 116, 124, 102, 141, 122, 128, 119, 117, 130, 120, 123, 116, 106,  99, 109, 109, 102, 125, 
  105, 129, 108, 120, 110, 100, 109,  90, 113, 112,  96, 100, 130, 130, 126, 144, 121, 130, 110, 103, 
  121, 118, 112, 134, 122, 112,  91, 101,  95, 120,  87, 118, 108, 120, 115, 137, 122, 127, 130, 104, 
  146, 129, 142, 125, 114, 101, 107, 126, 110, 120, 101, 137, 107, 127, 105, 118, 113,  99, 127, 118, 
   80,  96, 129, 138, 116, 135,  93, 144, 104,  85, 131, 123, 105, 142, 118, 118,  90,  87,  89, 110, 
   98, 116, 134, 127,  98, 123, 111, 118, 125, 106, 149, 132, 140, 106, 111, 113, 108, 132,  88, 113, 
  112, 127, 117, 145, 110, 119, 105, 116, 127, 133, 109, 131, 117, 142, 108, 129, 118, 122, 132,  97, 
  125, 134, 103, 139, 125, 102,  86,  97, 104,  95, 109, 145, 114, 127, 110, 144, 127, 136, 130, 130, 
  149, 132, 147, 135, 115, 138, 120, 131,  96, 121, 110, 153, 114, 143, 130,  97, 125, 118, 139, 147, 
  103, 121, 140, 152, 134, 160, 124, 144, 122, 109, 166, 142, 137, 154, 142, 112, 105, 119, 121, 134, 
   67, 103, 109, 116, 103, 109, 118, 117, 130, 108, 141, 127, 138, 100,  82,  97,  83, 122, 104,  98, 
   86, 123, 116, 111, 105, 100,  95,  95, 120, 118,  73,  88, 122, 141,  88, 120, 104, 110,  97,  77, 
  134, 130,  99, 129, 108, 105,  80,  90,  91,  88,  93, 128, 132, 129, 107, 120, 134, 115, 114, 120, 
  146, 135, 149, 128, 117, 119, 129, 140,  95, 116, 119, 149, 119, 149, 116, 104, 113, 131, 131, 138, 
   91, 120, 127, 142, 125, 156, 122, 117, 116,  95, 130, 135, 104, 145, 116,  94, 111, 112, 108, 106, 
   69, 127, 110, 112, 101, 143, 140, 117, 127, 121, 144, 113, 143, 120, 124, 100, 108, 140, 103, 128, 
  117, 134, 109, 141, 101, 113, 109, 126, 127, 124,  90, 120, 132, 132, 114, 139, 133, 132, 115,  85, 
  112, 136,  99, 145, 127,  97,  94, 104,  96,  95,  79, 106,  99, 112,  92, 111, 101, 115, 118,  95, 
  122, 102, 118, 118,  95, 100,  81, 115,  89,  87, 101, 124, 105, 112, 106,  92, 100,  84, 102, 126, 
   99, 107, 101, 119, 113, 119, 110, 111, 101,  92, 112, 121,  90, 124, 111,  86,  97,  77,  86,  96
};


#endif //__DATASET_H