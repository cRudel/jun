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
    FILE *fp = fopen(filename, "rb");
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
      free(str);
      free(arr);    
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
        i++;
    }
    //printf("%ld\n", i);
    arrLength = i;
    free(str);
    fclose(fp);

    return arr;
}

void heap(int* arr, int n, int i){
  int largest = i;
  int l = 2*i + 1;
  int r = 2*i + 2;

  if(l<n && arr[l] > arr[largest]){
    largest = l;
  }

  if (r < n && arr[r] > arr[largest]){
    largest = r;
  }
  if(largest != i){
    //swap
    int temp = arr[i];
    arr[i] = arr[largest];
    arr[largest] = temp;
    heap(arr, n, largest);
  }

}

void heapSort(int* arr, int n){
    for(int i=(int)n/2-1; i>=0; i--){
      heap(arr, n, i);
    }

    for(int i=n-1; i>=0; i--){
      //swap 
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;

      heap(arr, i, 0);
    }
}


void outputToFile(int* nums, char* file){
  /*printf("output:\n");
  char str[20];
  for(int i=0; i<arrLength; i++){
    snprintf(str, 10, "%d", nums[i]);
  }*/
  FILE *fp = fopen(file, "wb");
  if(fp == NULL){
      printf("Cannot open file due to error %d\n", errno);
      exit(EXIT_FAILURE);
  }
  /*
  char str[20];
  for(int i=0; i<arrLength; i++){
	  snprintf(str, 10, "%d\n", nums[i]);
  	fputs(str, fp);
  }*/

  fwrite(nums, sizeof(int), arrLength, fp);
  fclose(fp);
}

int main(int argc, char** argv){
    if(argc != 3){
        printf("Please specify 2 arguments. Usage: ./sort <inputfile> <outputfile>\n");
        exit(EXIT_FAILURE);
    }
    arrLength = 0;
    int *myNums = readIntoArray(argv[1]);

    heapSort(myNums, arrLength); /*
    printf("sorted:\n");
    for(ulong i=0; i<arrLength; i++){
      printf("%lu: %d\n", i, myNums[i]);
    }
    */

    outputToFile(myNums, argv[2]);
    free(myNums);
    return 0;
}
