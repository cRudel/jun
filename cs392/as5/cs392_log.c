//cs392_log.c
//Theodore Jagodits CS392 HW 5
//"I pledge my honor that I have abided by the Stevens Honor System"

#include"cs392_log.h"

void cs392_socket_log(char* ip, int port){
    FILE *f;
    f = fopen("cs392_shell.log","a");
    if(f == NULL){
        perror("Error Opening cs392_echo.log\n");
        
    }else{
        fprintf(f,"IP: %s - PORT: %d\n",ip,port);
    }
    fclose(f);
}