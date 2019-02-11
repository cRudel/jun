/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   sort.c
*   I pledge my honor that I have abided by the Stevens Honor System
*
*/

#include "sort.h"

ulong arrLength;

int* readIntoArray(char* filename){
    char* str;
    int* arr;
    size_t sz;
    FILE *fp = fopen(filename, "r");
    if(fp == NULL){
        printf("Cannot open file due to error %d\n", errno);
        exit(EXIT_FAILURE);
    }
    fseek(fp, 0L, SEEK_END);
    sz = ftell(fp);  
    rewind(fp);
    str = malloc(sz+1);           
    arr = malloc(sz+1);
    if(str == NULL || arr == NULL){
      printf("Malloc failed due to %d, exiting...\n", errno);    
      exit(EXIT_FAILURE);
    }
    
    for(size_t i=0; i<sz+1; i++){     
      str[i] = 0;              
    }
    
    size_t i = 0;
    while(fgets(str, sz, fp) != NULL){        
        if (ferror(fp)){       
            printf("Cannot read data due to %d\n", errno);
        }
        arr[i] = atoi(str);
      //  printf("%lu: %d\n", i, arr[i]);
        i++;
    }
    printf("%ld\n", i);
    arrLength = i;
    free(str);
    fclose(fp);

    return arr;
}

void heap(int arr[], int n, int i){

}

void heapSort(int arr[], int n){
    
}


void outputToFile(int* nums, char* file){

}

int main(int argc, char** argv){
    if(argc != 3){
        printf("Please specify 2 arguments. Usage: ./sort <inputfile> <outputfile>\n");
        exit(EXIT_FAILURE);
    }
    arrLength = 0;
    int *myNums = readIntoArray(argv[1]);

    printf("%d\n", myNums[99998]);

    for(ulong i=0; i<arrLength; i++){
      printf("%lu: %d\n", i, myNums[i]);
    }

    outputToFile(myNums, argv[2]);
    free(myNums);
    return 0;
}