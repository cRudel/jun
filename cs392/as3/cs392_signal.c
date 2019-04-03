/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   cs392_signal.c
*   I pledge my honor that I have abided by the Stevens Honor System
*
*/

#include "cs392_signal.h"


int var = 0;
int receivedSignal(){
    return var;
}

void hdl(int sig, siginfo_t *siginfo, void* context){
    printf ("\nReceived a signal, to exit type 'exit'\n");
    var = 1;
    receivedSignal();
}

void handleSignal(){
    
    struct sigaction act;
    memset(&act, '\0', sizeof(act));

    act.sa_sigaction = &hdl;
    act.sa_flags = SA_SIGINFO;

    if(sigaction(SIGINT, &act, NULL) < 0){
        perror("sigaction");
        }

    /*
    if(sigaction(SIGTSTP, &act, NULL) < 0){
        perror("sigaction");
        }
    */
}