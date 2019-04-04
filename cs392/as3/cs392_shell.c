/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   cs392_shell.c
*   I pledge my honor that I have abided by the Stevens Honor System
*
*/

#include <stdlib.h>
#include "cs392_exec.h"
#include "cs392_log.h"
#include "cs392_signal.h"

#define BUFF 256


int main(){

    char buffer[BUFF];
    int readIn;
    int i;
    
    while(1){
        handleSignal();
        printf("cs392_shell $: ");
        fflush(stdout); //The above print statement doesn't have a newline character so you need to flush it out
        
        // below read(0, ...) is equivalent to read(stdin,...)
        if( (readIn = read(0, buffer, BUFF-1)) < 0){
            if(errno == EINTR){     //received signal, ignore current read and continue
                continue;
            }else{
                perror("Error reading in.\n");
                exit(1);
            }
        }
        //printf("%d\n", readIn);
        buffer[readIn-1] = '\0';
        //printf("Received command: %s\n", buffer);
        writeToLog(buffer);
        executeCommands(buffer);
    }
    return 0;
}