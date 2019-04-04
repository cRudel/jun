/*
*   Christopher Rudel
*   Professor Xu
*   CS 392
*   cs392_signal.c
*   I pledge my honor that I have abided by the Stevens Honor System
*
*/

#include "cs392_signal.h"

void hdl(int sig, siginfo_t *siginfo, void* context){
    if(sig == SIGINT){
        printf ("\nReceived a signal, to exit type 'exit'\n");
    }
    if(sig == SIGTSTP){
        printf ("\nReceived a signal, to exit type 'exit'\n");
    }
}

void handleSignal(){
    struct sigaction act;
    memset(&act, '\0', sizeof(act));

    act.sa_sigaction = &hdl;
    act.sa_flags = SA_SIGINFO;

    if(sigaction(SIGINT, &act, NULL) < 0){
        perror("sigaction");
        }
    if(sigaction(SIGTSTP, &act, NULL) < 0){
        perror("sigaction");
        }
}