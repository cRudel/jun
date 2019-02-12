/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   sort.h
*   I pledge my honor that I have abided by the Stevens Honor System
*
*/
#ifndef SORT_H
#define SORT_H
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

typedef unsigned int uint;
typedef unsigned long ulong;

int* readIntoArray(char*);
void heapSort(int*, int);
void convertNums(int*,int);
void outputToFile(int*, char*);

#endif