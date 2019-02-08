#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    if(argc < 2){
        printf("Please specify the filename\n");
        return 1;
    }
    char *ptr = NULL;
    size_t sz = 0;
    ssize_t read;
    FILE *fp = fopen(argv[1], "r");
    if(fp == NULL){
        exit(EXIT_FAILURE);
    }
    while((read = getline(&ptr, &sz, fp)) != -1){
        printf("%s", ptr);
    }
    puts("");
    fclose(fp);
    if(ptr){
        free(ptr);
    }
    return 0;
}


// logic
// check commandline for filename
// open the file and then check if that works
    // if not; notify user
//use a loop: read every line from the file and then print to the screen
    //how to do read; how to print