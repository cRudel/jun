/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   cs392_log.c
*   I pledge my honor that I have abided by the Stevens Honor System Christopher Rudel
*
*/

#include "cs392_log.h"

void cs392_socket_log(char* ipAdd, int portNum){
    FILE *fp;
    if( (fp = fopen("cs392_shell.log","a")) == NULL){
        perror("Error Opening cs392_echo.log\n");
        exit(EXIT_FAILURE);
    }else{
        fprintf(fp,"IP address: %s, port number: %d\n", ipAdd, portNum);
    }
    fclose(fp);
    return;
}