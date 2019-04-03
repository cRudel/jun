/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   cs392_log.c
*   I pledge my honor that I have abided by the Stevens Honor System
*
*/

#include "cs392_log.h"
void writeToLog(char* str){
    FILE *fp;
    fp = fopen("cs392_shell.log", "a");
    if(fp == NULL){
        perror("Error opening file.\n");
    }else{
        fprintf(fp, "%s\n", str);
    }
    fclose(fp);
}
